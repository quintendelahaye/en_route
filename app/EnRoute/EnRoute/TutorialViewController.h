//
//  TutorialViewController.h
//  EnRoute
//
//  Created by Thomas Verleye on 11/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TutorialView.h"
#import "TitleView.h"
#import "TutorialDelegate.h"

@interface TutorialViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic, strong) TutorialView *view;

@property (nonatomic, weak) id<TutorialDelegate> delegate;

@end
