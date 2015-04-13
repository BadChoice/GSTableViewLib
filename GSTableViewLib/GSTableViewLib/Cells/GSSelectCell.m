//
//  GSSelectCell.m
//  Taste
//
//  Created by MACJordi on 13/05/14.
//  Copyright (c) 2014 Gloobus Studio. All rights reserved.
//

#import "GSSelectCell.h"

#import "GSTableViewSection.h"

@implementation GSSelectCell


//=================================================================
#pragma mark - CELL STATIC CREATION
#pragma mark -
//=================================================================
+(id)cellWithText:(NSString*)text andObject:(id)object andKey:(NSString*)key andSelect:(NSArray*)values{
	
	GSSelectCell* cell = [self.class cellWithText:text andObject:object andKey:key];
    cell.selectValues = values;
    return cell;
}

+(id)cellWithText:(NSString*)text andObject:(id)object andKey:(NSString*)key andSelect:(NSArray*)values andImages:(NSArray*)images{
    GSSelectCell* cell	= [self.class cellWithText:text andObject:object andKey:key andSelect:values];
    cell.images			= images;
    return cell;
}

+(id)cellWithText:(NSString*)text andObject:(id)object andKey:(NSString*)key andSelectDict:(NSDictionary*)values keyIsNumber:(BOOL)keyIsNumber{
	
	GSSelectCell* cell		= [self.class cellWithText:text andObject:object andKey:key];
	cell.keyIsNumber		= keyIsNumber;
    cell.selectValuesDict	= values;

	NSString* selectedKey;
	/*if(keyIsNumber){
        NSObject *object = [cell.object valueForKey:cell.objectProperty];
        if([object isKindOfClass:[NSString class]]){
            selectedKey = (NSString*)object;
        }
        else{
            selectedKey = [(NSNumber*)object stringValue];
        }
	}
	else{
		selectedKey = [cell.object valueForKey:cell.objectProperty];
	}*/
    selectedKey = [cell.object valueForKey:cell.objectProperty];
	cell.label.text = values[selectedKey];
	
    return cell;
}

+(id)cellWithText:(NSString*)text andObject:(id)object andKey:(NSString*)key andSelectDict:(NSDictionary*)values andImages:(NSArray*)images keyIsNumber:(BOOL)keyIsNumber{
	GSSelectCell* cell		= [self.class cellWithText:text andObject:object andKey:key andSelectDict:values keyIsNumber:keyIsNumber];
    cell.images				= images;
	cell.label.text			= values[[cell.object valueForKey:cell.objectProperty]];
    return cell;
}

//=================================================================
#pragma mark - SETUP
#pragma mark -
//=================================================================
-(void)setup{
	[super setup];
	[self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
}

-(void)onCellPressed:(UITableView*)tableView indexPath:(NSIndexPath*)index controller:(UIViewController*)controller{
	
	mSelectViewController = [[GSTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
	mSelectViewController.gsDelegate = self;
	
	GSTableViewSection* section = [[GSTableViewSection alloc] init];

    int i = 0;
	if(_selectValues != nil){
		for(NSString* value in _selectValues){
			GSLabelCell* cell = [GSLabelCell cellWithText:value];
			[section.cells addObject:cell];
			if([value isEqualToString:self.label.text]){
				[cell setAccessoryType:UITableViewCellAccessoryCheckmark];
			}
			
			if(_images != nil){
				cell.image.image = _images[i];
				[cell updateLayout];
			}
			i++;
		}
	}
	else{
		for(NSString* dictKey in [_selectValuesDict allKeys]){
			NSString* value		= _selectValuesDict[dictKey];
			GSLabelCell* cell	= [GSLabelCell cellWithText:value];
			[section.cells addObject:cell];

			NSObject* objectValue = [self.object valueForKey:self.objectProperty];
			NSString* stringToCompare;
			
			if(self.keyIsNumber){	stringToCompare = ([(NSNumber*)objectValue stringValue]);	}
			else				{   stringToCompare = ((NSString*)objectValue);					}
			
			if([dictKey isEqual:stringToCompare]){
				[cell setAccessoryType:UITableViewCellAccessoryCheckmark];
			}
			
			if(_images != nil){
				cell.image.image = _images[i];
				[cell updateLayout];
			}
			i++;
		}
	}
	
	mSelectViewController.sections = [NSMutableArray arrayWithObjects:section, nil];

	if(controller.navigationController != nil)
		[controller.navigationController pushViewController:mSelectViewController animated:YES];
	else
		[controller presentViewController:mSelectViewController animated:YES completion:nil];
}

//=====================================================
#pragma mark - TABLE VIEW CONTROLLER DELEGATE
#pragma mark -
//=====================================================
-(void)GSTableView:(id)tableViewController onCellPressed:(GSBaseCell*)cell atIndexPath:(NSIndexPath *)indexPath{
	if(mSelectViewController.navigationController != nil)
		[mSelectViewController.navigationController popViewControllerAnimated:YES];
	else{
		[mSelectViewController dismissViewControllerAnimated:YES completion:nil];
	}

	self.label.text = cell.text.text;
	if(_selectValuesDict != nil){
		NSString* object = [_selectValuesDict allKeys][indexPath.row];
		if(self.keyIsNumber){
			[self updateModelObject:@([object integerValue])];
		}
		else{
			[self updateModelObject:object];
		}
	}
	else{
		[self updateModelObject:self.label.text];
	}
}

//================================================
#pragma mark - TABLE VIEW DELEGATE
//================================================
-(void)dealloc{
    mSelectViewController   = nil;
    self.selectValues       = nil;
    self.selectValuesDict   = nil;
    self.images             = nil;
}


@end
