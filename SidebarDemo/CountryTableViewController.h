//
//  CountryTableViewController.h
//  DrugFinder
//
//  Created by Satish on 3/14/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CountryTableViewController : UITableViewController <UITabBarDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
