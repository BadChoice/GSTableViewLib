//
//  GSDescriptionCell.m
//  GSTableViewLib
//
//  Created by MACJordi on 14/4/15.
//  Copyright (c) 2015 Gloobus Studio. All rights reserved.
//

#import "GSDescriptionCell.h"

@implementation GSDescriptionCell

+(id)cellWithText:(NSString*)text withClearColor:(BOOL)clearColor{
	GSDescriptionCell* cell = [super cellWithText:text];
	cell.clearColor = clearColor;
	return cell;
}

-(void)setup{
	[super setup];
	self.text.textColor = [UIColor lightGrayColor];
	[self calculateNumberOfLines];
}

-(void)layoutSubviews{
	if(self.clearColor){
		self.backgroundColor			= [UIColor clearColor];
		self.contentView.backgroundColor= [UIColor clearColor];
	}
	
	[super layoutSubviews];
	[self calculateNumberOfLines];
}

-(void)calculateNumberOfLines{
	int charsPerLine	= (self.frame.size.width - 20) / self.text.font.lineHeight;
	int textChars		= (int)[self.text.text length];
	mNumberOfLines		= (textChars / charsPerLine) - 1;

	self.text.numberOfLines = mNumberOfLines;
	self.frame		= CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, mNumberOfLines*self.text.font.lineHeight);
	
	self.text.frame = CGRectMake(10, 0, self.frame.size.width-20, mNumberOfLines*self.text.font.lineHeight);
	
	//[self.text setBackgroundColor:[UIColor greenColor]];
	
	[self.parentTableview beginUpdates];
	[self.parentTableview endUpdates];
	
	//NSLog(@"Current Text %@",self.text.text);
	//NSLog(@"Number of lines: %d",mNumberOfLines);
}

-(CGFloat)cellHeight{
	return self.frame.size.height;
}

@end
