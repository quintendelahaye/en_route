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

@interface TutorialMission2ViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic, strong) TutorialMission2View *view;
@property (nonatomic, strong) Mission2ViewController *mission2VC;

@end
