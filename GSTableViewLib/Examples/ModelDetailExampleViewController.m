//
//  ModelDetailExampleViewController.m
//  GSTableViewLib
//
//  Created by MACJordi on 27/2/15.
//  Copyright (c) 2015 Gloobus Studio. All rights reserved.
//

#import "ModelDetailExampleViewController.h"

@interface ModelDetailExampleViewController ()

@end

@implementation ModelDetailExampleViewController

-(void)setup{
	[super setup];
	self.sampleModel = [[SampleModel alloc] init];
	[self.sampleModel setExampleDataToProperties];
	
	self.SampleModelWithDetailInfo = [[SampleModelWithDetailInfo alloc] init];
	[self.sampleModelWithDetailInfo setExampleDataToProperties];
	
	GSTableViewSection* s1 = [GSTableViewSection createSectionForModel:[SampleModel class] andObject:self.sampleModel];
	GSTableViewSection* s2 = [GSTableViewSection createSectionForModel:[SampleModelWithDetailInfo class] andObject:self.sampleModelWithDetailInfo];
	
	s1.header = @"With default creation";
	s2.header = @"With custom creation";
	
	[self.sections addObject:s1];
	[self.sections addObject:s2];
}

@end
