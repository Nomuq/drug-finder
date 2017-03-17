//
//  DrugInfoViewController.h
//  SidebarDemo
//
//  Created by Satish on 3/12/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import "ViewController.h"

@interface DrugInfoViewController : ViewController <UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *jsonarr;
    NSDictionary *dic;
    NSDictionary *suggestionGroup;
    NSDictionary *suggestionList;
    NSDictionary *suggestion;
}
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

@property (weak, nonatomic) IBOutlet UITextField *txt_search;
- (IBAction)act_search:(id)sender;


@property (weak, nonatomic) IBOutlet UITableView *tableview;


@end
