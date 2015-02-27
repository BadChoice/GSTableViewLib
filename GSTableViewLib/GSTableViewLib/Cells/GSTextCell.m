//
//  GSText.m
//  Taste
//
//  Created by Badchoice on 13/05/14.
//  Copyright (c) 2014 Gloobus Studio. All rights reserved.
//

#import "GSTextCell.h"

@implementation GSTextCell

-(void)setup{
    [super setup];
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(TEXT_X + 100 ,TEXT_Y ,CONTROL_SIZE + 80,120)];
    [_textView setTextColor:[UIColor grayColor]];
    [_textView setFont:[UIFont systemFontOfSize:15]];
    
    [self addSubview:_textView];
    
    self.clipsToBounds = YES;
    
    _textView.delegate = self;
}

-(void)setObjectProperty:(NSString *)objectProperty{
    [super setObjectProperty:objectProperty];
    [self updateLabel];
}

-(void)updateLabel{
	NSObject* object = [self.object valueForKey:self.objectProperty];
	if([object isKindOfClass:[NSString class]]){
		_textView.text = ((NSString*)object);
	}
	else if([object isKindOfClass:[NSNumber class]]){
		_textView.text = [((NSNumber*)object) stringValue];
	}
}

- (void)textViewDidEndEditing:(UITextView *)textView{
    [self didChange];
}

-(void)didChange{
    [self updateModelObject:_textView.text];
}


-(CGFloat)cellHeight{
    return 150;
}



@end
