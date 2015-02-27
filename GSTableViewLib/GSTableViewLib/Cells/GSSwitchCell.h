//
//  GSSwitchCell.h
//  Taste
//
//  Created by Badchoice on 12/05/14.
//  Copyright (c) 2014 Gloobus Studio. All rights reserved.
//

#import "GSBaseCell.h"

@interface GSSwitchCell : GSBaseCell{
    
}

@property (strong,nonatomic) UISwitch* theSwitch;

-(void)changeSwitchValue:(BOOL) active andIsEnabled:(BOOL) isEnabled;

@end
