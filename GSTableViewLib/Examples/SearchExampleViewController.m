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
	
	data = [[NSArray alloc] initWithObjects:
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
	
	[self.sections addObject:[GSTableViewSection createSectionForModelArray:data withDetail:NO ofObject:[SampleModel class]]];
	
}

-(int)count{
	return (int)[data count];
}

@end
