//
//  TimeChallenge1ViewController.h
//  EnRoute
//
//  Created by Thomas Verleye on 15/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimeChallengeExplanationView.h"
#import "TimeChallengeResultView.h"
#import "TitleView.h"
#import "Mission1CameraView.h"

@interface TimeChallenge1ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) TimeChallengeExplanationView *view;
@property (nonatomic, strong) TimeChallengeResultView *resultView;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) int secondsLeft;

@property (nonatomic, strong) UIImagePickerController *picker;
@property (nonatomic, strong) Mission1CameraView *cameraOverlay;

@property (nonatomic, assign) BOOL resultVisible;
@property (nonatomic, assign) int part;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andPart:(int)part;

@end
