//
//  GSAlertView.h
//  Revo
//
//  Created by Badchoice on 6/12/14.
//  Copyright (c) 2014 Gloobus Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GSAlertView : UIAlertView<UIAlertViewDelegate>

@property (copy) void(^completionBlock)(UIAlertView *alertView, NSInteger buttonIndex);
@property (copy) void(^completionBlockWithText)(UIAlertView *alertView, NSInteger buttonIndex, NSString* text);

- (void)showWithCompletion:(void(^)(UIAlertView *alertView, NSInteger buttonIndex))completion;
- (void)showWithInputTextAndCompletion:(void(^)(UIAlertView *alertView, NSInteger buttonIndex, NSString* text))completion;
@end
