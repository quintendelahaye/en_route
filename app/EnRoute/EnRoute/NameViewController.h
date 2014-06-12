//
//  NameViewController.h
//  EnRoute
//
//  Created by Thomas Verleye on 10/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NameView.h"
#import "TitleView.h"
#import <AFNetworking.h>
#import "DropItemButton.h"
#import "UIColor+Extentions.h"

@interface NameViewController : UIViewController

@property (nonatomic, strong) NameView *view;
@property (nonatomic, strong) NSDictionary *members;

@property (nonatomic, assign) int selectedId;

@end
