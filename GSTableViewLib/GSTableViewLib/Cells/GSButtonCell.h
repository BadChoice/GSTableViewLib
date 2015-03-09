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
+(id)cellWithText:(NSString*)text andAction:(void (^)())action;

@end
