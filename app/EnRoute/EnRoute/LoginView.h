//
//  LoginView.h
//  EnRoute
//
//  Created by Quinten Delahaye on 01/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIElementFactory.h"

@interface LoginView : UIView

@property (strong,nonatomic)UIImageView *background;
@property (strong,nonatomic)UITextField *txtUsername;
@property (strong,nonatomic)UITextField *txtPassword;
@property (strong,nonatomic)UIButton *btnLogin;

@property (nonatomic, strong) UIImageView *feedbackMessage;

-(void)showTextfieldFeedback;

@end
