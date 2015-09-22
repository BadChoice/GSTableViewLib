//
//  GSSegmentedCell.h
//  Idesuku
//
//  Created by La Factoria on 23/07/14.
//  Copyright (c) 2014 idesuku. All rights reserved.
//

#import "GSBaseCell.h"


@interface GSSegmentedCell : GSBaseCell {
}

@property(strong,nonatomic)	UISegmentedControl *segmentedControl;


@property(strong,nonatomic) NSArray* labels;
@property(strong,nonatomic) NSArray* values;

+(id)cellWithText:(NSString*)text  andObject:(id)object andKey:(NSString*)key  andLabels:(NSArray*)labels andValues:(NSArray*)values;


@end
