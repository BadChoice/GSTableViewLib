//
//  GSExampleTableViewController.m
//  Taste
//
//  Created by Badchoice on 13/05/14.
//  Copyright (c) 2014 Gloobus Studio. All rights reserved.
//

#import "GSExampleTableViewController.h"

#import "GSTextFieldCell.h"
#import "GSSwitchCell.h"
#import "GSDateCell.h"
#import "GSButtonCell.h"
#import "GSSelectCell.h"

#import "GSSteperCell.h"
#import "GSTextCell.h"
#import "GSDetailCell.h"
#import "GSNumberCell.h"




@interface GSExampleTableViewController ()

@end

@implementation GSExampleTableViewController

-(void)setup{
    [super setup];
    
    
    /*NSArray* cellsDefinition = @[
                                 @{
                                    @"type"     :@(GSCellTypeTextField),
                                    @"label"    :@"Name",
                                    @"object"   :self,
                                    @"key"      :@"name"
                                    }
                                 ];
    
    
    [self.sections addObject:[GSTableViewSection createSectionFromDefinition:cellsDefinition]];
    
    
    self.name = @"Jordi Puigdellívol";
    
	//GSTODO :: Remove it all from here when done
    //--------------
    GSTableViewSection* section = [[GSTableViewSection alloc] init];
    section.header = @"Model";
    [section.cells addObject:[GSTextFieldCell  cellWithText:@"Name"    andObject:self andKey:@"name"]];
    [section.cells addObject:[GSSwitchCell     cellWithText:@"Active"  andObject:self andKey:@"isActive"]];
    [section.cells addObject:[GSDateCell       cellWithText:@"Date"    andObject:self andKey:@"testDate"]];
    [section.cells addObject:[GSSteperCell     cellWithText:@"Steper"  andObject:self andKey:@"stepValue"]];
    [section.cells addObject:[GSNumberCell     cellWithText:@"Number"  andObject:nil  andKey:nil]];
    [section.cells addObject:[GSTextCell       cellWithText:@"Notes"   andObject:self andKey:@"notes"]];
	
	[section.cells addObject:[GSSelectCell cellWithText:@"Select"
											  andObject:self
												 andKey:@"selectedValue"
											  andSelect:@[@"Item 1",@"Item 2",@"Item 3",@"Item 4"]]];
    
    [section.cells addObject:[GSSelectCell cellWithText:@"Select with images"
											  andObject:self
												 andKey:@"selectedValue"
											  andSelect:@[@"Item 1",@"Item 2"]
                                            andImages:@[[UIImage imageNamed:@"logo.png"],[UIImage imageNamed:@"logo.png"]]]];
	
    
	[section.cells addObject:[GSDetailCell cellWithText:@"Detail" andController:[[GSTableViewController alloc] initWithStyle:UITableViewStyleGrouped]]];
    
    [self.sections addObject:section];
    
    [self.sections addObject:[GSTableViewSection createSectionForModelArray   :[GSMenuItem all] withDetail:YES ofObject:[GSMenuItem class] withNullText:@"No discount"]];
    [self.sections addObject:[GSTableViewSection createSectionForModel        :[GSMenuItem class]]];
    
    
    
    //--------------
    GSTableViewSection* section2 = [[GSTableViewSection alloc] init];
    [section2.cells addObject:[GSButtonCell cellWithText:@"The Button" andAction:^{
        DLog(@"Button pressed!");
    }]];
    
    section2.header = @"Actions";
    [self.sections addObject:section2];
    
    
    GSTableViewSection* section3 = [GSTableViewSection createSectionForModelArray:[GSCustomer all] withDetail:NO ofObject:nil withNullText:@"No discount"];
    [self.sections addObject:section3];*/
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    /*if(indexPath.section == 5){
        GSCustomer* c = [GSCustomer all][indexPath.row];
        GSBaseCell* cell = ((GSBaseCell*)[super tableView:tableView cellForRowAtIndexPath:indexPath]);
        [cell.image loadGravatar:c.email];
        [cell.image setAsCircle];
        [cell updateLayout];
        return cell;
    }
    else*/ return [super tableView:tableView cellForRowAtIndexPath:indexPath];
}


@end
