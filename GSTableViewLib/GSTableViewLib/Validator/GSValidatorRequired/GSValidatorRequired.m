//
//  GSValidatorRequired.m
//  GSTableViewLib
//
//  Created by MACJordi on 10/4/15.
//  Copyright (c) 2015 Gloobus Studio. All rights reserved.
//

#import "GSValidatorRequired.h"

@implementation GSValidatorRequired

-(BOOL)isValid:(NSObject *)object{
	if(![super isValid:object]) return NO;
	
	if([object isKindOfClass:[NSString class]]){
		return !([object isEqual:@""]);
	}
	
	else return NO;
}
@end
