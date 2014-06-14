//
//  TourView.m
//  EnRoute
//
//  Created by Thomas Verleye on 6/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "TourView.h"

@implementation TourView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        RMMapboxSource *source = [[RMMapboxSource alloc]initWithMapID:@"thomasverleye.ie4bbml9"];
        
        self.mapView = [[RMMapView alloc]initWithFrame:frame andTilesource:source centerCoordinate:CLLocationCoordinate2DMake(51.2162362,4.4025798) zoomLevel:18 maxZoomLevel:20 minZoomLevel:11 backgroundImage:nil];
        self.mapView.showsUserLocation = YES;
        self.mapView.delegate = self;
        
        [self addSubview:self.mapView];
        
        
        
        
        //cllocation
        self.locationManager = [[CLLocationManager alloc]init];
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        self.locationManager.distanceFilter = 1;
        self.locationManager.activityType = CLActivityTypeOther;
        self.locationManager.delegate = self;
        
        [self.locationManager startUpdatingLocation];
        
        
        
        
        
        
        NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"markers" ofType:@"geojson"];
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[[NSData alloc] initWithContentsOfFile:jsonPath]
                                                             options:0
                                                               error:nil];
        
        for (int i = 0; i < 3; i++) {
            NSMutableArray *points = [[[[[json objectForKey:@"features"] objectAtIndex:i] valueForKeyPath:@"geometry.coordinates"] objectAtIndex:0] mutableCopy];
            NSLog(@"%@",points);
            
            for (NSUInteger i = 0; i < [points count]; i++)
                [points replaceObjectAtIndex:i
                                  withObject:[[CLLocation alloc] initWithLatitude:[[[points objectAtIndex:i] objectAtIndex:1] doubleValue]
                                                                        longitude:[[[points objectAtIndex:i] objectAtIndex:0] doubleValue]]];
            
            
            RMAnnotation *annotation = [[RMAnnotation alloc] initWithMapView:self.mapView
                                                                  coordinate:self.mapView.centerCoordinate
                                                                    andTitle:@"My Path"];
            annotation.title = [NSString stringWithFormat:@"opdracht%i",i+1];
            annotation.userInfo = points;
            [self.mapView addAnnotation:annotation];
            
            [annotation setBoundingBoxFromLocations:points];
        }
        
        
        //Add markers!
        RMAnnotation *annotation1 = [[RMAnnotation alloc] initWithMapView:self.mapView
                                                               coordinate:CLLocationCoordinate2DMake(51.2162362,4.4025798)
                                                                 andTitle:@"kavka"];
        [self.mapView addAnnotation:annotation1];
        
        
        RMAnnotation *annotation2 = [[RMAnnotation alloc] initWithMapView:self.mapView
                                                               coordinate:CLLocationCoordinate2DMake(51.2199838,4.4021755)
                                                                 andTitle:@"opdracht1_marker"];
        [self.mapView addAnnotation:annotation2];
        
        
        RMAnnotation *annotation3 = [[RMAnnotation alloc] initWithMapView:self.mapView
                                                               coordinate:CLLocationCoordinate2DMake(51.2161293,4.3980323)
                                                                 andTitle:@"opdracht2_marker"];
        [self.mapView addAnnotation:annotation3];
        
        
        RMAnnotation *annotation4 = [[RMAnnotation alloc] initWithMapView:self.mapView
                                                               coordinate:CLLocationCoordinate2DMake(51.2181592,4.4100586)
                                                                 andTitle:@"opdracht3_marker"];
        [self.mapView addAnnotation:annotation4];
        
        self.mapView.zoom = 14;
    }
    return self;
}

- (RMMapLayer *)mapView:(RMMapView *)mapView layerForAnnotation:(RMAnnotation *)annotation
{
    NSLog(@"LOUD NOISES");
    if ([annotation.title  isEqual: @"opdracht1"] || [annotation.title  isEqual: @"opdracht2"] || [annotation.title  isEqual: @"opdracht3"]) {
        RMShape *shape = [[RMShape alloc]initWithView:self.mapView];
        if ([annotation.title  isEqual: @"opdracht1"]) {
            //shape.fillColor= [UIColor colorWithRed:248/255.0f green:200/255.0f blue:200/255.0f alpha:0.8];
            shape.fillColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"patroon_unlocked"]];
            shape.lineColor= [UIColor colorWithRed:248/255.0f green:247/255.0f blue:237/255.0f alpha:0];
            for (CLLocation *location in annotation.userInfo){
                [shape addLineToCoordinate:location.coordinate];
            }
        }else{
            //shape.fillColor= [UIColor colorWithRed:248/255.0f green:200/255.0f blue:200/255.0f alpha:0.8];
            shape.fillColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"patroon"]];
            shape.lineColor= [UIColor colorWithRed:248/255.0f green:247/255.0f blue:237/255.0f alpha:0];
            for (CLLocation *location in annotation.userInfo){
                [shape addLineToCoordinate:location.coordinate];
            }
        }
        return shape;
    }else{
        RMMarker *marker;
        if (annotation.isUserLocationAnnotation){
            marker = [[RMMarker alloc] initWithUIImage:[UIImage imageNamed:@"userLocation"]];
        }
        if ([annotation.title  isEqual: @"kavka"]) {
            marker = [[RMMarker alloc] initWithUIImage:[UIImage imageNamed:@"kavka"]];
        }
        if ([annotation.title  isEqual: @"opdracht1_marker"]) {
            marker = [[RMMarker alloc] initWithUIImage:[UIImage imageNamed:@"marker_unlocked"]];
        }
        if ([annotation.title  isEqual: @"opdracht2_marker"]) {
            marker = [[RMMarker alloc] initWithUIImage:[UIImage imageNamed:@"marker_locked"]];
        }
        if ([annotation.title  isEqual: @"opdracht3_marker"]) {
            marker = [[RMMarker alloc] initWithUIImage:[UIImage imageNamed:@"marker_locked"]];
        }
        return marker;
    }
    
    
    
    return nil;
}

- (void)mapView:(RMMapView *)mapView didSelectAnnotation:(RMAnnotation *)annotation{
    NSLog(@"dklsmjqdlsmk");
    NSLog(@"%@",annotation.title);
    [self.delegate annotationSelected:annotation.title];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
