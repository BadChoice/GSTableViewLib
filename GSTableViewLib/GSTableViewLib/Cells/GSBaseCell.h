//
//  GSBaseCell.h
//  Taste
//
//  Created by Badchoice on 12/05/14.
//  Copyright (c) 2014 Gloobus Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GSImageView.h"
#import "GSValidatorEmail.h"
#import "GSValidatorRequired.h"

#define TEXT_Y 15
#define TEXT_X 12
#define CONTROL_SIZE 180
#define IMAGE_SIZE 40
#define ACCESSORY_WIDTH 30

@interface GSBaseCell : UITableViewCell{

    BOOL isValid;
}

@property (strong,nonatomic) GSImageView*   image;
@property (strong,nonatomic) UILabel*       text;


@property (weak,nonatomic) id				object;
@property (strong,nonatomic) NSString       *objectProperty;

@property (nonatomic)   BOOL                isRequired;
@property (strong,nonatomic) GSValidator*	validator;

@property (nonatomic) BOOL                  isEditable;

@property (nonatomic,weak) UITableView*     parentTableview;




//Constructors
+(id)cellWithText:(NSString*)text;
+(id)cellWithText:(NSString*)text andImage:(UIImage*)image;
+(id)cellWithText:(NSString*)text andImage:(UIImage*)image andObject:(id)object andKey:(NSString*)key;
+(id)cellWithText:(NSString*)text andObject:(id)object andKey:(NSString*)key;


-(void)setup;
-(void)onCellPressed:(UITableView*)tableView indexPath:(NSIndexPath*)index controller:(UIViewController*)controller;

//Model related bindings
-(void)updateModelObject:(id)value;
-(void)updateLayout;

//Cell setup
-(CGFloat)cellHeight;
-(void)updateValid;
-(BOOL)isIntegerNumber: (NSString*)input;
@end
