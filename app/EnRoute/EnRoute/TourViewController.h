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
#import "TutorialMission2ViewController.h"
#import "Mission3ExplanationViewController.h"

@interface TourViewController : UIViewController <TourDelegate,Mission1Delegate,Mission2Delegate>

@property (nonatomic, strong) TourView *view;
@property (nonatomic, strong) Mission1ViewController *mission1VC;
@property (nonatomic, strong) TutorialMission2ViewController *tutorialMission2VC;
@property (nonatomic, strong) Mission3ExplanationViewController *mission3ExplanationVC;

@property (nonatomic, strong) UnlockedView *unlockedView;

@end
