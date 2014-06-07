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
#import <RMShape.h>
#import <RMPointAnnotation.h>
#import "TourDelegate.h"

@interface TourView : UIView <RMMapViewDelegate>

@property (nonatomic, strong) RMMapView *mapView;
@property (nonatomic, strong) RMAnnotation *annotion;
@property (nonatomic, weak) id<TourDelegate> delegate;

@end
