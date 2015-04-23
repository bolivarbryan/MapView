//
//  ViewController.m
//  Map
//
//  Created by Bryan A Bolivar M on 4/23/15.
//  Copyright (c) 2015 Bolivar. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

@interface ViewController (){
    CLLocationManager *locationManager;

}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mapa.showsUserLocation = YES;
    self.mapa.mapType = MKMapTypeHybrid;
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    if(IS_OS_8_OR_LATER) {
        [locationManager requestAlwaysAuthorization];
    }
    
    [locationManager startUpdatingLocation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)mapView:(MKMapView *)aMapView didUpdateUserLocation:(MKUserLocation *)aUserLocation {
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    span.latitudeDelta = 0.005;
    span.longitudeDelta = 0.005;
    CLLocationCoordinate2D location;
    location.latitude = aUserLocation.coordinate.latitude;
    location.longitude = aUserLocation.coordinate.longitude;
    region.span = span;
    region.center = location;
    [aMapView setRegion:region animated:YES];
}
@end
