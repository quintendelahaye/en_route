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
#import "UnlockedView.h"
#import "TitleView.h"

@interface TourViewController : UIViewController <TourDelegate,Mission1Delegate>

@property (nonatomic, strong) TourView *view;
@property (nonatomic, strong) Mission1ViewController *mission1VC;

@property (nonatomic, strong) UnlockedView *unlockedView;

@end
