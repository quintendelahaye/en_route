//
//  TutorialMission2ViewController.h
//  EnRoute
//
//  Created by Thomas Verleye on 12/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TutorialMission2View.h"
#import "TitleView.h"
#import "Mission2ViewController.h"
#import "Mission2Delegate.h"

@interface TutorialMission2ViewController : UIViewController <UIScrollViewDelegate,Mission2Delegate>

@property (nonatomic, strong) TutorialMission2View *view;
@property (nonatomic, strong) Mission2ViewController *mission2VC;
@property (nonatomic, weak) id<Mission2Delegate> delegate;

@end
