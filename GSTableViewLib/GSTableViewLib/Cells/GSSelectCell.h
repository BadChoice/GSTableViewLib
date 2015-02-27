//
//  GSSelectCell.h
//  Taste
//
//  Created by MACJordi on 13/05/14.
//  Copyright (c) 2014 Gloobus Studio. All rights reserved.
//

#import "GSLabelCell.h"
#import "GSTableViewController.h"

@interface GSSelectCell : GSLabelCell<GSTableViewControllerDelegate>{
	GSTableViewController * mSelectViewController;
}

+(id)cellWithText:(NSString*)text andObject:(id)object andKey:(NSString*)key andSelect:(NSArray*)values;
+(id)cellWithText:(NSString*)text andObject:(id)object andKey:(NSString*)key andSelect:(NSArray*)values andImages:(NSArray*)images;


+(id)cellWithText:(NSString*)text andObject:(id)object andKey:(NSString*)key andSelectDict:(NSDictionary*)values keyIsNumber:(BOOL)keyIsNumber;
+(id)cellWithText:(NSString*)text andObject:(id)object andKey:(NSString*)key andSelectDict:(NSDictionary*)values andImages:(NSArray*)images keyIsNumber:(BOOL)keyIsNumber;


@property (nonatomic) BOOL keyIsNumber;
@property (strong,nonatomic) NSArray* selectValues;
@property (strong,nonatomic) NSDictionary* selectValuesDict;
@property (strong,nonatomic) NSArray* images;

@end
