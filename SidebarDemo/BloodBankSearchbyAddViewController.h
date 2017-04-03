//
//  BloodBankSearchbyAddViewController.h
//  DrugFinder
//
//  Created by Satish on 3/31/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BloodBankSearchbyAddViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *txt_state;
@property (weak, nonatomic) IBOutlet UIView *state_uiview;
@property (weak, nonatomic) IBOutlet UITableView *statetableview;

- (IBAction)act_state:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lbl_state;
@property (weak, nonatomic) IBOutlet UILabel *lbl_city;
@property (weak, nonatomic) IBOutlet UITableView *citytableview;
- (IBAction)act_city:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *city_uiview;

@end
