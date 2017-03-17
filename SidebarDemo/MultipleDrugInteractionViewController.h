//
//  MultipleDrugInteractionViewController.h
//  DrugFinder
//
//  Created by Satish on 3/15/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import "ViewController.h"

@interface MultipleDrugInteractionViewController : ViewController <UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *idarr;
    NSMutableArray *namearr;
}
@property (nonatomic) NSString *str;
@property (nonatomic) NSArray *arraydrug;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSArray *transportarray;
- (IBAction)act_clear:(id)sender;

- (IBAction)act_checkforintraction:(id)sender;

@end
