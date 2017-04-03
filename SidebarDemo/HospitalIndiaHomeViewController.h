//
//  BloodBankHomeViewController.h
//  DrugFinder
//
//  Created by Satish on 4/1/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
@interface HospitalIndiaHomeViewController : UIViewController <CLLocationManagerDelegate>
{
    //CLLocationManager *locationManager;
}
@property(strong,nonatomic) CLLocationManager *locationManager;
- (IBAction)act_map:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@end
