//
//  CCIRSHomeViewController.m
//  DrugFinder
//
//  Created by Satish on 3/27/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import "CCIRSHomeViewController.h"
#import "CCIRSSearchViewController.h"
#import "SWRevealViewController.h"
@interface CCIRSHomeViewController ()

@end

@implementation CCIRSHomeViewController

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
    [self.view endEditing:YES];
    CATransition* transition = [CATransition animation];
    transition.duration = 0.5;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFromTop;
    
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    CCIRSSearchViewController *next = [self.storyboard instantiateViewControllerWithIdentifier:@"ccirssearch"];
    [self.navigationController pushViewController:next animated:transition];
}
@end
