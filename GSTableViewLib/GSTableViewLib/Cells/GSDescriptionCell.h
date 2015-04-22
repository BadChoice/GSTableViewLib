//
//  GSDescriptionCell.h
//  GSTableViewLib
//
//  Created by MACJordi on 14/4/15.
//  Copyright (c) 2015 Gloobus Studio. All rights reserved.
//

#import "GSBaseCell.h"

@interface GSDescriptionCell : GSBaseCell{
	int mNumberOfLines;
}

@property (nonatomic) BOOL			clearColor;

+(id)cellWithText:(NSString*)text withClearColor:(BOOL)clearColor;
@end
