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
#import "TimeChallenge1ViewController.h"
#import "TimeChallenge3ViewController.h"
#import "UIElementFactory.h"

@interface TourViewController : UIViewController <TourDelegate,Mission1Delegate,Mission2Delegate,Mission3delegate,ChallengeDelegate>

@property (nonatomic, strong) TourView *view;
@property (nonatomic, strong) Mission1ViewController *mission1VC;
@property (nonatomic, strong) TutorialMission2ViewController *tutorialMission2VC;
@property (nonatomic, strong) Mission3ExplanationViewController *mission3ExplanationVC;
@property (nonatomic, strong) TimeChallenge1ViewController *timeChallenge1VC;
@property (nonatomic, strong) TimeChallenge1ViewController *timeChallenge2VC;
@property (nonatomic, strong) TimeChallenge3ViewController *timeChallenge3VC;

@property (nonatomic, strong) UnlockedView *unlockedView;

@property (nonatomic, strong) UIImageView *bgTimer;
@property (nonatomic, strong) UILabel *lblTimer;
@property (nonatomic, assign) int secondsLeft;
@property (nonatomic, strong) NSTimer *timer;

@end
