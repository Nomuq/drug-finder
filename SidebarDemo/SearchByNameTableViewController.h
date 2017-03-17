//
//  SearchByNameTableViewController.h
//  DrugFinder
//
//  Created by Satish on 3/13/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchByNameTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tablevirw;

@property (nonatomic) NSString *first_name;
@property (nonatomic) NSString *middle_name;
@property (nonatomic) NSString *last_name;







@end
