//
//  GSDateCell.m
//  Taste
//
//  Created by Badchoice on 12/05/14.
//  Copyright (c) 2014 Gloobus Studio. All rights reserved.
//

#import "GSDateCell.h"

@implementation GSDateCell

+(id)cellWithText:(NSString*)text andObject:(id)object andKey:(NSString*)key andPickerMode:(UIDatePickerMode)pickerMode{
	GSDateCell* cell		= [GSDateCell cellWithText:text andObject:object andKey:key];
	cell.datePickerMode		= pickerMode;
	return cell;
}

-(void)setup{
    [super setup];
    isVisible = false;
    
    format = [[NSDateFormatter alloc] init];
	[format setDateFormat:@"yyyy-MM-dd hh:mm"];
    
    
    _datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 45, 360, 240)];
    [self addSubview:_datePicker];
    
    self.clipsToBounds = YES;
    
	[_datePicker addTarget:self action:@selector(didChange) forControlEvents:UIControlEventValueChanged];
    [self didChange];
}

//==========================================================================
#pragma mark - SHOW/HIDE
#pragma mark -
//==========================================================================
-(void)onCellPressed:(UITableView*)tableView indexPath:(NSIndexPath*)index controller:(UIViewController*)controller{
    isVisible = !isVisible;
	if(isVisible) [self showDatePickerCell:tableView];
	else		  [self hideDatePickerCell:tableView];
}

- (void)showDatePickerCell:(UITableView*)tableview {
 
	[tableview beginUpdates];
	[tableview endUpdates];
 
	self.datePicker.hidden = NO;
	self.datePicker.alpha = 0.0f;
 
	[UIView animateWithDuration:0.25 animations:^{
		self.datePicker.alpha = 1.0f;
	}];
}

- (void)hideDatePickerCell:(UITableView*)tableview  {
	
	[tableview beginUpdates];
	[tableview endUpdates];
 
	[UIView animateWithDuration:0.25
					 animations:^{
						 self.datePicker.alpha = 0.0f;
					 }
					 completion:^(BOOL finished){
						 self.datePicker.hidden = YES;
					 }];
}


-(CGFloat)cellHeight{
    if(isVisible)
        return 250;
    else
        return [super cellHeight];
}

//==========================================================================
#pragma mark - did change
#pragma mark -
//==========================================================================
-(void)didChange{
	if(self.label != nil){
		self.label.text = [format stringFromDate:[_datePicker date]];
	}
	
	if([self.object isKindOfClass:[NSDate class]]){
		[self updateModelObject:_datePicker.date];
	}
	else{
    	[self updateModelObject:[format stringFromDate:[_datePicker date]]];
	}
}

//==================================================================
#pragma mark - Picker Mode
#pragma mark -
//==================================================================
-(void)setDatePickerMode:(UIDatePickerMode)datePickerMode{
	_datePickerMode = datePickerMode;
	self.datePicker.datePickerMode = _datePickerMode;
	
	switch (datePickerMode) {
		case UIDatePickerModeDate:
			[format setDateFormat:@"yyyy-MM-dd"];
			break;
		case UIDatePickerModeDateAndTime:
			[format setDateFormat:@"yyyy-MM-dd hh:mm"];
			break;
		case UIDatePickerModeTime:
			[format setDateFormat:@"hh:mm"];
			break;
		case UIDatePickerModeCountDownTimer:
			[format setDateFormat:@"hh:mm"];
			break;
		default:
			break;
	}
}

//================================================
#pragma mark - TABLE VIEW DELEGATE
//================================================
-(void)dealloc{
    self.datePicker = nil;
}
@end
