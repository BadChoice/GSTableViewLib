//
//  GSTableViewSection.m
//  Taste
//
//  Created by Badchoice on 12/05/14.
//  Copyright (c) 2014 Gloobus Studio. All rights reserved.
//

#import "GSTableViewSection.h"
#import "GSBaseCell.h"
#import "GSTextFieldCell.h"
#import "GSLabelCell.h"
#import "GSDetailCell.h"
#import "GSTableViewController.h"

#import <objc/runtime.h>

@implementation GSTableViewSection

-(id)init{
    if(self = [super init]){
        _cells = [[NSMutableArray alloc] init];
    }
    
    return self;
}


//================================================
#pragma mark - AUTOMATIC TABLE GENERATION
//================================================
+(GSTableViewSection*)createSectionForModel:(Class)class andObject:(NSObject*)object{
    
	if([object respondsToSelector:@selector(createTableViewSection)]){
		return [object performSelector:@selector(createTableViewSection)];
	}
	
    GSTableViewSection* section = [[GSTableViewSection alloc] init];
    
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList(class, &outCount);
    for (i = 0; i < outCount; i++) {
        objc_property_t property	= properties[i];
        NSString *propertyName		= [[NSString alloc] initWithUTF8String:property_getName(property)];
        const char * type			= property_getAttributes(property);
        
        NSString * typeString		= [NSString stringWithUTF8String:type];
        NSArray * attributes		= [typeString componentsSeparatedByString:@","];
        NSString * typeAttribute	= [attributes objectAtIndex:0];
        typeAttribute				= [typeAttribute substringFromIndex:3];
        typeAttribute				= [typeAttribute substringToIndex:[typeAttribute length] -1];
        
        //NSLog(@"Property name:%@ And type: %@", propertyName,typeAttribute);
        
        [section.cells addObject:[GSTextFieldCell cellWithText:propertyName andObject:object andKey:propertyName]];
        
    }
    free(properties);
    
    return section;
}

+(GSTableViewSection*)createSectionForModelArray:(NSArray*)modelArray withDetail:(BOOL)withDetail ofObject:(Class)class{
	return [GSTableViewSection createSectionForModelArray:modelArray withDetail:withDetail ofObject:class withNullText:nil];
}

	
+(GSTableViewSection*)createSectionForModelArray:(NSArray*)modelArray
                                      withDetail:(BOOL)withDetail
                                        ofObject:(Class)class
                                    withNullText:(NSString *)nullText {
    
    GSTableViewSection* section = [[GSTableViewSection alloc] init];
    
    if(nullText != nil){
		GSLabelCell* cell = [GSLabelCell cellWithText:nullText];
		[section.cells addObject:cell];
	}
	
    for(NSObject *model in modelArray){
        GSBaseCell* cell;
        
        if(withDetail){
            GSTableViewController* controller = [[GSTableViewController alloc] init];
            [controller.sections addObject:[GSTableViewSection createSectionForModel:class andObject:model]];
            cell = [GSDetailCell cellWithText:[model valueForKey:@"name"] andController:controller];
        }
        else{
            cell = [GSLabelCell cellWithText:[model valueForKey:@"name"]];
        }
		
		@try{
			NSString* imageSrc = [model valueForKey:@"photo"];
			if(imageSrc != nil && ![imageSrc isEqualToString:@""]){
				[cell.image loadImageFromServer:imageSrc];
				[cell updateLayout];
			}
		}
		@catch(NSException *e){
			
		}
        [section.cells addObject:cell];
    }
	

    
    return section;
}

+(GSTableViewSection*)createSectionFromDefinition:(NSArray*)definitions{
    GSTableViewSection* section = [[GSTableViewSection alloc] init];
    
    for(NSDictionary* def in definitions){
        if([def[@"type"] integerValue] == GSCellTypeTextField){
            [section.cells addObject:[GSTextFieldCell cellWithText:def[@"label"]
                                                         andObject:def[@"object"]
                                                            andKey:def[@"key"]]];
        }
    }
    return section;
}


-(void)dealloc{
    self.cells = nil;
}


@end
