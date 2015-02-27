//
//  GSText.h
//  Taste
//
//  Created by Badchoice on 13/05/14.
//  Copyright (c) 2014 Gloobus Studio. All rights reserved.
//

#import "GSBaseCell.h"

@interface GSTextCell : GSBaseCell<UITextViewDelegate>

@property (strong,nonatomic) UITextView* textView;

@end
