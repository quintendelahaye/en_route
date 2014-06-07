//
//  TourDelegate.h
//  EnRoute
//
//  Created by Thomas Verleye on 7/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TourDelegate <NSObject>

@required
-(void) annotationSelected:(NSString *)title;

@end
