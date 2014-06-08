//
//  Mission1ViewController.h
//  EnRoute
//
//  Created by Thomas Verleye on 7/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Mission1IntroductionView.h"
#import "Mission1ResultView.h"
#import "TitleView.h"
#import "Mission1CameraView.h"

@interface Mission1ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) Mission1IntroductionView *view;
@property (nonatomic, strong) Mission1ResultView *resultView;
@property (nonatomic, strong) UIImagePickerController *picker;
@property (nonatomic, strong) Mission1CameraView *cameraOverlay;
@property (nonatomic, strong) UIImage *bg;
@property (nonatomic, strong) UIImage *frame;
@property (nonatomic, strong) UIImage *canvas;
@property (nonatomic, strong) UIImage *collage;

@property (nonatomic, assign) int part;

@end
