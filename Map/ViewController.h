//
//  ViewController.h
//  Map
//
//  Created by Bryan A Bolivar M on 4/23/15.
//  Copyright (c) 2015 Bolivar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController<MKMapViewDelegate,CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapa;
@end

