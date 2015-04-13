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
	return [GSButtonCell cellWithText:text andColor:nil andTextColor:nil andAction:action];
}

+(id)cellWithText:(NSString *)text andColor:(UIColor*)color andAction:(void (^)())action{
	return [GSButtonCell cellWithText:text andColor:color andTextColor:nil andAction:action];
}

+(id)cellWithText:(NSString *)text andColor:(UIColor*)color andTextColor:(UIColor*)textColor andAction:(void (^)())action{
	GSButtonCell* cell = [self.class cellWithText:text];
	cell.action = action;
	cell.bgColor = color;
	cell.textColor = textColor;
	return cell;
}

-(void)layoutSubviews{
	if(self.textColor == nil){
		UIColor *tintColor2 = [[UIButton appearance] tintColor];
		[self.text setTextColor:tintColor2];
	}
	else{
		[self.text setTextColor:self.textColor];
	}

	
	if(self.bgColor != nil){
		self.text.backgroundColor	= self.bgColor;
		self.text.textAlignment		= NSTextAlignmentCenter;
		self.text.frame				= CGRectMake(20, 8, self.frame.size.width - 40, 40);
	}
	
	[super layoutSubviews];
}

-(void)onCellPressed:(UITableView*)tableView indexPath:(NSIndexPath*)index controller:(UIViewController*)controller{
    if(_action != nil)
		dispatch_async(dispatch_get_main_queue(), ^{
			_action();
		});
}

@end
