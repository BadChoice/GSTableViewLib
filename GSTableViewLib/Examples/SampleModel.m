//
//  SampleModel.m
//  GSTableViewLib
//
//  Created by MACJordi on 27/2/15.
//  Copyright (c) 2015 Gloobus Studio. All rights reserved.
//

#import "SampleModel.h"

@implementation SampleModel

-(id)init{
    if(self == [super init]){
        [self setExampleDataToProperties];
    }
    return self;
}

/**
 * Set some dumb data to properties to they are live updated in the cells
 */
-(void)setExampleDataToProperties{
	self.name			= @"a name";
	self.enabled		= @1;
	self.number			= @20;
	self.stepper		= @10;
	self.decimalNumber	= @5.3;
	self.select			= @"Amazing";
	self.selectId		= @1;
}

+(NSArray*)createModelsArray{
    NSArray *data = [[NSArray alloc] initWithObjects:
            [[SampleModel alloc] init],
            [[SampleModel alloc] init],
            [[SampleModel alloc] init],
            [[SampleModel alloc] init],
            [[SampleModel alloc] init],
            [[SampleModel alloc] init],
            nil];
    
    [data[0] setValue:@"Coffe"			forKey:@"name"];
    [data[1] setValue:@"Milk"			forKey:@"name"];
    [data[2] setValue:@"Tea"			forKey:@"name"];
    [data[3] setValue:@"Football"		forKey:@"name"];
    [data[4] setValue:@"Basketball"	forKey:@"name"];
    [data[5] setValue:@"Hamburger"		forKey:@"name"];

    return data;
}
@end
