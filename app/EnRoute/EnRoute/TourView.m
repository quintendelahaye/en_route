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
        
        
        self.annotion2 = [[RMAnnotation alloc] initWithMapView:self.mapView
                                                               coordinate:CLLocationCoordinate2DMake(51.2199838,4.4021755)
                                                                 andTitle:@"opdracht1_marker"];
        [self.mapView addAnnotation:self.annotion2];
        
        
        self.annotion3 = [[RMAnnotation alloc] initWithMapView:self.mapView
                                                               coordinate:CLLocationCoordinate2DMake(51.2161293,4.3980323)
                                                                 andTitle:@"opdracht2_marker"];
        [self.mapView addAnnotation:self.annotion3];
        
        
        self.annotion4 = [[RMAnnotation alloc] initWithMapView:self.mapView
                                                               coordinate:CLLocationCoordinate2DMake(51.2181592,4.4100586)
                                                                 andTitle:@"opdracht3_marker"];
        [self.mapView addAnnotation:self.annotion4];
        
        self.mapView.zoom = 15;
    }
    return self;
}

- (RMMapLayer *)mapView:(RMMapView *)mapView layerForAnnotation:(RMAnnotation *)annotation
{
    NSLog(@"LOUD NOISES");
    if ([annotation.title  isEqual: @"opdracht1"] || [annotation.title  isEqual: @"opdracht2"] || [annotation.title  isEqual: @"opdracht3"]) {
        RMShape *shape = [[RMShape alloc]initWithView:self.mapView];
        if ([annotation.title  isEqual: [NSString stringWithFormat:@"opdracht%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"upcomingMission"]]]) {
            //shape.fillColor= [UIColor colorWithRed:248/255.0f green:200/255.0f blue:200/255.0f alpha:0.8];
            shape.fillColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"patroon_unlocked"]];
            shape.lineColor= [UIColor colorWithRed:248/255.0f green:247/255.0f blue:237/255.0f alpha:0];
            for (CLLocation *location in annotation.userInfo){
                [shape addLineToCoordinate:location.coordinate];
            }
        }else{
            BOOL found = NO;
            NSMutableArray *completedMissions = [NSMutableArray array];
            completedMissions = [[[NSUserDefaults standardUserDefaults]objectForKey:@"completedMissions"]mutableCopy];
            for (NSString *mission in completedMissions) {
                if ([annotation.title  isEqual: [NSString stringWithFormat:@"opdracht%@",mission]]) {
                    shape.fillColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"patroon_unlocked"]];
                    shape.lineColor= [UIColor colorWithRed:248/255.0f green:247/255.0f blue:237/255.0f alpha:0];
                    found = YES;
                    for (CLLocation *location in annotation.userInfo){
                        [shape addLineToCoordinate:location.coordinate];
                    }
                }
            }
            if (!found) {
                //shape.fillColor= [UIColor colorWithRed:248/255.0f green:200/255.0f blue:200/255.0f alpha:0.8];
                shape.fillColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"patroon"]];
                shape.lineColor= [UIColor colorWithRed:248/255.0f green:247/255.0f blue:237/255.0f alpha:0];
                for (CLLocation *location in annotation.userInfo){
                    [shape addLineToCoordinate:location.coordinate];
            }
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
        if ([annotation.title  isEqual: @"opdracht1_marker"] || [annotation.title  isEqual: @"opdracht2_marker"] || [annotation.title  isEqual: @"opdracht3_marker"]){
            if ([annotation.title  isEqual: [NSString stringWithFormat:@"opdracht%@_marker",[[NSUserDefaults standardUserDefaults]objectForKey:@"upcomingMission"]]]) {
                marker = [[RMMarker alloc] initWithUIImage:[UIImage imageNamed:@"marker_unlocked"]];
            } else {
                BOOL found = NO;
                NSMutableArray *completedMissions = [NSMutableArray array];
                completedMissions = [[[NSUserDefaults standardUserDefaults]objectForKey:@"completedMissions"]mutableCopy];
                for (NSString *mission in completedMissions) {
                    if ([annotation.title  isEqual: [NSString stringWithFormat:@"opdracht%@_marker",mission]]) {
                        marker = [[RMMarker alloc] initWithUIImage:[UIImage imageNamed:@"done_marker"]];
                        found = YES;
                    }
                }
                if (!found) {
                    marker = [[RMMarker alloc] initWithUIImage:[UIImage imageNamed:@"marker_locked"]];
                }
            }
        }
        return marker;
    }
    
    
    
    return nil;
}

- (void)mapView:(RMMapView *)mapView didSelectAnnotation:(RMAnnotation *)annotation{
    if ([annotation.title  isEqual: [NSString stringWithFormat:@"opdracht%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"upcomingMission"]]] || [annotation.title  isEqual: [NSString stringWithFormat:@"opdracht%@_marker",[[NSUserDefaults standardUserDefaults]objectForKey:@"upcomingMission"]]]) {
        [self.delegate annotationSelected:[NSString stringWithFormat:@"opdracht%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"upcomingMission"]]];
    }
}

- (void)removeAllPinsButUserLocation
{
    NSLog(@"removing");
    id userLocation = [self.mapView userLocation];
    NSMutableArray *pins = [[NSMutableArray alloc] initWithArray:[self.mapView annotations]];
    if ( userLocation != nil ) {
        [pins removeObject:userLocation]; // avoid removing user location off the map
    }
    
    [self.mapView removeAnnotations:pins];
    [self.mapView addAnnotations:pins];
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
