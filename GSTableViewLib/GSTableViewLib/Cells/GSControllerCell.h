//
//  GSControllerCell.h
//  Idesuku
//
//  Created by MACJordi on 04/07/14.
//  Copyright (c) 2014 idesuku. All rights reserved.
//

#import "GSLabelCell.h"
#import "GSTableViewController.h"

@interface GSControllerCell : GSLabelCell

@property(strong,nonatomic) UIViewController* subController;

+(id)cellWithText:(NSString*)text andController:(UIViewController*)controller;

@end
