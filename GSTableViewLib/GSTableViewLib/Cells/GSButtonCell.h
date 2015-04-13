//
//  GSButtonCell.h
//  Taste
//
//  Created by Badchoice on 12/05/14.
//  Copyright (c) 2014 Gloobus Studio. All rights reserved.
//

#import "GSBaseCell.h"

@interface GSButtonCell : GSBaseCell{
	
}

@property(nonatomic,copy) void (^action)(void);
@property(strong,nonatomic) UIColor* bgColor;
@property(strong,nonatomic) UIColor* textColor;

+(id)cellWithText:(NSString*)text andAction:(void (^)())action;
+(id)cellWithText:(NSString *)text andColor:(UIColor*)color andAction:(void (^)())action;
+(id)cellWithText:(NSString *)text andColor:(UIColor*)color andTextColor:(UIColor*)textColor andAction:(void (^)())action;

@end
