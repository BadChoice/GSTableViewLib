//
//  GSValidator.m
//  GSTableViewLib
//
//  Created by MACJordi on 10/4/15.
//  Copyright (c) 2015 Gloobus Studio. All rights reserved.
//

#import "GSValidator.h"

@implementation GSValidator

-(id)init{
	if(self = [super init]){
		self.validations = [[NSMutableArray alloc] init];
	}
	return self;
}

-(BOOL)isValid:(NSObject*)object{
	for(GSValidator* validator in self.validations){
		if(![validator isValid:object])
			return NO;
	}
	return YES;
}

-(void)addValidation:(GSValidator*)validation{
	[self.validations addObject:validation];
}
@end
