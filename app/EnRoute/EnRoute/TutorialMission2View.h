//
//  TutorialMission2View.h
//  EnRoute
//
//  Created by Thomas Verleye on 12/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+Extentions.h"
#import "TutorialScreenView.h"
#import "PageControl.h"
#import "UIElementFactory.h"

@interface TutorialMission2View : UIView

@property (nonatomic, strong) TutorialScreenView *tutorialScreen1;
@property (nonatomic, strong) TutorialScreenView *tutorialScreen2;
@property (nonatomic, strong) TutorialScreenView *tutorialScreen3;
@property (nonatomic, strong) PageControl *pageControl;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIButton *btnstart;

@end
