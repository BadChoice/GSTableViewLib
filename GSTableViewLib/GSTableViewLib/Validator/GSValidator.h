//
//  GSValidator.h
//  GSTableViewLib
//
//  Created by MACJordi on 10/4/15.
//  Copyright (c) 2015 Gloobus Studio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GSValidator : NSObject

@property (strong,nonatomic) NSMutableArray* validations;

-(BOOL)isValid:(NSObject*)object;
-(void)addValidation:(GSValidator*)validation;

@end
