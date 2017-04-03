//
//  BloodBankMapViewController.m
//  DrugFinder
//
//  Created by Satish on 3/30/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import "HospitalIndiaMapViewController.h"
#import "HospitalIndiaMapAllViewController.h"
#import <GoogleMaps/GoogleMaps.h>
#import "DBManager.h"
@interface HospitalIndiaMapViewController ()
@property (nonatomic, strong) DBManager *dbManager;

@property (nonatomic, strong) NSArray *arrqueryresult;
@end

NSString *administrativeAreahi;
NSString *titleofhi;
NSString *addressofhi;
CLLocation *currentLocationhi;
CLLocation *closestLocationhi;

@implementation HospitalIndiaMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.locationManager = [[CLLocationManager alloc] init];
    [self.locationManager requestWhenInUseAuthorization];
    
    self.title = @"Nearby";
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [self.locationManager startUpdatingLocation];
    
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"Hospitalindloc.db"];
    
    if (self.loc != nil) {
        currentLocationhi = self.loc;
        //closestLocationhi = self.locclosest;
    }
    CLLocation *currentLocation4 = [[CLLocation alloc]initWithLatitude:currentLocationhi.coordinate.latitude longitude:currentLocationhi.coordinate.longitude];

    
    NSLog(@"%@", currentLocation4);
    [[GMSGeocoder geocoder] reverseGeocodeCoordinate:CLLocationCoordinate2DMake(currentLocation4.coordinate.latitude, currentLocation4.coordinate.longitude) completionHandler:^(GMSReverseGeocodeResponse* response, NSError* error) {
        //NSLog(@"reverse geocoding results:");
        for(GMSAddress* addressObj in [response results])
        {
            NSLog(@"%@", addressObj.administrativeArea);
            if (addressObj.administrativeArea != nil) {
                administrativeAreahi = addressObj.administrativeArea;
            }
            
        }
        NSLog(@"%@", administrativeAreahi);
        NSString *query =[NSString stringWithFormat:@"select * from hospital where State='%@'",administrativeAreahi] ;
        NSArray *arrayWithDuplicates = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query]];
        NSOrderedSet *orderedSet = [NSOrderedSet orderedSetWithArray:arrayWithDuplicates];
        self.arrqueryresult = [orderedSet array];
        //NSLog(@"%@", self.arrqueryresult);
        NSMutableArray *mut = [[NSMutableArray alloc]init];
        for (int i=0; i<self.arrqueryresult.count; i++) {
            NSInteger indexOflatitude = [self.dbManager.arrColumnNames indexOfObject:@"lat"];
            NSInteger indexOflongitude = [self.dbManager.arrColumnNames indexOfObject:@"lon"];
            
            NSString *latitu = [NSString stringWithFormat:@"%@", [[self.arrqueryresult objectAtIndex:i] objectAtIndex:indexOflatitude]];
            
            NSString *longti = [NSString stringWithFormat:@"%@", [[self.arrqueryresult objectAtIndex:i] objectAtIndex:indexOflongitude]];
            double latitu2 = [latitu doubleValue];
            double longti2 = [longti doubleValue];
            //NSLog(@"%f", latitu2);
            CLLocation *currentLocation1 = [[CLLocation alloc]initWithLatitude:latitu2 longitude:longti2];
            [mut addObject:currentLocation1];
        }
        
        //current device Location
        
        CLLocationDistance smallestDistance = DBL_MAX;
        
        for (CLLocation *location in mut) {
            CLLocationDistance distance = [currentLocation4 distanceFromLocation:location];
            
            if (distance < smallestDistance) {
                smallestDistance = distance;
                closestLocationhi = location;
                
            }
        }
        NSLog(@"%@", closestLocationhi);
    
        NSString *bblatitude =[NSString stringWithFormat:@"%f",closestLocationhi.coordinate.latitude];
        NSString *query2 =[NSString stringWithFormat:@"select * from hospital where lat='%@'",bblatitude] ;
        NSArray *arrayWithDuplicates2 = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query2]];
        NSOrderedSet *orderedSet2 = [NSOrderedSet orderedSetWithArray:arrayWithDuplicates2];
        self.arrqueryresult = [orderedSet2 array];
        
        //NSLog(@"%@", self.arrqueryresult);
        
        

        
        if(closestLocationhi == nil)
        {
            NSLog(@"Null Bro");
        }
        else
        {
        NSInteger indexOfbbtitle = [self.dbManager.arrColumnNames indexOfObject:@"Hospital_Name"];
        NSInteger indexOfbbaddress = [self.dbManager.arrColumnNames indexOfObject:@"Location"];
        NSInteger indexOfbbpincode = [self.dbManager.arrColumnNames indexOfObject:@"State"];
       
        titleofhi = [NSString stringWithFormat:@"%@",[[self.arrqueryresult objectAtIndex:0] objectAtIndex:indexOfbbtitle]];
        
        addressofhi = [NSString stringWithFormat:@"%@\n%@",[[self.arrqueryresult objectAtIndex:0] objectAtIndex:indexOfbbaddress],[[self.arrqueryresult objectAtIndex:0] objectAtIndex:indexOfbbpincode]];
        }

    // coordinate -33.86,151.20 at zoom level 6.
        GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:currentLocationhi.coordinate.latitude
                                                                longitude:currentLocationhi.coordinate.longitude
                                                                     zoom:15];
        GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
        mapView.myLocationEnabled = YES;
        self.view = mapView;
       // Creates a marker in the center of the map.
        GMSMarker *marker = [[GMSMarker alloc] init];
        marker.position = CLLocationCoordinate2DMake(closestLocationhi.coordinate.latitude, closestLocationhi.coordinate.longitude);
        
        
        marker.title = titleofhi;
        marker.snippet = addressofhi;
        marker.map = mapView;
        // Creates a marker in the center of the map.
        GMSMarker *marker2 = [[GMSMarker alloc] init];
        marker2.position = CLLocationCoordinate2DMake(currentLocationhi.coordinate.latitude, currentLocationhi.coordinate.longitude);
        marker2.title = @"Current Location";
        //marker.snippet = @"Australia";
        marker2.map = mapView;
        
        [mapView addSubview:self.uiview_mapall];
         [mapView addSubview:self.uiview_dir];
    }];

    
  
    
}
//-(void)viewWillAppear
//{
//    CLLocation *currentLocation4 = [[CLLocation alloc]initWithLatitude:currentLocationhi.coordinate.latitude longitude:currentLocationhi.coordinate.longitude];
//    
//    
//    NSLog(@"%@", currentLocation4);
//    [[GMSGeocoder geocoder] reverseGeocodeCoordinate:CLLocationCoordinate2DMake(currentLocation4.coordinate.latitude, currentLocation4.coordinate.longitude) completionHandler:^(GMSReverseGeocodeResponse* response, NSError* error) {
//        //NSLog(@"reverse geocoding results:");
//        for(GMSAddress* addressObj in [response results])
//        {
//            NSLog(@"%@", addressObj.administrativeAreahi);
//            if (addressObj.administrativeAreahi != nil) {
//                administrativeAreahi = addressObj.administrativeAreahi;
//            }
//            
//        }
//        //NSLog(@"%@", administrativeAreahi);
//        NSString *query =[NSString stringWithFormat:@"select * from bylocation where state='%@'",administrativeAreahi] ;
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
//            CLLocation *currentLocation1 = [[CLLocation alloc]initWithLatitude:latitu2 longitude:longti2];
//            [mut addObject:currentLocation1];
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
//                closestLocationhi = location;
//                
//            }
//        }
//        NSLog(@"%@", closestLocationhi);
//        
//        NSString *bblatitude =[NSString stringWithFormat:@"%f",closestLocationhi.coordinate.latitude];
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
//        if(closestLocationhi == nil)
//        {
//            NSLog(@"Null Bro");
//        }
//        else
//        {
//            NSInteger indexOfbbtitle = [self.dbManager.arrColumnNames indexOfObject:@"h_name"];
//            NSInteger indexOfbbaddress = [self.dbManager.arrColumnNames indexOfObject:@"address"];
//            NSInteger indexOfbbpincode = [self.dbManager.arrColumnNames indexOfObject:@"pincode"];
//            NSInteger indexOfbbcontact = [self.dbManager.arrColumnNames indexOfObject:@"contact"];
//            titleofhi = [NSString stringWithFormat:@"%@",[[self.arrqueryresult objectAtIndex:0] objectAtIndex:indexOfbbtitle]];
//            
//            addressofhi = [NSString stringWithFormat:@"%@\n%@\nContact : %@",[[self.arrqueryresult objectAtIndex:0] objectAtIndex:indexOfbbaddress],[[self.arrqueryresult objectAtIndex:0] objectAtIndex:indexOfbbpincode],[[self.arrqueryresult objectAtIndex:0] objectAtIndex:indexOfbbcontact]];
//        }
//        
//        
//        
//        
//        // Do any additional setup after loading the view.
//        // Create a GMSCameraPosition that tells the map to display the
//        // coordinate -33.86,151.20 at zoom level 6.
//        GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:currentLocationhi.coordinate.latitude
//                                                                longitude:currentLocationhi.coordinate.longitude
//                                                                     zoom:15];
//        GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
//        mapView.myLocationEnabled = YES;
//        self.view = mapView;
//        
//        // Creates a marker in the center of the map.
//        GMSMarker *marker = [[GMSMarker alloc] init];
//        marker.position = CLLocationCoordinate2DMake(closestLocationhi.coordinate.latitude, closestLocationhi.coordinate.longitude);
//        
//        
//        marker.title = titleofhi;
//        marker.snippet = addressofhi;
//        marker.map = mapView;
//        
//        // Creates a marker in the center of the map.
//        GMSMarker *marker2 = [[GMSMarker alloc] init];
//        marker2.position = CLLocationCoordinate2DMake(currentLocationhi.coordinate.latitude, currentLocationhi.coordinate.longitude);
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
    currentLocationhi = newLocation;
    
    if (currentLocationhi != nil) {
        //NSLog(@"%@",[NSString stringWithFormat:@"%.8f", currentLocationhi.coordinate.latitude]);
        //NSLog(@"%@",[NSString stringWithFormat:@"%.8f", currentLocationhi.coordinate.longitude]);
    }
}


- (IBAction)act_map:(id)sender {
    
    HospitalIndiaMapAllViewController *dfd = [self.storyboard instantiateViewControllerWithIdentifier:@"HospitalIndiamapall"];
    //dfd.Country = self.country;
    dfd.loc1 = currentLocationhi;
    [self.navigationController pushViewController:dfd animated:YES];
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)act_dir:(id)sender {
    
   
        CLLocationCoordinate2D start = { currentLocationhi.coordinate.latitude, currentLocationhi.coordinate.longitude };
        CLLocationCoordinate2D end = { closestLocationhi.coordinate.latitude, closestLocationhi.coordinate.longitude };
        
        NSString *googleMapsURLString = [NSString stringWithFormat:@"http://maps.google.com/?saddr=%f,%f&daddr=%f,%f", start.latitude, start.longitude, end.latitude, end.longitude];
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:googleMapsURLString]];
        
    
}
@end
