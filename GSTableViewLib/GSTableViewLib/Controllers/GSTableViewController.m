//
//  GSTableViewController.m
//  Taste
//
//  Created by Badchoice on 12/05/14.
//  Copyright (c) 2014 Gloobus Studio. All rights reserved.
//

#import "GSTableViewController.h"

#import "GSTextFieldCell.h"
#import "GSSwitchCell.h"
#import "GSDateCell.h"
#import "GSButtonCell.h"
#import "GSSelectCell.h"

#import "GSSteperCell.h"
#import "GSTextCell.h"
#import "GSDetailCell.h"


@interface GSTableViewController ()

@end

@implementation GSTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        [self setup];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];    
}

-(void)setup{
    _sections   = [[NSMutableArray alloc] init];    
}



//================================================
#pragma mark - TABLE VIEW DELEGATE
//================================================
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [_sections count];
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return ((GSTableViewSection*)_sections[section]).header;
}

-(NSString*)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    return ((GSTableViewSection*)_sections[section]).footer;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [((GSTableViewSection*)_sections[section]).cells count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return ((GSTableViewSection*)_sections[indexPath.section]).cells[indexPath.row];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    GSBaseCell* cell = ((GSTableViewSection*)_sections[indexPath.section]).cells[indexPath.row];
    return [cell cellHeight];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    GSBaseCell *cell =  ((GSTableViewSection*)_sections[indexPath.section]).cells[indexPath.row];
		
    [cell onCellPressed:self.tableView indexPath:indexPath controller:self];
	
	if(_gsDelegate!=nil){
        [_gsDelegate GSTableView:self onCellPressed:cell atIndexPath:indexPath];
	}
}

-(int)count{
	return (int)[self.sections count];
}

//================================================
#pragma mark - DEALLOC
//================================================
-(void)dealloc{
    self.gsDelegate = nil;
    self.sections   = nil;
    self.tableView.delegate = nil;
    self.tableView.dataSource = nil;
    self.tableView = nil;
}


@end
