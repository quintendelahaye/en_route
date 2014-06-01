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
        [self createBackground];
        [self createTextfields];
        [self createButton];
    }
    return self;
}

-(void)createBackground{
    self.background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login-bg"]];
    self.background.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2 - 50);
    [self addSubview:self.background];
}

-(void)createTextfields{
    
    UIImage *textFieldImage = [UIImage imageNamed:@"login-textfield-bg"];
    
    self.txtUsername = [[UITextField alloc] initWithFrame:CGRectMake(self.background.frame.origin.x + 12, self.frame.size.height/2 - self.background.frame.size.height/2 -40, self.frame.size.width - 35, 44)];
    self.txtUsername.placeholder = @"Username";
    self.txtUsername.background = textFieldImage;
    [self addSubview:self.txtUsername];
    
    self.txtPassword = [[UITextField alloc] initWithFrame:CGRectMake(self.background.frame.origin.x + 12,  self.frame.size.height/2 - self.background.frame.size.height/2 +10, self.frame.size.width - 35, 44)];
    self.txtPassword.placeholder = @"Password";
    self.txtPassword.background = textFieldImage;
    self.txtPassword.secureTextEntry = YES;
    [self addSubview:self.txtPassword];
}

-(void)createButton{
    self.btnLogin = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnLogin.frame = CGRectMake(self.txtUsername.frame.origin.x, self.txtPassword.frame.origin.y + 80, self.txtUsername.frame.size.width, 50);
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
