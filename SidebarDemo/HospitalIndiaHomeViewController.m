//
//  BloodBankHomeViewController.m
//  DrugFinder
//
//  Created by Satish on 4/1/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import "HospitalIndiaHomeViewController.h"
#import "HospitalIndiaMapViewController.h"
#import "SWRevealViewController.h"
#import "DBManager.h"
#import <GoogleMaps/GoogleMaps.h>
@interface HospitalIndiaHomeViewController ()
@property (nonatomic, strong) DBManager *dbManager;

@property (nonatomic, strong) NSArray *arrqueryresult;
@end
CLLocation *currentLocation13;
NSString *administrativeArea13;
CLLocation *closestLocation13;
@implementation HospitalIndiaHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.locationManager = [[CLLocationManager alloc] init];
    [self.locationManager requestWhenInUseAuthorization];
    
    
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [self.locationManager startUpdatingLocation];

    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }

    // Do any additional setup after loading the view.
}
-(void)viewWillAppear
{
    
    [self.locationManager startUpdatingLocation];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    currentLocation13 = newLocation;
    
    if (currentLocation13 != nil) {
        //BloodBankMapViewController *dfd = [self.storyboard instantiateViewControllerWithIdentifier:@"bloodbankmap"];
        //dfd.Country = self.country;
        
        //NSLog(@"%@",[NSString stringWithFormat:@"%.8f", currentLocation13.coordinate.latitude]);
        //NSLog(@"%@",[NSString stringWithFormat:@"%.8f", currentLocation13.coordinate.longitude]);
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)act_map:(id)sender {

    HospitalIndiaMapViewController *dfd = [self.storyboard instantiateViewControllerWithIdentifier:@"HospitalIndiamap"];
    //dfd.Country = self.country;
    dfd.loc = currentLocation13;
    [self.navigationController pushViewController:dfd animated:YES];

}
@end
