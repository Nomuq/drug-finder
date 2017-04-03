//
//  BloodBankMapViewController.h
//  DrugFinder
//
//  Created by Satish on 3/30/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
@interface BloodBankMapViewController : UIViewController  <CLLocationManagerDelegate>
{
    //CLLocationManager *locationManager;
}
@property(strong,nonatomic) CLLocationManager *locationManager;
@property(strong,nonatomic) CLLocation *loc;
@property(strong,nonatomic) CLLocation *locclosest;
- (IBAction)act_map:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *uiview_mapall;

@property (weak, nonatomic) IBOutlet UIButton *act_direction;
- (IBAction)act_dir:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *uiview_dir;

@end
