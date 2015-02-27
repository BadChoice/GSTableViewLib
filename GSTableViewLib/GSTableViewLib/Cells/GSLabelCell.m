//
//  GSLabelCell.m
//  Taste
//
//  Created by MACJordi on 13/05/14.
//  Copyright (c) 2014 Gloobus Studio. All rights reserved.
//

#import "GSLabelCell.h"

@implementation GSLabelCell

-(void)setup{
	[super setup];
	_label = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width - CONTROL_SIZE - ACCESSORY_WIDTH, TEXT_Y, CONTROL_SIZE, 25)];
    [self.contentView addSubview:_label];
    _label.textAlignment = NSTextAlignmentRight;
    [_label setTextColor:[UIColor grayColor]];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [_label setFrame:CGRectMake(self.frame.size.width - CONTROL_SIZE - ACCESSORY_WIDTH, TEXT_Y, CONTROL_SIZE, 25)];
}


-(void)setObjectProperty:(NSString *)objectProperty{
    [super setObjectProperty:objectProperty];
    [self updateLabel];
}

-(void)updateLabel{
	NSObject* object = [self.object valueForKey:self.objectProperty];
	if([object isKindOfClass:[NSString class]]){
		_label.text = ((NSString*)object);
	}
	else if([object isKindOfClass:[NSNumber class]]){
		_label.text = [((NSNumber*)object) stringValue];
	}
}

-(void)dealloc{
    self.label = nil;
}

-(void)updateLayout{
    [super updateLayout];
    [self.text setFrame:CGRectMake(self.text.frame.origin.x,
                                   self.text.frame.origin.y,
                                   self.text.frame.size.width + 80,
                                   self.text.frame.size.height)];
}

@end
