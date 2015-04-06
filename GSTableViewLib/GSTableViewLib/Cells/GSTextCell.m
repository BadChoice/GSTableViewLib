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
    mNumberOfLines = 1;
    _textView = [[UITextView alloc] initWithFrame:[self getFrame]];
    [_textView setTextColor:[UIColor grayColor]];
    [_textView setFont:[UIFont systemFontOfSize:15]];
    
    [self addSubview:_textView];
    
    [_textView setText:@"a text"];
    
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

-(void)textViewDidChange:(UITextView *)textView{
    [self didChange];
}

-(void)didChange{
    [self updateModelObject:_textView.text];
    
    int lines  = self.textView.contentSize.height/self.textView.font.lineHeight;
    if(lines != mNumberOfLines){
        mNumberOfLines = lines;
        [self.textView setFrame:[self getFrame]];
        [self.parentTableview beginUpdates];
        [self.parentTableview endUpdates];
    }
}


-(CGFloat)cellHeight{
    return 65 + (TEXT_VIEW_LINE_HEIGHT*mNumberOfLines) - (10*mNumberOfLines);
}


-(CGRect)getFrame{
    return CGRectMake(8 ,TEXT_Y*2.6f ,self.frame.size.width - 10,TEXT_VIEW_LINE_HEIGHT*mNumberOfLines);
}


@end
