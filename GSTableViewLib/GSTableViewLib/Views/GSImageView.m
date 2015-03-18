//
//  GSImageView.m
//  Taste
//
//  Created by Badchoice on 26/04/14.
//  Copyright (c) 2014 Gloobus Studio. All rights reserved.
//

#import "GSImageView.h"
#import <CommonCrypto/CommonDigest.h>


@implementation GSImageView

-(id)initWithCoder:(NSCoder *)aDecoder{
    if(self = [super initWithCoder:aDecoder]){
        [self setup];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self setup];
    }
    return self;
}

-(void)setup{
    mCurrentLoad = 0;
    _loading = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [_loading setHidden:YES];
    [_loading setFrame:CGRectMake(self.bounds.size.width*0.5 - 25, self.bounds.size.height*0.5 - 25, 50, 50)];
	[self addSubview:_loading];
    
    self.initialsLabel = [[UILabel alloc] initWithFrame:self.bounds];
	[self addSubview:self.initialsLabel];
	
	[self.initialsLabel setFont:[UIFont systemFontOfSize:self.bounds.size.height/2]];
	self.initialsLabel.textAlignment = NSTextAlignmentCenter;
    
}


-(void)loadImageFromServer:(NSString*)url{

    if(url != nil && ![url isEqualToString:@""]){
		NSString* imagePath = [NSString stringWithFormat:@"%@.png",[GSImageView md5:url]];
		
        self.image = [self loadImageFromDisk:imagePath];
        if(self.image == nil){
    
            currentImageUrl = url;
            [_loading setHidden:NO];
            [_loading startAnimating];
    
            dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                int loadToken = mCurrentLoad;

                NSError* error;
                NSURL * theUrl      = [NSURL URLWithString:[url stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding]];
                if(theUrl!=nil){
                    NSData * data       = [[NSData alloc] initWithContentsOfURL:theUrl  options:NSDataReadingUncached error:&error];
                    
                     dispatch_async(dispatch_get_main_queue(), ^(void){
                         [_loading setHidden:YES];
                         [_loading stopAnimating];
                     });
                    
                    if ( data == nil || error ){
                        self.image = nil;
                        return;
                    }
                    dispatch_async(dispatch_get_main_queue(), ^{
                        if(loadToken == mCurrentLoad)
                            self.image = [UIImage imageWithData: data];
                        [self saveToDisk:imagePath];
                    });
                }
            });
        }
		else{
			[self.initialsLabel setHidden:YES];
		}
    }
    else{
        self.image = nil;
        [_loading setHidden:YES];
        [_loading stopAnimating];
    }
}

-(void)drawShadow{
    self.layer.masksToBounds = NO;
    self.layer.cornerRadius = 15; // if you like rounded corners
    self.layer.shadowOffset = CGSizeMake(0, 10);
    self.layer.shadowRadius = 10;
    self.layer.shadowOpacity = 0.2;
    
    UIBezierPath* path      = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:15];
    self.layer.shadowPath   = path.CGPath;
}

-(void)setAsCircle{
    self.layer.cornerRadius = self.bounds.size.width*0.5f;
    self.layer.masksToBounds = YES;
}

-(void)setRoundBorders:(int)radius{
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
}

-(void)loadGravatar:(NSString*)email{
    NSMutableString *gravatarPath = [NSMutableString stringWithFormat:@"http://gravatar.com/avatar/%@?&default=mm", [GSImageView md5:email]];
    [self loadImageFromServer:gravatarPath];    
}

-(UIImage*)loadImageFromDisk:(NSString*)imagePath{
    NSArray *paths      = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePath  = [[paths objectAtIndex:0] stringByAppendingPathComponent:imagePath];
    
    UIImage* image      = [UIImage imageWithContentsOfFile:filePath];
    return image;
}

-(void)saveToDisk:(NSString*)imagePath{
    NSArray *paths      = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePath  = [[paths objectAtIndex:0] stringByAppendingPathComponent:imagePath];
    
    // Save image.
    [UIImagePNGRepresentation(self.image) writeToFile:filePath atomically:YES];
}


//================================================================
#pragma mark - INITIALS AND COLOR
#pragma mark -
//================================================================
-(void)setInitialLetters:(NSString*)fullName{
    
    fullName = [fullName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];//Trim leading whitespaces
	NSString* initials;
	NSArray * arr			= [fullName componentsSeparatedByString:@" "];
    self.initialsLabel.text = ([fullName length]>1)?  [fullName substringToIndex:1]: @"";
    
	if([arr count] > 1){
		NSString* first  = arr[0];
		NSString* second = arr[1];
		if([second length] > 0){
			initials = [NSString stringWithFormat:@"%@%@", [first substringToIndex:1],[second substringToIndex:1]];
			self.initialsLabel.text = initials;
		}
	}
	
	UIColor* color = [self getColorForName:fullName];
	[self setBackgroundColor:color];
	
	/*CGFloat hue, sat, bri, alpha;
	[color getHue:&hue saturation:&sat brightness:&bri alpha:&alpha];
	
	if(bri < 0.95){ [self.initialsLabel setTextColor:[UIColor whiteColor]]; }
	else		 { [self.initialsLabel setTextColor:[UIColor blackColor]];  }*/
    
    [self.initialsLabel setTextColor:[UIColor whiteColor]];
}

-(void)setInitialLettersAsFullText:(NSString*)fullName{
    
    NSArray * arr			= [fullName componentsSeparatedByString:@" "];
    self.initialsLabel.text = fullName;
    self.initialsLabel.adjustsFontSizeToFitWidth = YES;
    
    if([arr count] > 1){
        self.initialsLabel.numberOfLines = 2;
    }

    
    UIColor* color = [self getColorForName:fullName];
    [self setBackgroundColor:color];
    
    [self.initialsLabel setTextColor:[UIColor whiteColor]];
}

-(UIColor*)getColorForName:(NSString*)name{
	CGFloat red		= ((int)[name length]*50 % 256) / 256.0;
	CGFloat green	= ((int)[name length]*30 % 256) / 256.0;
	CGFloat blue	= ((int)[name length]*15 % 256) / 256.0;
	return [UIColor colorWithRed:red green:green blue:blue alpha:1];
}

+(NSString*)md5:(NSString*)string{
	if(string!=nil){
		const char *cStr = [string UTF8String];
		unsigned char digest[16];
		
		CC_MD5(cStr, (CC_LONG)strlen(cStr), digest);
		
		NSMutableString *md5 = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
		
		for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
			[md5 appendFormat:@"%02x", digest[i]];
		}
		return md5;
	}
	else
		return @"";
}

//================================================================
#pragma mark - BASE 64
#pragma mark -
//================================================================
+ (NSString *)imageToBase64:(UIImage*)image {
	return [UIImagePNGRepresentation(image) base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
}

+ (UIImage *)decodeBase64ToImage:(NSString *)strEncodeData {
	NSData *data = [[NSData alloc]initWithBase64EncodedString:strEncodeData options:NSDataBase64DecodingIgnoreUnknownCharacters];
	return [UIImage imageWithData:data];
	
	return [UIImage imageWithData:data];
	
	//return [UIImage imageWithData:[strEncodeData dataUsingEncoding:NSUTF8StringEncoding]];
}

+(UIImage*)resize:(UIImage*)originalImage newSize:(int)newSize{
	CGSize size = CGSizeMake(newSize, newSize);
	UIGraphicsBeginImageContext(size);
	[originalImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
	UIImage *destImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return destImage;
}

//===================================================
#pragma mark - DEALLOC
#pragma mark -
//===================================================
-(void)dealloc{
    self.loading       = nil;
    self.initialsLabel = nil;
    currentImageUrl    = nil;
}



@end
