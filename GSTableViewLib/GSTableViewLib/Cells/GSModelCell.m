//
//  GSModelCell.m
//  Idesuku
//
//  Created by MACJordi on 03/07/14.
//  Copyright (c) 2014 idesuku. All rights reserved.
//

#import "GSModelCell.h"


@implementation GSModelCell

+(id)cellWithText:(NSString*)text andObject:(id)object andKey:(NSString*)key andModel:(NSObject*)model{
    GSModelCell* cell		= [self.class cellWithText:text andObject:object andKey:key];
	cell.model				= model;
    return cell;
}

-(void)setup{
	[super setup];
	[self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
}

-(void)onCellPressed:(UITableView*)tableView indexPath:(NSIndexPath*)index controller:(UIViewController*)controller{
		
	mSelectViewController				= [[GSTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
	mSelectViewController.gsDelegate	= self;
	
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(donePressed:)];
    mSelectViewController.navigationItem.rightBarButtonItem = anotherButton;
	
    GSTableViewSection* section			= [GSTableViewSection createSectionForModel:[self.model class] andObject:self.model];
	mSelectViewController.sections		= [NSMutableArray arrayWithObjects:section, nil];
	
	if(controller.navigationController != nil)
		[controller.navigationController pushViewController:mSelectViewController animated:YES];
	else
		[controller presentViewController:mSelectViewController animated:YES completion:nil];
}

-(void)donePressed:(id)sender{
    [self updateModelObject:self.model];
    if(mSelectViewController.navigationController != nil)
        [mSelectViewController.navigationController popViewControllerAnimated:YES];
    else{
        [mSelectViewController dismissViewControllerAnimated:YES completion:nil];
    }
}

//=====================================================
#pragma mark - TABLE VIEW CONTROLLER DELEGATE
#pragma mark -
//=====================================================
-(void)GSTableView:(id)tableViewController onCellPressed:(GSBaseCell*)cell atIndexPath:(NSIndexPath *)indexPath{
	/*if(mSelectViewController.navigationController != nil)
		[mSelectViewController.navigationController popViewControllerAnimated:YES];
	else{
		[mSelectViewController dismissViewControllerAnimated:YES completion:nil];
	}
	
	if(indexPath.row < [_modelsArray count]){
		self.label.text = [[_modelsArray objectAtIndex:indexPath.row] valueForKey:@"name"];
		
		if(self.object != nil && self.objectProperty!=nil){
			[self.object setValue:[_modelsArray objectAtIndex:indexPath.row] forKey:self.objectProperty];
		}
	}
	else{
		self.label.text = @"";
		if(self.object != nil && self.objectProperty!=nil){
			[self.object setValue:nil forKey:self.objectProperty];
		}
	}*/
}

-(void)updateLabel{
    //NSObject* object    = [self.object valueForKey:self.objectProperty];
    self.label.text     = @"";
}


//================================================
#pragma mark - TABLE VIEW DELEGATE
//================================================
-(void)dealloc{
    self.model = nil;
    mSelectViewController = nil;
}


@end
