//
//  MainViewController.m
//  SidebarDemo
//
//  Created by Simon Ng on 10/11/14.
//  Copyright (c) 2014 AppCoda. All rights reserved.
//

#import "MainViewController.h"
#import "SWRevealViewController.h"
#import "DrugInfoViewController.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Home";
    [self.DrugInfo.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [self.DoctorList.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [self.Interaction.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [self.HealthTopics.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [self.Finder.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [self.LactMed.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [self.CCRIS.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [self.HSDB.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [self.ChemID.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [self.AIDSMeds.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [self.Dict.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [self.About.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
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

- (IBAction)DrugInfo:(id)sender {
    //comments
    DrugInfoViewController *update = [self.storyboard instantiateViewControllerWithIdentifier:@"comments"];

    
    [self.navigationController pushViewController:update animated:YES];
}
@end
