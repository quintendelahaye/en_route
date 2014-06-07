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
        
        self.mapView = [[RMMapView alloc]initWithFrame:frame andTilesource:source centerCoordinate:CLLocationCoordinate2DMake(50.895, 3.34) zoomLevel:18 maxZoomLevel:20 minZoomLevel:11 backgroundImage:nil];
        
        self.mapView.delegate = self;
        
        [self addSubview:self.mapView];
        
        
        
        NSArray *locations = [NSArray arrayWithObjects:[[CLLocation alloc] initWithLatitude:50.891 longitude:3.32],
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
        
        
        self.mapView.zoom = 12;
    }
    return self;
}

- (RMMapLayer *)mapView:(RMMapView *)mapView layerForAnnotation:(RMAnnotation *)annotation
{
    if (annotation.isUserLocationAnnotation)
        return nil;
    
    NSLog(@"LOUD NOISES");
    RMShape *shape = [[RMShape alloc]initWithView:self.mapView];
    shape.fillColor= [UIColor colorWithRed:248/255.0f green:200/255.0f blue:200/255.0f alpha:0.8];
    shape.lineColor= [UIColor colorWithRed:248/255.0f green:247/255.0f blue:237/255.0f alpha:0];
    for (CLLocation *location in annotation.userInfo)
        [shape addLineToCoordinate:location.coordinate];
    
    
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
