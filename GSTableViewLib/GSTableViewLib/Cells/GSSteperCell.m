//
//  GSSteperCell.m
//  Taste
//
//  Created by Badchoice on 13/05/14.
//  Copyright (c) 2014 Gloobus Studio. All rights reserved.
//

#import "GSSteperCell.h"

@implementation GSSteperCell

-(void)setup{
    [super setup];
    
    mAllowZero = NO;
    
    _stepper =[[UIStepper alloc] initWithFrame:CGRectMake(TEXT_X + CONTROL_SIZE ,TEXT_Y,60,15)];
    [self addSubview:_stepper];
    
    [_stepper addTarget:self action:@selector(didChangeStepper) forControlEvents:UIControlEventValueChanged];
    self.textField.placeholder = @"";
    self.textField.text = @"1";
    self.stepper.value  = 1;

    if(!mAllowZero) self.stepper.minimumValue = 1;
    
    self.textField.keyboardType = UIKeyboardTypeNumberPad;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [_stepper setFrame:CGRectMake(self.frame.size.width - 130 - ACCESSORY_WIDTH, TEXT_Y, CONTROL_SIZE, 25)];
}

-(void)didChangeStepper{
    self.textField.text = [NSString stringWithFormat:@"%.0f",_stepper.value];
    [self updateModelObject:@([self.textField.text integerValue])];
}

-(void)didChange{
    
    if([self isIntegerNumber:self.textField.text]){
        self.stepper.value = [self.textField.text integerValue];
    }else{
        self.textField.text = [NSString stringWithFormat:@"%.0f",_stepper.value];
    }
    [self didChangeStepper];
}

-(void)setObjectProperty:(NSString *)objectProperty{
    [super setObjectProperty:objectProperty];
    NSString* s;
    
    id value = [self.object valueForKey:objectProperty];

    if([value isKindOfClass:[NSString class]]){
        s = value;
    }
    else{
        s = [value stringValue];
    }
    

    if(s == nil || [s isEqualToString:@""]){
        self.textField.text = @"1" ;
    }
    else{
        self.textField.text = s;
        self.stepper.value = [[self.object valueForKey:objectProperty] intValue];
    }
}


@end
