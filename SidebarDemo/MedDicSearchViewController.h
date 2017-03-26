//
//  MedDicSearchViewController.h
//  DrugFinder
//
//  Created by Satish on 3/26/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MedDicSearchViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,NSXMLParserDelegate>
{
    
}
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (weak, nonatomic) IBOutlet UITextField *txt_search;
- (IBAction)act_search:(id)sender;
- (IBAction)act_search_end:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UIView *uiview_info;

- (IBAction)tap:(id)sender;
- (IBAction)swipe:(id)sender;

@end
