//
//  GSButtonCell.m
//  Taste
//
//  Created by Badchoice on 12/05/14.
//  Copyright (c) 2014 Gloobus Studio. All rights reserved.
//

#import "GSButtonCell.h"

@implementation GSButtonCell

+(id)cellWithText:(NSString*)text andAction:(void (^)())action{
    GSButtonCell* cell = [self.class cellWithText:text];
    cell.action = action;
    return cell;
}

-(void)setup{
    [super setup];
    UIColor *tintColor  = [self tintColor];
    UIColor *tintColor2 = [[UIButton appearance] tintColor];
    
    UIButton* bt = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 200, 25)];
    [bt setTitle:@"Helloooaoao" forState:UIControlStateNormal];
    [self addSubview:bt];
    [self.text setTextColor:bt.tintColor];
}

-(void)onCellPressed:(UITableView*)tableView indexPath:(NSIndexPath*)index controller:(UIViewController*)controller{
    if(_action != nil)
		dispatch_async(dispatch_get_main_queue(), ^{
			_action();
		});
}

@end
