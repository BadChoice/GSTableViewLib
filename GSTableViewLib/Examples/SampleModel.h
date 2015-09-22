//
//  SampleModel.h
//  GSTableViewLib
//
//  Created by MACJordi on 27/2/15.
//  Copyright (c) 2015 Gloobus Studio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SampleModel : NSObject

@property (strong,nonatomic) NSString* name;
@property (strong,nonatomic) NSNumber* enabled;
@property (strong,nonatomic) NSNumber* number;
@property (strong,nonatomic) NSNumber* stepper;
@property (strong,nonatomic) NSNumber* decimalNumber;
@property (strong,nonatomic) NSDate	 * date;
@property (strong,nonatomic) NSString* select;
@property (strong,nonatomic) NSNumber* selectId;
@property (strong,nonatomic) NSString* largeText;
@property (strong,nonatomic) NSNumber* segmented;

-(void)setExampleDataToProperties;

+(NSArray*)createModelsArray;

@end
