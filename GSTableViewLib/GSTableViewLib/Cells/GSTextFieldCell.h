//
//  GSTextFieldCell.h
//  Taste
//
//  Created by Badchoice on 12/05/14.
//  Copyright (c) 2014 Gloobus Studio. All rights reserved.
//

#import "GSBaseCell.h"

@interface GSTextFieldCell : GSBaseCell{
    
}

@property (strong,nonatomic) UITextField* textField;

-(void)didChange;

@end
