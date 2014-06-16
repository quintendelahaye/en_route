//
//  Mission3ExplanationViewController.h
//  EnRoute
//
//  Created by Thomas Verleye on 14/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Mission3ExplanationView.h"
#import "TitleView.h"
#import "Mission3ViewController.h"
#import "Mission3delegate.h"

@interface Mission3ExplanationViewController : UIViewController<Mission3delegate>

@property (nonatomic, strong) Mission3ExplanationView *view;
@property (nonatomic, strong) Mission3ViewController *mission3VC;
@property (nonatomic, weak) id<Mission3delegate> delegate;

@end
