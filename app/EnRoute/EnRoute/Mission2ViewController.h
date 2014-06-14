//
//  Mission2ViewController.h
//  EnRoute
//
//  Created by Thomas Verleye on 12/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Mission2View.h"
#import "TitleView.h"
#import "PhotoViewController.h"
#import "RecordView.h"
#import "UIElementFactory.h"
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioServices.h>
#import "Mission2Delegate.h"

@interface Mission2ViewController : UIViewController<PhotoViewDelegate>

@property (nonatomic, strong) Mission2View *view;
@property (nonatomic, strong) PhotoViewController *photoVC;
@property (nonatomic, strong) RecordView *recordView;

@property (nonatomic, strong) AVAudioRecorder *audioRecorder;
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;

@property (nonatomic, assign) BOOL recording;
@property (nonatomic, strong) NSMutableDictionary *records;

@property (nonatomic, assign) BOOL photoIsCaptured;
@property (nonatomic, weak) id<Mission2Delegate> delegate;

@property (nonatomic, assign) BOOL klaarPressed;

@end
