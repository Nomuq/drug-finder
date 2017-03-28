//
//  SearchByNameViewController.m
//  DrugFinder
//
//  Created by Satish on 3/13/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import "SearchByNameViewController.h"
#import "SearchByNameTableViewController.h"
#import "SWRevealViewController.h"
@interface SearchByNameViewController ()

@end

@implementation SearchByNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)act_search:(id)sender {
    if ([_txt_fname.text isEqual:@""] && [_txt_middlename.text isEqual:@""] && [_txt_lastname.text isEqual:@""]) {
        NSLog(@"Please Enter Something");
    }
    else
    {
        SearchByNameTableViewController *dfd = [self.storyboard instantiateViewControllerWithIdentifier:@"searchbynametab"];
        dfd.first_name = _txt_fname.text;
        dfd.middle_name = _txt_middlename.text;
        dfd.last_name = _txt_lastname.text;
    
        	[self.navigationController pushViewController:dfd animated:YES];
    }
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
- (IBAction)end_editing:(id)sender {
    [self.view endEditing:YES];
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}
@end
