//
//  TourViewController.h
//  EnRoute
//
//  Created by Thomas Verleye on 6/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TourView.h"
#import "Mission1ViewController.h"
#import "TitleView.h"

@interface TourViewController : UIViewController <TourDelegate>

@property (nonatomic, strong) TourView *view;

@end
