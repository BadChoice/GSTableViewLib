//
//  GSSwitchCell.m
//  Taste
//
//  Created by Badchoice on 12/05/14.
//  Copyright (c) 2014 Gloobus Studio. All rights reserved.
//

#import "GSSwitchCell.h"

@implementation GSSwitchCell

-(void)setup{
    [super setup];
    
    _theSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(self.frame.size.width - 80, TEXT_Y, CONTROL_SIZE, 25)];
    [_theSwitch setFrame:CGRectMake(self.frame.size.width - _theSwitch.frame.size.width, 6, self.frame.size.width, 25)];
    [self addSubview:_theSwitch];
    
   	[_theSwitch addTarget:self action:@selector(didChange) forControlEvents:UIControlEventValueChanged];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [_theSwitch setFrame:CGRectMake(self.frame.size.width - 50 - ACCESSORY_WIDTH, TEXT_Y, CONTROL_SIZE, 25)];
}

-(void)didChange{
    if(_theSwitch.isOn) [self updateModelObject:@1];
    else                [self updateModelObject:@0];
}

-(void)changeSwitchValue:(BOOL) active andIsEnabled:(BOOL) isEnabled {
	
	if (!isEnabled) {
		[_theSwitch setOn:active animated:YES];
		[self didChange];
	}
	
	[_theSwitch setEnabled:isEnabled];
}

-(void)setObjectProperty:(NSString *)objectProperty{
    [super setObjectProperty:objectProperty];
	[_theSwitch setOn:[[self.object valueForKey:objectProperty] boolValue] animated:YES];
}

@end
