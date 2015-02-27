//
//  SearchExampleViewController.m
//  GSTableViewLib
//
//  Created by MACJordi on 27/2/15.
//  Copyright (c) 2015 Gloobus Studio. All rights reserved.
//

#import "SearchExampleViewController.h"
#import "SampleModel.h"

@interface SearchExampleViewController ()

@end

@implementation SearchExampleViewController

-(void)setup{
	[super setup];
	
    data = [SampleModel createModelsArray];
	
	[self.sections addObject:[GSTableViewSection createSectionForModelArray:data withDetail:NO ofObject:[SampleModel class]]];
	
}

-(int)count{
	return (int)[data count];
}

@end
