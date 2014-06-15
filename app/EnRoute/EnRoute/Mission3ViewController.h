//
//  Mission3ViewController.h
//  EnRoute
//
//  Created by Thomas Verleye on 14/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Mission3View.h"
#import "TitleView.h"
#import "MemberView.h"
#import <AFNetworking.h>
#import "Mission3delegate.h"

@interface Mission3ViewController : UIViewController

@property (nonatomic, strong) Mission3View *view;
@property (nonatomic, strong) NSMutableArray *winkels;
@property (nonatomic, weak) id<Mission3delegate> delegate;

@end
