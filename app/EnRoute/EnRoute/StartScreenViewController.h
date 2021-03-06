//
//  StartScreenViewController.h
//  EnRoute
//
//  Created by Quinten Delahaye on 01/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StartScreenView.h"
#import "MainViewController.h"
#import "TourViewController.h"
#import "MenuViewController.h"
#import "TutorialViewController.h"

@interface StartScreenViewController : UIViewController <TutorialDelegate>

@property (strong,nonatomic)StartScreenView *view;
@property (strong,nonatomic)MenuViewController *menuVC;

@end
