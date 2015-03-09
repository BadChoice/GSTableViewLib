//
//  GSFloatCell.m
//  Revo
//
//  Created by MACJordi on 14/10/14.
//  Copyright (c) 2014 Gloobus Studio. All rights reserved.
//

#import "GSFloatCell.h"

@implementation GSFloatCell

-(void)setup{
    [super setup];
    self.textField.delegate     = self;
    self.textField.keyboardType = UIKeyboardTypeNumberPad;
    
    NSNumberFormatter* numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    [numberFormatter setCurrencyCode:@"GBP"];
    
    self.maximumFractionDigits  = 2;
    self.decimalSeparator       = @".";
    
}

- (BOOL)textField:(UITextField*)textField shouldChangeCharactersInRange:(NSRange)range
replacementString:(NSString*)string {
    // Update the string in the text input
    NSMutableString* currentString = [NSMutableString stringWithString:textField.text];
    [currentString replaceCharactersInRange:range withString:string];
    // Strip out the decimal separator
    [currentString replaceOccurrencesOfString:self.decimalSeparator withString:@""
                                      options:NSLiteralSearch range:NSMakeRange(0, [currentString length])];
    // Generate a new string for the text input
    int currentValue = [currentString intValue];
    NSString* format = [NSString stringWithFormat:@"%%.%df", self.maximumFractionDigits];
    double minorUnitsPerMajor = pow(10, self.maximumFractionDigits);
    NSString* newString = [NSString stringWithFormat:format, currentValue/minorUnitsPerMajor];
    textField.text = newString;
    return NO;  
}
@end
