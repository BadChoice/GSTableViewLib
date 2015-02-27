//
//  GSControllerCell.m
//  Idesuku
//
//  Created by MACJordi on 04/07/14.
//  Copyright (c) 2014 idesuku. All rights reserved.
//

#import "GSControllerCell.h"

@implementation GSControllerCell

+(id)cellWithText:(NSString*)text andController:(UIViewController*)controller {
	GSControllerCell* cell	= [self.class cellWithText:text];
	cell.subController		= controller;
	if([controller isKindOfClass:[GSTableViewController class]]){
		GSTableViewController* c	= ((GSTableViewController*)controller);
		c.parentControllerLabel		= cell.label;
		[cell.label setText:[NSString stringWithFormat:@"%i",[c count]]];
	}
    return cell;
}

-(void)setup{
	[super setup];
	[self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
	
	[self.text setFrame:CGRectMake(TEXT_X, TEXT_Y, CONTROL_SIZE*2, 25)];
}

-(void)onCellPressed:(UITableView*)tableView indexPath:(NSIndexPath*)index controller:(UIViewController*)controller{
	
	if(self.subController != nil){
		if(controller.navigationController != nil)
			[controller.navigationController pushViewController:self.subController animated:YES];
		else
			[controller presentViewController:self.subController animated:YES completion:nil];
	}
	else{
		NSLog(@"[GSControllerCell] Nil subviewcontroller");
	}
}

//================================================
#pragma mark - TABLE VIEW DELEGATE
//================================================
-(void)dealloc{
    self.subController = nil;
}

@end
