//
//  GSDateCell.h
//  Taste
//
//  Created by Badchoice on 12/05/14.
//  Copyright (c) 2014 Gloobus Studio. All rights reserved.
//

#import "GSLabelCell.h"

@interface GSDateCell : GSLabelCell{
    BOOL isVisible;
    NSDateFormatter *format;
}

@property (strong,nonatomic) UIDatePicker   *datePicker;
@property (nonatomic)		 UIDatePickerMode datePickerMode;

+(id)cellWithText:(NSString*)text andObject:(id)object andKey:(NSString*)key andPickerMode:(UIDatePickerMode)pickerMode;
@end
