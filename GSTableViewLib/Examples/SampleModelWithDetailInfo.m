//
//  SampleModelWithDetailInfo.m
//  GSTableViewLib
//
//  Created by MACJordi on 27/2/15.
//  Copyright (c) 2015 Gloobus Studio. All rights reserved.
//

#import "SampleModelWithDetailInfo.h"
#import "GSTableViewLib.h"

@implementation SampleModelWithDetailInfo

-(GSTableViewSection*)createTableViewSection{
	GSTableViewSection* section = [[GSTableViewSection alloc] init];
	
	[section.cells addObject:[GSLabelCell		cellWithText:@"A simple label cell"]];
	
	[section.cells addObject:[GSTextFieldCell  cellWithText:@"Text field"
													   andObject:self
														  andKey:@"name"]];
	
	[section.cells addObject:[GSSwitchCell		cellWithText:@"Enabled"
													andObject:self
													   andKey:@"enabled"]];
	
	[section.cells addObject:[GSNumberCell		cellWithText:@"Number"
													andObject:self
													   andKey:@"number"]];
	
	[section.cells addObject:[GSFloatCell		cellWithText:@"Decimal"
												   andObject:self
													  andKey:@"decimalNumber"]];
	
	[section.cells addObject:[GSSteperCell		cellWithText:@"Stepper"
													andObject:self
													   andKey:@"stepper"]];
	
	[section.cells addObject:[GSDateCell		cellWithText:@"Date"
												  andObject:self
													 andKey:@"date"
											  andPickerMode:UIDatePickerModeDateAndTime]];
	
	return section;	
}

@end
