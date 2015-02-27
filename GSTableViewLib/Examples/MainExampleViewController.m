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
	
	self.sampleModel = [[SampleModel alloc] init];
	[self.sampleModel setExampleDataToProperties];
	
	GSTableViewSection* firstSection = [[GSTableViewSection alloc] init];
	firstSection.header = @"First section";
	
	/**
	 #import "GSSelectCell.h"
	 #import "GSSelectModelCell.h"
	 #import "GSModelCell.h"
	 */
	 
	
	//-------------------------------------------
	// Basic cells
	//-------------------------------------------
	[firstSection.cells addObject:[GSLabelCell		cellWithText:@"A simple label cell"]];
	
	[firstSection.cells addObject:[GSTextFieldCell  cellWithText:@"Text field"
													   andObject:self.sampleModel
														  andKey:@"name"]];
	
	[firstSection.cells addObject:[GSSwitchCell		cellWithText:@"Enabled"
													andObject:self.sampleModel
													   andKey:@"enabled"]];
	
	[firstSection.cells addObject:[GSNumberCell		cellWithText:@"Number"
													andObject:self.sampleModel
													   andKey:@"number"]];
	
	[firstSection.cells addObject:[GSFloatCell		cellWithText:@"Decimal"
												   andObject:self.sampleModel
													  andKey:@"decimalNumber"]];
	
	[firstSection.cells addObject:[GSSteperCell		cellWithText:@"Stepper"
													andObject:self.sampleModel
													   andKey:@"stepper"]];
	
	[firstSection.cells addObject:[GSDateCell		cellWithText:@"Date"
												  andObject:self.sampleModel
													 andKey:@"date"
											  andPickerMode:UIDatePickerModeDateAndTime]];
	
	
	[firstSection.cells addObject:[GSButtonCell     cellWithText:@"Button" andAction:^{
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
	// Cells with subcontrollers
	//-------------------------------------------
	GSTableViewSection* secondSection = [[GSTableViewSection alloc] init];
	secondSection.header = @"Second section";
	
	[secondSection.cells addObject:[GSSelectCell cellWithText:@"Select string"
												   andObject:self.sampleModel
													  andKey:@"select"
													andSelect:@[@"Amazing",@"Great",@"Good",@"Normal",@"Poor",@"Shit"]
								   ]];
	
	[secondSection.cells addObject:[GSSelectCell cellWithText:@"Select with id" andObject:self.sampleModel andKey:@"selectId" andSelectDict:@{
										  @1 : @"Amazing",
										  @2 : @"Great",
										  @3 : @"Good",
										  @4 : @"Normal",
										  @5 : @"Poor",
										  @6 : @"Shit"
										} keyIsNumber:YES]];
	
	
	[secondSection.cells addObject:[GSControllerCell cellWithText:@"Search example"
													andController:[[SearchExampleViewController alloc] init]
	]];
	
	
	[secondSection.cells addObject:[GSDetailCell
									 cellWithText:@"Model edit"
									 andController:[[ModelDetailExampleViewController alloc] initWithStyle:UITableViewStyleGrouped]]];
		
	
	[self.sections addObject:firstSection];
	[self.sections addObject:secondSection];
}



@end
