//
//  SampleModel.m
//  GSTableViewLib
//
//  Created by MACJordi on 27/2/15.
//  Copyright (c) 2015 Gloobus Studio. All rights reserved.
//

#import "SampleModel.h"

@implementation SampleModel

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

@end
