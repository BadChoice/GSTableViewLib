//
//  GSSegmentedCell.m
//  Idesuku
//
//  Created by La Factoria on 23/07/14.
//  Copyright (c) 2014 idesuku. All rights reserved.
//

#import "GSSegmentedCell.h"

@implementation GSSegmentedCell

-(id) initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		segmentedControl = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"Everybody",@"Nobody",@"Custom", nil]];
		[segmentedControl addTarget:self action:@selector(segmentedValueChanged:) forControlEvents:UIControlEventValueChanged];
		[segmentedControl setFrame:CGRectMake(20, 60, 280, 29)];
		[segmentedControl setTintColor:[UIColor grayColor]];
		
		[self.contentView addSubview:segmentedControl];
	}
	return self;
}

+(id)cellWithText:(NSString*)text andAction:(void (^)())action{
	
	//action = action;
	GSSegmentedCell* cell = [self.class cellWithText:@"Text"];
	[cell.text removeFromSuperview];
	//cell.action = action;
	
	UIImageView *everybody	= [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"privacy-everybody.png"]];
	UIImageView *nobody		= [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"privacy-nobody.png"]];
	UIImageView *custom		= [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"privacy-custom.png"]];

	[everybody setFrame:CGRectMake(39, 20, 50, 34)];
	[nobody setFrame:CGRectMake(135, 20, 50, 34)];
	[custom setFrame:CGRectMake(228, 20, 50, 34)];
	
	[cell.contentView addSubview:everybody];
	[cell.contentView addSubview:nobody];
	[cell.contentView addSubview:custom];
	
    return cell;
}

-(void)onCellPressed:(UITableView*)tableView indexPath:(NSIndexPath*)index controller:(UIViewController*)controller{

}

-(void) segmentedValueChanged:(id) sender {
	UISegmentedControl *segmentedSender = (UISegmentedControl *)sender;
	[self.delegate valueChanged:[segmentedSender selectedSegmentIndex]];
	//self.action([segmentedSender selectedSegmentIndex]);
}

-(void) setSegmentedIndex:(int)selected {
	
	if (selected > segmentedControl.numberOfSegments-1)
	{
		ALog(@"Selected out of index");
		return;
	}
	
	segmentedControl.selectedSegmentIndex = selected;
}

/*
- (void) segmentedChanged:(id) sender {
	
}
 */

-(CGFloat) cellHeight {
	return 100;
}

@end

