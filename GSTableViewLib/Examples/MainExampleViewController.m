//
//  MainExampleViewController.m
//  GSTableViewLib
//
//  Created by MACJordi on 27/2/15.
//  Copyright (c) 2015 Gloobus Studio. All rights reserved.
//

#import "MainExampleViewController.h"
#import "ModelDetailExampleViewController.h"
#import "SearchExampleViewController.h"

#import "GSTableViewLib.h"
#import "GSAlertView.h"

@interface MainExampleViewController ()

@end

@implementation MainExampleViewController

/**
 * Configure the cells of the tableview
 */
-(void)setup{
	[super setup];
	
	self.title = @"GSTableViewLib";
	
    self.selectModel            = [[SampleModel alloc] init];
	self.sampleModel            = [[SampleModel alloc] init];
    self.sampleModelWithInfo    = [[SampleModelWithDetailInfo alloc] init];
        
	GSTableViewSection* firstSection = [[GSTableViewSection alloc] init];
	firstSection.header = @"Basic cells";
	
	/**
	 #import "GSSelectCell.h"
	 #import "GSSelectModelCell.h"
	 #import "GSModelCell.h"
	 */
	 
	
	//-------------------------------------------
	// Basic cells
	//-------------------------------------------
	[firstSection addCell:[GSLabelCell		cellWithText:@"A simple label cell"]];
	
	[firstSection addCell:[GSTextFieldCell  cellWithText:@"Text field"
													   andObject:self.sampleModel
														  andKey:@"name"]];
	
	[firstSection addCell:[GSSwitchCell		cellWithText:@"Enabled"
													andObject:self.sampleModel
													   andKey:@"enabled"]];
	
	[firstSection addCell:[GSNumberCell		cellWithText:@"Number"
													andObject:self.sampleModel
													   andKey:@"number"]];
	
	[firstSection addCell:[GSFloatCell		cellWithText:@"Decimal"
												   andObject:self.sampleModel
													  andKey:@"decimalNumber"]];
	
	[firstSection addCell:[GSSteperCell		cellWithText:@"Stepper"
													andObject:self.sampleModel
													   andKey:@"stepper"]];
	
	[firstSection addCell:[GSDateCell		cellWithText:@"Date"
												  andObject:self.sampleModel
													 andKey:@"date"
											  andPickerMode:UIDatePickerModeDateAndTime]];
	
	
	[firstSection addCell:[GSButtonCell     cellWithText:@"Button" andAction:^{
		GSAlertView* alert = [[GSAlertView alloc] initWithTitle:@"Button pressed"
														message:@"A button has been pressed"
													   delegate:nil
											  cancelButtonTitle:@"Ok"
											  otherButtonTitles:nil];
		[alert showWithCompletion:^(UIAlertView *alertView, NSInteger buttonIndex) {
			NSLog(@"alert closed");
		}];
		
	}]];
	
	//-------------------------------------------
	// SELECT CELLS
	//-------------------------------------------
	GSTableViewSection* secondSection = [[GSTableViewSection alloc] init];
	secondSection.header = @"Select cells";
	
	[secondSection addCell:[GSSelectCell cellWithText:@"Select string"
												   andObject:self.sampleModel
													  andKey:@"select"
													andSelect:@[@"Amazing",@"Great",@"Good",@"Normal",@"Poor",@"Shit"]
								   ]];
	
	[secondSection addCell:[GSSelectCell cellWithText:@"Select with id" andObject:self.sampleModel andKey:@"selectId" andSelectDict:@{
										  @1 : @"Amazing",
										  @2 : @"Great",
										  @3 : @"Good",
										  @4 : @"Normal",
										  @5 : @"Poor",
										  @6 : @"Shit"
										} keyIsNumber:YES]];
	
    
    [secondSection addCell:[GSSelectModelCell cellWithText:@"Select model"
                                                 andObject:self
                                                    andKey:@"selectModel"
                                            andModelsArray:[SampleModel createModelsArray]]];
    

    //-------------------------------------------
    // OTHER CELLS
    //-------------------------------------------
    GSTableViewSection* thirdSection = [[GSTableViewSection alloc] init];
    thirdSection.header = @"Other cells";
    
    [thirdSection addCell:[GSControllerCell cellWithText:@"Search example"
                                            andController:[[SearchExampleViewController alloc] init]
                            ]];
    
    
    [thirdSection addCell:[GSModelCell cellWithText:@"Model cell (Default)"
                                           andObject:self
                                              andKey:@"sampleModel"
                                            andModel:self.sampleModel]];
    
    [thirdSection addCell:[GSModelCell cellWithText:@"Model cell (Custom)"
                                          andObject:self
                                             andKey:@"sampleModelWithInfo"
                                           andModel:self.sampleModelWithInfo]];
    
    
    [thirdSection addCell:[GSDetailCell
                           cellWithText:@"Subcontroller"
                           andController:[[ModelDetailExampleViewController alloc] initWithStyle:UITableViewStyleGrouped]]];
    
    
    
	
	[self addSection:firstSection];
	[self addSection:secondSection];
	[self addSection:thirdSection];
}



@end
