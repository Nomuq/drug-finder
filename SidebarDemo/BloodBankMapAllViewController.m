//
//  BloodBankMapAllViewController.m
//  DrugFinder
//
//  Created by Satish on 4/1/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import "BloodBankMapAllViewController.h"
#import <GoogleMaps/GoogleMaps.h>
#import "DBManager.h"
@interface BloodBankMapAllViewController ()
@property (nonatomic, strong) DBManager *dbManager;

@property (nonatomic, strong) NSArray *arrqueryresult;
@end


CLLocation *currentLocation12;
@implementation BloodBankMapAllViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.locationManager = [[CLLocationManager alloc] init];
    [self.locationManager requestWhenInUseAuthorization];
    
    self.title = @"All BloodBanks";
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [self.locationManager startUpdatingLocation];
    
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"bloodbank.db"];
    
    if (self.loc1 != nil) {
        currentLocation12 = self.loc1;
        //closestLocation = self.locclosest;
    }
    CLLocation *currentLocation4 = [[CLLocation alloc]initWithLatitude:currentLocation12.coordinate.latitude longitude:currentLocation12.coordinate.longitude];
    
    // coordinate -33.86,151.20 at zoom level 6.
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:currentLocation12.coordinate.latitude
                                                            longitude:currentLocation12.coordinate.longitude
                                                                 zoom:10];
    GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView.myLocationEnabled = YES;
    self.view = mapView;
    // Creates a marker in the center of the map.
    // Creates a marker in the center of the map.
    GMSMarker *marker2 = [[GMSMarker alloc] init];
    marker2.position = CLLocationCoordinate2DMake(currentLocation12.coordinate.latitude, currentLocation12.coordinate.longitude);
    marker2.title = @"Current Location";
    //marker.snippet = @"Australia";
    marker2.map = mapView;
    
    
    NSLog(@"%@", currentLocation4);
 
        NSString *query =[NSString stringWithFormat:@"select * from bylocation"];
        NSArray *arrayWithDuplicates = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query]];
        NSOrderedSet *orderedSet = [NSOrderedSet orderedSetWithArray:arrayWithDuplicates];
        self.arrqueryresult = [orderedSet array];
        NSMutableArray *mut = [[NSMutableArray alloc]init];
        for (int i=0; i<self.arrqueryresult.count; i++) {
            NSInteger indexOflatitude = [self.dbManager.arrColumnNames indexOfObject:@"latitude"];
            NSInteger indexOflongitude = [self.dbManager.arrColumnNames indexOfObject:@"longitude"];
            
            NSString *latitu = [NSString stringWithFormat:@"%@", [[self.arrqueryresult objectAtIndex:i] objectAtIndex:indexOflatitude]];
            
            NSString *longti = [NSString stringWithFormat:@"%@", [[self.arrqueryresult objectAtIndex:i] objectAtIndex:indexOflongitude]];
            double latitu2 = [latitu doubleValue];
            double longti2 = [longti doubleValue];
            //NSLog(@"%f", latitu2);
            CLLocation *currentLocation12 = [[CLLocation alloc]initWithLatitude:latitu2 longitude:longti2];
            [mut addObject:currentLocation12];
            
            GMSMarker *marker = [[GMSMarker alloc] init];
            marker.position = CLLocationCoordinate2DMake(latitu2, longti2);
            
            NSInteger indexOfbbtitle = [self.dbManager.arrColumnNames indexOfObject:@"h_name"];
            NSInteger indexOfbbaddress = [self.dbManager.arrColumnNames indexOfObject:@"address"];
            NSInteger indexOfbbpincode = [self.dbManager.arrColumnNames indexOfObject:@"pincode"];
            NSInteger indexOfbbcontact = [self.dbManager.arrColumnNames indexOfObject:@"contact"];
           NSString* titleofbb3 = [NSString stringWithFormat:@"%@",[[self.arrqueryresult objectAtIndex:0] objectAtIndex:indexOfbbtitle]];
            
           NSString *addressofbb3 = [NSString stringWithFormat:@"%@\n%@\nContact : %@",[[self.arrqueryresult objectAtIndex:0] objectAtIndex:indexOfbbaddress],[[self.arrqueryresult objectAtIndex:i] objectAtIndex:indexOfbbpincode],[[self.arrqueryresult objectAtIndex:0] objectAtIndex:indexOfbbcontact]];
            
            marker.title = titleofbb3;
            marker.snippet = addressofbb3;
            marker.map = mapView;
            
        }
        
        //current device Location

    
}
//-(void)viewWillAppear
//{
//    CLLocation *currentLocation4 = [[CLLocation alloc]initWithLatitude:currentLocation12.coordinate.latitude longitude:currentLocation12.coordinate.longitude];
//
//
//    NSLog(@"%@", currentLocation4);
//    [[GMSGeocoder geocoder] reverseGeocodeCoordinate:CLLocationCoordinate2DMake(currentLocation4.coordinate.latitude, currentLocation4.coordinate.longitude) completionHandler:^(GMSReverseGeocodeResponse* response, NSError* error) {
//        //NSLog(@"reverse geocoding results:");
//        for(GMSAddress* addressObj in [response results])
//        {
//            NSLog(@"%@", addressObj.administrativeArea);
//            if (addressObj.administrativeArea != nil) {
//                administrativeArea = addressObj.administrativeArea;
//            }
//
//        }
//        //NSLog(@"%@", administrativeArea);
//        NSString *query =[NSString stringWithFormat:@"select * from bylocation where state='%@'",administrativeArea] ;
//        NSArray *arrayWithDuplicates = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query]];
//        NSOrderedSet *orderedSet = [NSOrderedSet orderedSetWithArray:arrayWithDuplicates];
//        self.arrqueryresult = [orderedSet array];
//        NSMutableArray *mut = [[NSMutableArray alloc]init];
//        for (int i=0; i<self.arrqueryresult.count; i++) {
//            NSInteger indexOflatitude = [self.dbManager.arrColumnNames indexOfObject:@"latitude"];
//            NSInteger indexOflongitude = [self.dbManager.arrColumnNames indexOfObject:@"longitude"];
//
//            NSString *latitu = [NSString stringWithFormat:@"%@", [[self.arrqueryresult objectAtIndex:i] objectAtIndex:indexOflatitude]];
//
//            NSString *longti = [NSString stringWithFormat:@"%@", [[self.arrqueryresult objectAtIndex:i] objectAtIndex:indexOflongitude]];
//            double latitu2 = [latitu doubleValue];
//            double longti2 = [longti doubleValue];
//            //NSLog(@"%f", latitu2);
//            CLLocation *currentLocation12 = [[CLLocation alloc]initWithLatitude:latitu2 longitude:longti2];
//            [mut addObject:currentLocation12];
//        }
//
//        //current device Location
//
//        CLLocationDistance smallestDistance = DBL_MAX;
//
//        for (CLLocation *location in mut) {
//            CLLocationDistance distance = [currentLocation4 distanceFromLocation:location];
//
//            if (distance < smallestDistance) {
//                smallestDistance = distance;
//                closestLocation = location;
//
//            }
//        }
//        NSLog(@"%@", closestLocation);
//
//        NSString *bblatitude =[NSString stringWithFormat:@"%f",closestLocation.coordinate.latitude];
//        NSString *query2 =[NSString stringWithFormat:@"select * from bylocation where latitude='%@'",bblatitude] ;
//        NSArray *arrayWithDuplicates2 = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query2]];
//        NSOrderedSet *orderedSet2 = [NSOrderedSet orderedSetWithArray:arrayWithDuplicates2];
//        self.arrqueryresult = [orderedSet2 array];
//
//        NSLog(@"%@", self.arrqueryresult);
//
//
//
//
//        if(closestLocation == nil)
//        {
//            NSLog(@"Null Bro");
//        }
//        else
//        {
//            NSInteger indexOfbbtitle = [self.dbManager.arrColumnNames indexOfObject:@"h_name"];
//            NSInteger indexOfbbaddress = [self.dbManager.arrColumnNames indexOfObject:@"address"];
//            NSInteger indexOfbbpincode = [self.dbManager.arrColumnNames indexOfObject:@"pincode"];
//            NSInteger indexOfbbcontact = [self.dbManager.arrColumnNames indexOfObject:@"contact"];
//            titleofbb = [NSString stringWithFormat:@"%@",[[self.arrqueryresult objectAtIndex:0] objectAtIndex:indexOfbbtitle]];
//
//            addressofbb = [NSString stringWithFormat:@"%@\n%@\nContact : %@",[[self.arrqueryresult objectAtIndex:0] objectAtIndex:indexOfbbaddress],[[self.arrqueryresult objectAtIndex:0] objectAtIndex:indexOfbbpincode],[[self.arrqueryresult objectAtIndex:0] objectAtIndex:indexOfbbcontact]];
//        }
//
//
//
//
//        // Do any additional setup after loading the view.
//        // Create a GMSCameraPosition that tells the map to display the
//        // coordinate -33.86,151.20 at zoom level 6.
//        GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:currentLocation12.coordinate.latitude
//                                                                longitude:currentLocation12.coordinate.longitude
//                                                                     zoom:15];
//        GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
//        mapView.myLocationEnabled = YES;
//        self.view = mapView;
//
//        // Creates a marker in the center of the map.
//        GMSMarker *marker = [[GMSMarker alloc] init];
//        marker.position = CLLocationCoordinate2DMake(closestLocation.coordinate.latitude, closestLocation.coordinate.longitude);
//
//
//        marker.title = titleofbb;
//        marker.snippet = addressofbb;
//        marker.map = mapView;
//
//        // Creates a marker in the center of the map.
//        GMSMarker *marker2 = [[GMSMarker alloc] init];
//        marker2.position = CLLocationCoordinate2DMake(currentLocation12.coordinate.latitude, currentLocation12.coordinate.longitude);
//        marker2.title = @"Current Location";
//        //marker.snippet = @"Australia";
//        marker2.map = mapView;
//
//
//
//    }];
//
//
//}
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
    currentLocation12 = newLocation;
    
    if (currentLocation12 != nil) {
        //NSLog(@"%@",[NSString stringWithFormat:@"%.8f", currentLocation12.coordinate.latitude]);
        //NSLog(@"%@",[NSString stringWithFormat:@"%.8f", currentLocation12.coordinate.longitude]);
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

@end
