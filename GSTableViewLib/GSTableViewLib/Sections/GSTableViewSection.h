//
//  GSTableViewSection.h
//  Taste
//
//  Created by Badchoice on 12/05/14.
//  Copyright (c) 2014 Gloobus Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GSBaseCell.h"

@interface GSTableViewSection : NSObject

@property (strong,nonatomic) NSMutableArray* cells;

@property (strong,nonatomic) NSString* header;
@property (strong,nonatomic) NSString* footer;


+(GSTableViewSection*)createSectionForModel:(Class)class andObject:(NSObject*)object;
+(GSTableViewSection*)createSectionForModelArray:(NSArray*)modelArray withDetail:(BOOL)withDetail ofObject:(Class)class;
+(GSTableViewSection*)createSectionForModelArray:(NSArray*)modelArray withDetail:(BOOL)withDetail ofObject:(Class)class withNullText:(NSString *)nullText;
+(GSTableViewSection*)createSectionForArray:(NSArray*)modelArray;
+(GSTableViewSection*)createSectionFromDefinition:(NSArray*)definitions;

-(void)addCell:(GSBaseCell*)cell;
@end
