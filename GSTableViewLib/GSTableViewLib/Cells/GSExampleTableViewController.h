//
//  GSExampleTableViewController.h
//  Taste
//
//  Created by Badchoice on 13/05/14.
//  Copyright (c) 2014 Gloobus Studio. All rights reserved.
//

#import "GSSearchTableViewViewController.h"

@interface GSExampleTableViewController : GSSearchTableViewViewController{
    
}


@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) NSDate* testDate;
@property (strong,nonatomic) NSNumber *isActive;
@property (strong,nonatomic) NSString *selectedValue;
@property (strong,nonatomic) NSNumber *stepValue;
@property (strong,nonatomic) NSString *notes;



@end
