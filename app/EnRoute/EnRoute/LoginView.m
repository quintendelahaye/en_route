//
//  LoginView.m
//  EnRoute
//
//  Created by Quinten Delahaye on 01/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "LoginView.h"

@implementation LoginView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor colorWithRed:244/250.0f green:234/250.0f blue:198/250.0f alpha:1];
        [self createTextfields];
        [self createButton];
    }
    return self;
}


-(void)createTextfields{
    
    UIImage *textFieldImage = [UIImage imageNamed:@"login-textfield-bg"];
    
    self.txtUsername = [[UITextField alloc] initWithFrame:CGRectMake(20, 100, self.frame.size.width - 40, 44)];
    self.txtUsername.placeholder = @"Username";
    self.txtUsername.background = textFieldImage;
    [self addSubview:self.txtUsername];
    
    self.txtPassword = [[UITextField alloc] initWithFrame:CGRectMake(20,  self.txtUsername.frame.origin.y + 52, self.frame.size.width - 40, 44)];
    self.txtPassword.placeholder = @"Password";
    self.txtPassword.background = textFieldImage;
    self.txtPassword.secureTextEntry = YES;
    [self addSubview:self.txtPassword];
}

-(void)createButton{
    self.btnLogin = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnLogin.frame = CGRectMake(20, self.txtPassword.frame.origin.y + 52, self.txtUsername.frame.size.width, 50);
    self.btnLogin.backgroundColor = [UIColor colorWithRed:0/255.0f green:200/255.0f blue:0/255.0f alpha:0.6];
    [self.btnLogin setTitle:@"Login" forState:UIControlStateNormal];
    [self addSubview:self.btnLogin];
}

-(void)showError{
    [UIView animateWithDuration:.2 animations:^{
        self.btnLogin.backgroundColor = [UIColor colorWithRed:200/255.0f green:0/255.0f blue:0/255.0f alpha:0.6];
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
