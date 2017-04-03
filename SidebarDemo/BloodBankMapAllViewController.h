//
//  BloodBankMapAllViewController.h
//  DrugFinder
//
//  Created by Satish on 4/1/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
@interface BloodBankMapAllViewController : UIViewController<CLLocationManagerDelegate>
{
    //CLLocationManager *locationManager;
}
@property(strong,nonatomic) CLLocationManager *locationManager;
@property(strong,nonatomic) CLLocation *loc1;


@end
