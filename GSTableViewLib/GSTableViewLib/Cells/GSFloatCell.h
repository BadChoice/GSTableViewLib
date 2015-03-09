//
//  GSFloatCell.h
//  Revo
//
//  Created by MACJordi on 14/10/14.
//  Copyright (c) 2014 Gloobus Studio. All rights reserved.
//

#import "GSTextFieldCell.h"

#define MAX_LENGTH 8

@interface GSFloatCell : GSTextFieldCell <UITextFieldDelegate>{
}

@property (nonatomic)           NSUInteger maximumFractionDigits;
@property (strong,nonatomic)    NSString *decimalSeparator;

@end
