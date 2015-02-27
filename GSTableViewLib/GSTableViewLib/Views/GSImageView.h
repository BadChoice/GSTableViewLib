//
//  GSImageView.h
//  Taste
//
//  Created by Badchoice on 26/04/14.
//  Copyright (c) 2014 Gloobus Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GSImageView : UIImageView{
    NSString*   currentImageUrl;
    int         mCurrentLoad;
}

@property (strong,nonatomic) UIActivityIndicatorView *loading;
@property (strong,nonatomic) UILabel* initialsLabel;


-(void)loadImageFromServer:(NSString*)url;
-(void)loadGravatar:(NSString*)email;
-(void)drawShadow;
-(void)setAsCircle;
-(void)setRoundBorders:(int)radius;

-(void)setInitialLetters:(NSString*)fullName;
-(void)setInitialLettersAsFullText:(NSString*)fullName;

+ (NSString *)encodeToBase64String:(UIImage *)image;

@end
