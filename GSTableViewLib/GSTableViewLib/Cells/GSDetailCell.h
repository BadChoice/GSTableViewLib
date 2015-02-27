//
//  GSDetailCell.h
//  Taste
//
//  Created by MACJordi on 13/05/14.
//  Copyright (c) 2014 Gloobus Studio. All rights reserved.
//

#import "GSTableViewController.h"

@interface GSDetailCell : GSBaseCell{

}

@property (strong,nonatomic) 	GSTableViewController * controller;

+(id)cellWithText:(NSString*)text andController:(GSTableViewController*)controller;

@end
