//
//  SingleDrugInteractionSearchViewController.h
//  DrugFinder
//
//  Created by Satish on 3/17/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SingleDrugInteractionSearchViewController : UIViewController
{
    NSMutableArray *jsonarr;
    NSDictionary *dic;
    NSDictionary *suggestionGroup;
    NSDictionary *suggestionList;
    NSDictionary *suggestion;
    
    NSDictionary *dic2;
    NSArray *jsonarr2;
    NSDictionary *drugGroup;
    NSMutableDictionary *conceptGroup;
    NSMutableDictionary *conceptProperties;
    NSArray *arr2;
    NSDictionary *resultdic;
}
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

@property (weak, nonatomic) IBOutlet UITextField *txt_search;
- (IBAction)act_search:(id)sender;

@property (nonatomic) NSString *str;
@property (nonatomic) NSString *strid;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@end
