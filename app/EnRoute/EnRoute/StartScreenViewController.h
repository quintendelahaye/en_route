//
//  StartScreenViewController.h
//  EnRoute
//
//  Created by Quinten Delahaye on 01/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StartScreenView.h"
#import "MenuView.h"
#import "MainViewController.h"
#import "TourViewController.h"

@interface StartScreenViewController : UIViewController

@property (strong,nonatomic)StartScreenView *view;
@property (strong,nonatomic)MenuView *menu;

@end
