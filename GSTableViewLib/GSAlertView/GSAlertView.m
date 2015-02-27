//
//  GSAlertView.m
//  Revo
//
//  Created by Badchoice on 6/12/14.
//  Copyright (c) 2014 Gloobus Studio. All rights reserved.
//

#import "GSAlertView.h"

@implementation GSAlertView

- (void)showWithCompletion:(void(^)(UIAlertView *alertView, NSInteger buttonIndex))completion{
    self.completionBlock = completion;
    self.delegate        = self;
    [self show];    
}

-(void)showWithInputTextAndCompletion:(void(^)(UIAlertView *alertView, NSInteger buttonIndex, NSString* text))completion{
    self.alertViewStyle          = UIAlertViewStylePlainTextInput;
    self.completionBlockWithText = completion;
    self.delegate = self;
    [self show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    //self.completionBlock(alertView,buttonIndex);
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    if(self.completionBlock){
        self.completionBlock(alertView,buttonIndex);
    }
    else if(self.completionBlockWithText) {
        self.completionBlockWithText(alertView,buttonIndex,[alertView textFieldAtIndex:0].text);
    }
}

@end
