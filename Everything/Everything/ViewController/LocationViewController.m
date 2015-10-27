//
//  LocationViewController.m
//  Everything
//
//  Created by Kai Li on 10/26/15.
//  Copyright © 2015 Tau. All rights reserved.
//

#import "LocationViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface LocationViewController () <CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *longitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;

@property (nonatomic, assign, getter=isTracking) BOOL tracking;
@property (nonatomic, strong) CLLocationManager *locationManager;

@property (nonatomic, strong) CLGeocoder *geoCoder;

@end

@implementation LocationViewController

- (void)dealloc
{
    self.locationManager.delegate = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    // Add 'NSLocationWhenInUseUsageDescription' to Info.plist

    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;

    self.geoCoder = [[CLGeocoder alloc] init];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self updateLocation:nil];
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

- (void)updateLocation:(CLLocation *)location
{
    self.latitudeLabel.text = [NSString stringWithFormat:@"%.8f", location.coordinate.latitude];
    self.longitudeLabel.text = [NSString stringWithFormat:@"%.8f", location.coordinate.longitude];

    if (location) {
        [self.geoCoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
            if (error) {
                NSLog(@"error : %@", error.debugDescription);
            } else {
                CLPlacemark *placemark = [placemarks lastObject];

                self.addressLabel.text = [NSString stringWithFormat:@"%@\n%@ %@ %@ %@ %@", placemark.name, placemark.subThoroughfare?:@"", placemark.thoroughfare?:@"", placemark.locality?:@"", placemark.administrativeArea?:@"", placemark.country?:@""];
            }
        }];
    }
}

- (IBAction)trackButtonAction:(id)sender {
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    if (status == kCLAuthorizationStatusNotDetermined) {
        if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
            [self.locationManager requestWhenInUseAuthorization];
        }
    } else if (status == kCLAuthorizationStatusDenied) {
        NSLog(@"denied..");
    } else if (status == kCLAuthorizationStatusAuthorizedAlways || status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        if ([CLLocationManager locationServicesEnabled]) {
            NSLog(@"location service enabled.");
            if (self.isTracking) {
                [self.locationManager stopUpdatingLocation];
                [self updateLocation:nil];
            } else {
                [self.locationManager startUpdatingLocation];
                [self updateLocation:self.locationManager.location];
            }
            self.tracking = !self.isTracking;
            [(UIButton *)sender setTitle:self.isTracking ? @"Stop" : @"Track"
                                forState:UIControlStateNormal];
        } else {
            NSLog(@"location service not enabled.");
        }
    }
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError : %@", error);
    [self updateLocation:nil];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    NSLog(@"locations : %@", locations);
    [self updateLocation:[locations lastObject]];
}

@end
