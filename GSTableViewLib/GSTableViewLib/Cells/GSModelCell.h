//
//  GSModelCell.h
//  Idesuku
//
//  Created by MACJordi on 03/07/14.
//  Copyright (c) 2014 idesuku. All rights reserved.
//

#import "GSLabelCell.h"
#import "GSSearchTableViewViewController.h"

@interface GSModelCell : GSLabelCell<GSTableViewControllerDelegate>{
	GSTableViewController* mSelectViewController;
}

@property (strong,nonatomic)  NSObject* model;

+(id)cellWithText:(NSString*)text andObject:(id)object andKey:(NSString*)key andModel:(NSObject*)model;

-(void)donePressed:(id)sender;
@end
