//
//  GSSelectModelCell.m
//  Taste
//
//  Created by MACJordi on 16/05/14.
//  Copyright (c) 2014 Gloobus Studio. All rights reserved.
//

#import "GSSelectModelCell.h"
#import "GSControllerCell.h"

@implementation GSSelectModelCell

+(id)cellWithText:(NSString*)text andObject:(id)object andKey:(NSString*)key andModelsArray:(NSArray*)modelsArray{
    GSSelectModelCell* cell	= [self.class cellWithText:text andObject:object andKey:key];
	cell.modelsArray        = modelsArray;
    return cell;
}

-(void)setup{
	[super setup];
    self.nullText = @"--";
	[self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
}

-(void)onCellPressed:(UITableView*)tableView indexPath:(NSIndexPath*)index controller:(UIViewController*)controller{
	
	if(_isSearcheable){
		mSelectViewController = [[GSSearchTableViewViewController alloc] initWithStyle:UITableViewStyleGrouped];
	}else{
		mSelectViewController = [[GSTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
	}
	
	mSelectViewController.gsDelegate = self;
	
	[self createSubViewControllerSections];
	
	if(controller.navigationController != nil)
		[controller.navigationController pushViewController:mSelectViewController animated:YES];
	else
		[controller presentViewController:mSelectViewController animated:YES completion:nil];
}


-(void)createSubViewControllerSections{
	GSTableViewSection* section = [GSTableViewSection createSectionForModelArray:_modelsArray
																	  withDetail:NO
																		ofObject:nil
																	withNullText:self.nullText];
	
    [section.cells addObjectsFromArray:self.extraCells];
    
	//------------
    // Checkmark the selected discount
    //------------
    for(GSBaseCell* cell in section.cells){
		if(self.object != nil){
			if([[[self.object valueForKey:self.objectProperty] valueForKey:@"name"] isEqualToString:cell.text.text]){
				[cell setAccessoryType:UITableViewCellAccessoryCheckmark];
			}
		}
    }	
	mSelectViewController.sections = [NSMutableArray arrayWithObjects:section, nil];
}

//=====================================================
#pragma mark - TABLE VIEW CONTROLLER DELEGATE
#pragma mark -
//=====================================================
-(void)GSTableView:(id)tableViewController onCellPressed:(GSBaseCell*)cell atIndexPath:(NSIndexPath *)indexPath{

    if(indexPath.row == 0){
		self.label.text = @"";
		if(self.object != nil && self.objectProperty!=nil){
			[self.object setValue:nil forKey:self.objectProperty];
		}
        [self goBack];
    }
	else if(indexPath.row <= [_modelsArray count]){
		self.label.text = [[_modelsArray objectAtIndex:indexPath.row-1] valueForKey:@"name"];
		
		if(self.object != nil && self.objectProperty!=nil){
			[self.object setValue:[_modelsArray objectAtIndex:indexPath.row-1] forKey:self.objectProperty];
		}
        [self goBack];
	}
    
}

-(void)goBack{
    if(mSelectViewController.navigationController != nil)
        [mSelectViewController.navigationController popViewControllerAnimated:YES];
    else{
        [mSelectViewController dismissViewControllerAnimated:YES completion:nil];
    }

}

-(void)updateLabel{
    NSObject* object    = [self.object valueForKey:self.objectProperty];
    self.label.text     = [object valueForKey:@"name"];
}

//================================================
#pragma mark - TABLE VIEW DELEGATE
//================================================
-(void)dealloc{
    self.modelsArray = nil;
    self.extraCells  = nil;
    mSelectViewController = nil;
}


@end
