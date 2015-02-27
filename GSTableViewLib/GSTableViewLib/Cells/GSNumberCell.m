//
//  GSNumberCell.m
//  Taste
//
//  Created by Badchoice on 13/05/14.
//  Copyright (c) 2014 Gloobus Studio. All rights reserved.
//

#import "GSNumberCell.h"

@implementation GSNumberCell

-(void)setup{
    mAllowZero = NO;
    
    [super setup];
    self.textField.keyboardType = UIKeyboardTypeNumberPad;
    
    if(mAllowZero){
        self.textField.text = @"0";
        mLastNumber = 0;
    }else{
        self.textField.text = @"1";
        mLastNumber = 1;
    }
}

-(void)didChange{
    if([self isIntegerNumber:self.textField.text]){
        mLastNumber = (int)[self.textField.text integerValue];
        if(!mAllowZero && mLastNumber == 0 ) mLastNumber = 1;
    }
    self.textField.text = [NSString stringWithFormat:@"%i",mLastNumber];

    [self updateModelObject:@([self.textField.text integerValue])];
	[self updateValid];
    
}
@end
