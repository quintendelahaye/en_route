//
//  RegisterView.h
//  EnRoute
//
//  Created by Quinten Delahaye on 01/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterView : UIView

@property (strong,nonatomic)UIImageView *background;

@property (strong,nonatomic)UITextField *txtUsername;

@property (strong,nonatomic)UITextField *txtPassword;
@property (strong,nonatomic)UITextField *txtGroupName;

@property (strong,nonatomic)UIButton *btnLogin;

-(void)showError;


@end
