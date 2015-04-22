//
//  GSBaseCell.m
//  Taste
//
//  Created by Badchoice on 12/05/14.
//  Copyright (c) 2014 Gloobus Studio. All rights reserved.
//

#import "GSBaseCell.h"



@implementation GSBaseCell

//====================================
#pragma mark - CONSTRUCTORS
#pragma mark -
//====================================
+(id)cellWithText:(NSString*)text{
    
    GSBaseCell* cell = [[self.class alloc] initWithFrame:CGRectMake(0, 0, 200, 45)];
    cell.text.text  = text;
    
    return cell;
}

+(id)cellWithText:(NSString*)text andImage:(UIImage*)image{
    GSBaseCell* cell = [self.class cellWithText:text];
    cell.image.image = image;
	[cell.image setHidden:NO];
    [cell updateLayout];
    return cell;
}

+(id)cellWithText:(NSString*)text andImage:(UIImage*)image andObject:(id)object andKey:(NSString*)key{
    GSBaseCell* cell = [self.class cellWithText:text andObject:object andKey:key];
    cell.image.image = image;
	[cell.image setHidden:NO];
    [cell updateLayout];
    return cell;
}

+(id)cellWithText:(NSString*)text andObject:(id)object andKey:(NSString*)key{
    GSBaseCell* cell        = [self.class cellWithText:text];
    cell.text.text          = text;
    cell.object             = object;
    cell.objectProperty     = key;
    
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:NSStringFromClass([self class])];
    if (self) {
        [self setup];
    }
    return self;
}


-(void)setup{
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    isValid         = true;
    _isRequired     = false;
    _isEditable     = false;
    
    _text  = [[UILabel alloc]     initWithFrame:CGRectMake(TEXT_X, TEXT_Y, CONTROL_SIZE, 25)];
    _image = [[GSImageView alloc] initWithFrame:CGRectMake(TEXT_X, 7, IMAGE_SIZE, IMAGE_SIZE)];
	[_image setHidden:YES];
    
    [_text setText:@"Hola"];
    
    [self.contentView addSubview:_text];
    [self.contentView addSubview:_image];
}

-(void)updateLayout{
    if(![_image isHidden]){
        [_text setFrame:CGRectMake(TEXT_X + IMAGE_SIZE + 7  , TEXT_Y, CONTROL_SIZE, 25)];
    }
    else{
        [_text setFrame:CGRectMake(TEXT_X                   , TEXT_Y, CONTROL_SIZE, 25)];
    }
	[self updateValid];
}

-(void)onCellPressed:(UITableView*)tableView indexPath:(NSIndexPath*)index controller:(UIViewController*)controller{
    
}

-(void)updateModelObject:(id)value{
    if(_object != nil)
        [_object setValue:value forKey:_objectProperty];
	
	[self updateValid];
    
    if[(self.delegate) self.delegate onValueChanged:self];
}

- (BOOL) isIntegerNumber: (NSString*)input
{
    return [input integerValue] != 0 || [input isEqualToString:@"0"];
}


//====================================
#pragma mark - CELL SETUP
#pragma mark -
//====================================
-(CGFloat)cellHeight{
    return 56;
}

-(void)updateValid{
	if([self checkValid])	[self setValidColor];
	else					[self setInvalidColor];
}

-(BOOL)checkValid{
	return YES;
}

-(void)setValidColor{
	[self setBackgroundColor:[UIColor whiteColor]];
	isValid = true;
}

-(void)setInvalidColor{
	[self setBackgroundColor:[UIColor yellowColor]];
	isValid = false;
}

//================================================
#pragma mark - SETS
//================================================
-(void)setIsRequired:(BOOL)isRequired{
	_isRequired = isRequired;
	if(self.validator == nil){
		self.validator = [[GSValidator alloc] init];
	}
	GSValidatorRequired* requiredValidator = [[GSValidatorRequired alloc] init];
	if(_isRequired){
		if(![self.validator.validations containsObject:requiredValidator]){
			[self.validator.validations addObject:requiredValidator];
		}
	}
	else{
		if([self.validator.validations containsObject:requiredValidator]){
			[self.validator.validations removeObject:requiredValidator];
		}
	}
	[self updateValid];
}

//================================================
#pragma mark - TABLE VIEW DELEGATE
//================================================
-(void)dealloc{
    self.image          = nil;
    self.object         = nil;
    self.text           = nil;
    self.objectProperty = nil;
}

@end
