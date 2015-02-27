//
//  GSTextFieldCell.m
//  Taste
//
//  Created by Badchoice on 12/05/14.
//  Copyright (c) 2014 Gloobus Studio. All rights reserved.
//

#import "GSTextFieldCell.h"

@implementation GSTextFieldCell



-(void)setup{
    [super setup];
    
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(self.frame.size.width - CONTROL_SIZE - ACCESSORY_WIDTH, TEXT_Y, CONTROL_SIZE, 25)];
    [self addSubview:_textField];
    _textField.placeholder   = @"Placeholder";
    _textField.textAlignment = NSTextAlignmentRight;
    
    [_textField setTextColor:[UIColor grayColor]];
    
  	[_textField addTarget:self action:@selector(didChange) forControlEvents:UIControlEventEditingChanged];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [_textField setFrame:CGRectMake(self.frame.size.width - CONTROL_SIZE - ACCESSORY_WIDTH, TEXT_Y, CONTROL_SIZE, 25)];
	_textField.placeholder = self.text.text;
}

-(void)setObjectProperty:(NSString *)objectProperty{
    [super setObjectProperty:objectProperty];
    id object =[self.object valueForKey:objectProperty];
    if([object isKindOfClass:[NSString class]]){
        _textField.text = object;
    }
    else{
        _textField.text = [object stringValue];
    }
}

-(void)didChange{
    [self updateModelObject:_textField.text];
	[self updateValid];
}

-(BOOL)checkValid{
	return !(self.isRequired && [self.textField.text isEqual:@""]);
}

@end
