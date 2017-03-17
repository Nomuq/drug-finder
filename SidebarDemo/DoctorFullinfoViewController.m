//
//  DoctorFullinfoViewController.m
//  DrugFinder
//
//  Created by Satish on 3/14/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import "DoctorFullinfoViewController.h"

@interface DoctorFullinfoViewController ()

@end

@implementation DoctorFullinfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.pid.text = self.ProfileID;
    self.name.text = [NSString stringWithFormat:@"%@ %@",self.FirstName,self.LastName];
    self.ptype.text = self.Type;
    self.pspecility.text = self.Specility;
    self.aline1.text = self.AddLine1;
    self.aline2.text = self.AddLine2;
    self.addstate.text = self.State;
    self.addcity.text = self.City;
    self.addzipcode.text = self.Zipcode;
    self.addcounty.text = self.Country;
    
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

@end
