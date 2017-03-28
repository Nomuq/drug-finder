//
//  MedDicHomeViewController.m
//  DrugFinder
//
//  Created by Satish on 3/28/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import "MedDicHomeViewController.h"
#import "SWRevealViewController.h"
#import "MedDicSearchViewController.h"
@interface MedDicHomeViewController ()

@end

@implementation MedDicHomeViewController

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
- (IBAction)act_search:(id)sender {
    [self.view endEditing:YES];
    CATransition* transition = [CATransition animation];
    transition.duration = 0.5;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFromTop;
    
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    MedDicHomeViewController *next = [self.storyboard instantiateViewControllerWithIdentifier:@"meddicsearch"];
    [self.navigationController pushViewController:next animated:transition];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
