//
//  GSActionSheet.m
//  Revo
//
//  Created by Badchoice on 10/12/14.
//  Copyright (c) 2014 Gloobus Studio. All rights reserved.
//

#import "GSActionSheet.h"

@implementation GSActionSheet

- (void)showInView:(UIView *)view withCompletion:(void(^)(UIActionSheet *alertView, NSInteger buttonIndex))completion{
    self.completionBlock = completion;
    self.delegate = self;
    [self showInView:view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    //self.completionBlock(actionSheet,buttonIndex);
}


-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex{
    self.completionBlock(actionSheet,buttonIndex);
}



-(void)changeTextColor:(UIColor*)color{
    SEL selector = NSSelectorFromString(@"_alertController");
    if ([self respondsToSelector:selector])
    {
        UIAlertController *alertController = [self valueForKey:@"_alertController"];
        if ([alertController isKindOfClass:[UIAlertController class]])
        {
            alertController.view.tintColor = color;
        }
    }
}

@end
