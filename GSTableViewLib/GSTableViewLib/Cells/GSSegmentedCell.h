//
//  GSSegmentedCell.h
//  Idesuku
//
//  Created by La Factoria on 23/07/14.
//  Copyright (c) 2014 idesuku. All rights reserved.
//

#import "GSButtonCell.h"

@protocol GSSegmentedCellDelegate <NSObject>

- (void) valueChanged:(int) value;

@end



@interface GSSegmentedCell : GSButtonCell {
	UISegmentedControl *segmentedControl;
}

@property(nonatomic,strong) id <GSSegmentedCellDelegate> delegate;

- (void) setSegmentedIndex:(int) selected;

@end
