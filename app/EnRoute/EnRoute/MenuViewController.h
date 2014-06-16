//
//  MenuViewController.h
//  EnRoute
//
//  Created by Thomas Verleye on 10/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuView.h"
#import "TitleView.h"
#import "TutorialViewController.h"
#import "LegendeViewController.h"

@interface MenuViewController : UIViewController <TutorialDelegate>

@property (strong,nonatomic)MenuView *view;

@property (nonatomic, assign) BOOL zichtbaar;

- (void)hideView;
- (void)showView;

@end
