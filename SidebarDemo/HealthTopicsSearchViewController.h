//
//  HealthTopicsSearchViewController.h
//  DrugFinder
//
//  Created by Satish on 3/21/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HealthTopicsSearchViewController : UIViewController
{
    NSMutableArray *jsonarr;
    NSDictionary *dic;
    NSDictionary *suggestionGroup;
    NSDictionary *suggestionList;
    NSDictionary *suggestion;
    UIActivityIndicatorView *mySpinner;
}

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

@property (weak, nonatomic) IBOutlet UITextField *txt_search;
- (IBAction)act_search:(id)sender;

- (IBAction)act_search_end:(id)sender;

@property (weak, nonatomic) IBOutlet UITableView *tableview;
@end
