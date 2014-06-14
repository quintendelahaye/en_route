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
        
        self.mapView.delegate = self;
        
        [self addSubview:self.mapView];
        
        
        
        
        
        
        
        
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
        
        
        
        
        /*NSArray *locations = [NSArray arrayWithObjects:[[CLLocation alloc] initWithLatitude:50.891 longitude:3.32],
                              [[CLLocation alloc] initWithLatitude:50.891 longitude:3.39],
                              [[CLLocation alloc] initWithLatitude:50.899 longitude:3.39],
                              [[CLLocation alloc] initWithLatitude:50.899 longitude:3.32],
                              [[CLLocation alloc] initWithLatitude:50.891 longitude:3.32],nil];
        
        self.annotion = [[RMAnnotation alloc] initWithMapView:self.mapView
                                                   coordinate:((CLLocation *)[locations objectAtIndex:0]).coordinate
                                                     andTitle:@"Home"];
        
        self.annotion.userInfo = locations;
        self.annotion.title = @"opdracht1";
        
        [self.annotion setBoundingBoxFromLocations:locations];
        
        [self.mapView addAnnotation:self.annotion];
        
        
        NSArray *locations2 = [NSArray arrayWithObjects:[[CLLocation alloc] initWithLatitude:50.881 longitude:3.32],
                              [[CLLocation alloc] initWithLatitude:50.881 longitude:3.39],
                              [[CLLocation alloc] initWithLatitude:50.889 longitude:3.39],
                              [[CLLocation alloc] initWithLatitude:50.889 longitude:3.32],
                              [[CLLocation alloc] initWithLatitude:50.881 longitude:3.32],nil];
        
        self.annotion2 = [[RMAnnotation alloc] initWithMapView:self.mapView
                                                   coordinate:((CLLocation *)[locations2 objectAtIndex:0]).coordinate
                                                     andTitle:@"Home"];
        
        self.annotion2.userInfo = locations2;
        self.annotion2.title = @"opdracht2";
        
        [self.annotion2 setBoundingBoxFromLocations:locations2];
        
        [self.mapView addAnnotation:self.annotion2];*/
        
        
        self.mapView.zoom = 14;
    }
    return self;
}

- (RMMapLayer *)mapView:(RMMapView *)mapView layerForAnnotation:(RMAnnotation *)annotation
{
    if (annotation.isUserLocationAnnotation)
        return nil;
    
    NSLog(@"LOUD NOISES");
    RMShape *shape = [[RMShape alloc]initWithView:self.mapView];
    //shape.fillColor= [UIColor colorWithRed:248/255.0f green:200/255.0f blue:200/255.0f alpha:0.8];
    shape.fillColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"patroon"]];
    shape.lineColor= [UIColor colorWithRed:248/255.0f green:247/255.0f blue:237/255.0f alpha:0];
    for (CLLocation *location in annotation.userInfo){
        [shape addLineToCoordinate:location.coordinate];
    }
    
    
    return shape;
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
