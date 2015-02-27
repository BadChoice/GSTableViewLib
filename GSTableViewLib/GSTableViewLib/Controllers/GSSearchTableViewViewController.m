//
//  GSSearchTableViewViewController.m
//  Taste
//
//  Created by Badchoice on 14/05/14.
//  Copyright (c) 2014 Gloobus Studio. All rights reserved.
//

#import "GSSearchTableViewViewController.h"

@interface GSSearchTableViewViewController ()

@end

@implementation GSSearchTableViewViewController


-(void)viewDidLoad{
    [super viewDidLoad];
    
    searchBar			= [[UISearchBar alloc] initWithFrame:CGRectMake(0, 70, 320, 44)];
    searchBar.delegate	= self;
    
    [[self tableView] setTableHeaderView:searchBar];
    
    isFiltered = false;
    
    _filteredSections = [[NSMutableArray alloc] init];
}


//================================================
#pragma mark - TABLE VIEW DELEGATE
//================================================
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (tableView != self.tableView){
        return [self.filteredSections count];
    }
    else{
        return [self.sections count];
    }

}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(isFiltered){
        return ((GSTableViewSection*)self.filteredSections[section]).header;
    }
    else{
        return ((GSTableViewSection*)self.sections[section]).header;
    }
}

-(NSString*)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    if(isFiltered){
        return ((GSTableViewSection*)self.filteredSections[section]).footer;
    }
    else{
        return ((GSTableViewSection*)self.sections[section]).footer;
    }

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(isFiltered){
        return [((GSTableViewSection*)self.filteredSections[section]).cells count];
    }
    else{
        return [((GSTableViewSection*)self.sections[section]).cells count];
    }
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(isFiltered){
        return ((GSTableViewSection*)self.filteredSections[indexPath.section]).cells[indexPath.row];
    }
    else{
        return ((GSTableViewSection*)self.sections[indexPath.section]).cells[indexPath.row];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    GSBaseCell* cell;
    if(isFiltered){
        cell = ((GSTableViewSection*)self.filteredSections[indexPath.section]).cells[indexPath.row];
    }
    else{
        cell = ((GSTableViewSection*)self.sections[indexPath.section]).cells[indexPath.row];
    }

    return [cell cellHeight];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    GSBaseCell *cell;
    if(isFiltered){
        cell =  ((GSTableViewSection*)self.filteredSections[indexPath.section]).cells[indexPath.row];
    }
    else{
        cell =  ((GSTableViewSection*)self.sections[indexPath.section]).cells[indexPath.row];
    }

    [cell onCellPressed:self.tableView indexPath:indexPath controller:self];
	
	if(self.gsDelegate!=nil){
        [self.gsDelegate GSTableView:self onCellPressed:cell atIndexPath:indexPath];
	}
}



//==============================================================================
#pragma mark - SEARCH DELEGATE
#pragma mark -
//==============================================================================
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    if(searchText.length == 0)
    {
        isFiltered = FALSE;
    }
    else
    {
        isFiltered = true;
        
        [_filteredSections removeAllObjects];
        
        for(GSTableViewSection* section in self.sections){
            GSTableViewSection* filteredSection = [[GSTableViewSection alloc] init];
            
            for(GSBaseCell* cell in section.cells){
                
                NSString* cellText              = [cell.text.text uppercaseString];
                NSString* searchTextUppercase   = [searchText uppercaseString];
                
                if ([cellText rangeOfString:searchTextUppercase].location != NSNotFound) {
                    [filteredSection.cells addObject:cell];
                }
            }
            [_filteredSections addObject:filteredSection];
        }
    }
    
    [self.tableView reloadData];
}


-(void)dealloc{
    searchBar               = nil;
}


@end
