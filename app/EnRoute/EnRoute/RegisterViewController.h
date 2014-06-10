//
//  RegisterViewController.h
//  EnRoute
//
//  Created by Quinten Delahaye on 01/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegisterView.h"
#import <AFNetworking.h>
#import "TitleView.h"
#import "MemberView.h"

@interface RegisterViewController : UIViewController

@property (strong,nonatomic)RegisterView *view;
@property (nonatomic, strong) TitleView *titleView;
@property (nonatomic, strong) NSMutableArray *members;

@end
