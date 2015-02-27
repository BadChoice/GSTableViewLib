//
//  GSSelectModelCell.h
//  Taste
//
//  Created by MACJordi on 16/05/14.
//  Copyright (c) 2014 Gloobus Studio. All rights reserved.
//

#import "GSLabelCell.h"
#import "GSSearchTableViewViewController.h"

@interface GSSelectModelCell : GSLabelCell<GSTableViewControllerDelegate>{
	GSTableViewController* mSelectViewController;
}

@property (strong,nonatomic) NSArray *modelsArray;
@property (strong,nonatomic) NSArray *extraCells;
@property (nonatomic)  BOOL isSearcheable;

@property (strong,nonatomic) NSString* nullText;



+(id)cellWithText:(NSString*)text andObject:(id)object andKey:(NSString*)key andModelsArray:(NSArray*)modelsArray;

@end
