//
//  GSTableViewController.h
//  Taste
//
//  Created by Badchoice on 12/05/14.
//  Copyright (c) 2014 Gloobus Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GSBaseCell.h"
#import "GSTableViewSection.h"


enum{
    GSCellTypeLabel,
    GSCellTypeTextField,
    GSCellTypeSwitch,
    GSCellTypeDate,
    GSCellTypeButton,
    GSCellTypeSelect,
    GSCellTypeDetail,
    GSCellTypeText,
    GSCellTypeStepper,
    GSCellTypeNumber,
};
typedef NSUInteger GSCellType;



@protocol GSTableViewControllerDelegate <NSObject>
-(void)GSTableView:(id)tableViewController onCellPressed:(GSBaseCell*)cell atIndexPath:(NSIndexPath*)indexPath;
@end

@interface GSTableViewController : UITableViewController{
 
}

@property (weak,nonatomic) id<GSTableViewControllerDelegate> gsDelegate;

@property (strong,nonatomic) NSMutableArray* sections;

@property (strong,nonatomic) UILabel* parentControllerLabel;


-(void)addSection:(GSTableViewSection*)section;

-(void)setup;
-(int)count;

@end
