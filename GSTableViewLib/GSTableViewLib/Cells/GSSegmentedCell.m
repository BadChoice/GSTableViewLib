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
		_segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"ab",@"cd",@"ef"]];
		[_segmentedControl addTarget:self action:@selector(segmentedValueChanged:)
                    forControlEvents:UIControlEventValueChanged];
		[_segmentedControl setFrame:CGRectMake(TEXT_X + CONTROL_SIZE, TEXT_Y, 80, 25)];
		
		[self.contentView addSubview:_segmentedControl];
	}
	return self;
}

+(id)cellWithText:(NSString*)text  andObject:(id)object andKey:(NSString*)key  andLabels:(NSArray*)labels andValues:(NSArray*)values{
    
    GSSegmentedCell* cell   = [self.class cellWithText:text andObject:object andKey:key];
    cell.values             = values;
    cell.labels             = labels;
    
    [cell updateLabel];
    
    return cell;
}

-(void)updateLabel{
    if(self.object != nil){
        NSUInteger index = [self.values indexOfObject:[self.object valueForKey:self.objectProperty]];
        [self.segmentedControl setSelectedSegmentIndex:index];
    }
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [_segmentedControl setFrame:CGRectMake(self.frame.size.width - 160 - ACCESSORY_WIDTH, TEXT_Y, CONTROL_SIZE, 25)];
}

-(void) segmentedValueChanged:(id) sender {
	UISegmentedControl *segmentedSender = (UISegmentedControl *)sender;
    if(self.values != nil)
        [self updateModelObject:_values[segmentedSender.selectedSegmentIndex]];
}

-(void)dealloc{
    self.values = nil;
    self.labels = nil;
}


@end

