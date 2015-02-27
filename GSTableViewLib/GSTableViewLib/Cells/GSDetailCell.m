//
//  GSDetailCell.m
//  Taste
//
//  Created by MACJordi on 13/05/14.
//  Copyright (c) 2014 Gloobus Studio. All rights reserved.
//

#import "GSDetailCell.h"

@implementation GSDetailCell

+(id)cellWithText:(NSString*)text andController:(GSTableViewController*)controller{
	
	GSDetailCell* cell  = [self.class cellWithText:text];
    cell.controller     = controller;
    return cell;
}


-(void)setup{
	[super setup];
	[self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
}


-(void)onCellPressed:(UITableView*)tableView indexPath:(NSIndexPath*)index controller:(UIViewController*)controller{
	
    if(_controller != nil){
        if(controller.navigationController != nil){
            [controller.navigationController pushViewController:_controller animated:YES];
        }
        else
            [controller presentViewController:_controller animated:YES completion:nil];
    }
}


//================================================
#pragma mark - TABLE VIEW DELEGATE
//================================================
-(void)dealloc{
    self.controller = nil;
}


@end
