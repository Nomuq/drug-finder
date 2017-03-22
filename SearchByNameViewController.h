//
//  SearchByNameViewController.h
//  DrugFinder
//
//  Created by Satish on 3/13/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import "ViewController.h"

@interface SearchByNameViewController : ViewController

@property (weak, nonatomic) IBOutlet UITextField *txt_fname;
@property (weak, nonatomic) IBOutlet UITextField *txt_middlename;
@property (weak, nonatomic) IBOutlet UITextField *txt_lastname;
- (IBAction)act_search:(id)sender;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;



@end
