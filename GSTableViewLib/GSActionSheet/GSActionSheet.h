//
//  GSActionSheet.h
//  Revo
//
//  Created by Badchoice on 10/12/14.
//  Copyright (c) 2014 Gloobus Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GSActionSheet : UIActionSheet<UIActionSheetDelegate>

@property (copy) void(^completionBlock)(UIActionSheet *alertView, NSInteger buttonIndex);

- (void)showInView:(UIView *)view withCompletion:(void(^)(UIActionSheet *alertView, NSInteger buttonIndex))completion;

@end
