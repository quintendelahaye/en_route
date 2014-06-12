//
//  TutorialView.h
//  EnRoute
//
//  Created by Thomas Verleye on 11/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TutorialScreenView.h"
#import "UIColor+Extentions.h"
#import "PageControl.h"
#import <MediaPlayer/MediaPlayer.h>
#import "AVFoundation/AVFoundation.h"
#import "UIElementFactory.h"

@interface TutorialView : UIView <PageControlDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) TutorialScreenView *tutorialScreen1;
@property (nonatomic, strong) TutorialScreenView *tutorialScreen2;
@property (nonatomic, strong) TutorialScreenView *tutorialScreen3;
@property (nonatomic, strong) TutorialScreenView *tutorialScreen4;
@property (nonatomic, strong) PageControl *pageControl;
@property (nonatomic, strong) MPMoviePlayerController *videoController;
@property (nonatomic, strong) UIButton *btnstart;

-(void)createVideo:(int)page;

@end
