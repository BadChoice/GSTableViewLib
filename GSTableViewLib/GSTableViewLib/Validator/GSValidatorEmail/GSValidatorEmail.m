//
//  GSValidatorEmail.m
//  GSTableViewLib
//
//  Created by MACJordi on 10/4/15.
//  Copyright (c) 2015 Gloobus Studio. All rights reserved.
//

#import "GSValidatorEmail.h"

@implementation GSValidatorEmail

-(BOOL)isValid:(NSObject *)object{
	if(![super isValid:object]) return NO;
	
	if([object isKindOfClass:[NSString class]]){
		return  [self NSStringIsValidEmail:(NSString*)object];
	}
	
	else return NO;
}

-(BOOL) NSStringIsValidEmail:(NSString *)checkString
{
	BOOL stricterFilter				= NO; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
	NSString *stricterFilterString	= @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
	NSString *laxString				= @".+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*";
	NSString *emailRegex			= stricterFilter ? stricterFilterString : laxString;
	NSPredicate *emailTest			= [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
	return [emailTest evaluateWithObject:checkString];
}
@end
