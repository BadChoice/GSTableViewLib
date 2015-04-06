//
//  GSText.h
//  Taste
//
//  Created by Badchoice on 13/05/14.
//  Copyright (c) 2014 Gloobus Studio. All rights reserved.
//

#import "GSBaseCell.h"

#define TEXT_VIEW_LINE_HEIGHT 25

@interface GSTextCell : GSBaseCell<UITextViewDelegate>{
    int mNumberOfLines;
}

@property (strong,nonatomic) UITextView* textView;

@end
