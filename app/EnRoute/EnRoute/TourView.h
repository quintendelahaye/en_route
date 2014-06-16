//
//  TourView.h
//  EnRoute
//
//  Created by Thomas Verleye on 6/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RMMapView.h>
#import <RMMapboxSource.h>
#import <RMMapLayer.h>
#import "Mapbox.h"
#import <RMShape.h>
#import <RMMarker.h>
#import <RMPointAnnotation.h>
#import "TourDelegate.h"
#import <CoreLocation/CoreLocation.h>

@interface TourView : UIView <RMMapViewDelegate,CLLocationManagerDelegate>

@property (nonatomic, strong) RMMapView *mapView;
@property (nonatomic, strong) RMAnnotation *annotion2;
@property (nonatomic, strong) RMAnnotation *annotion3;
@property (nonatomic, strong) RMAnnotation *annotion4;
@property (nonatomic, weak) id<TourDelegate> delegate;
@property (nonatomic, strong) CLLocationManager *locationManager;

- (void)removeAllPinsButUserLocation;

@end
