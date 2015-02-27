//
//  GSSteperCell.h
//  Taste
//
//  Created by Badchoice on 13/05/14.
//  Copyright (c) 2014 Gloobus Studio. All rights reserved.
//

#import "GSTextFieldCell.h"

@interface GSSteperCell : GSTextFieldCell{
    BOOL mAllowZero;
}

@property (strong,nonatomic) UIStepper *stepper;
@end
