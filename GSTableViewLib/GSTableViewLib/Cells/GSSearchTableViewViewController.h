//
//  GSSearchTableViewViewController.h
//  Taste
//
//  Created by Badchoice on 14/05/14.
//  Copyright (c) 2014 Gloobus Studio. All rights reserved.
//

#import "GSTableViewController.h"

@interface GSSearchTableViewViewController : GSTableViewController<UISearchBarDelegate,UISearchBarDelegate>{
    
    BOOL isFiltered;
    UISearchBar *searchBar;
}

@property (strong,nonatomic) NSMutableArray* filteredSections;

@end
