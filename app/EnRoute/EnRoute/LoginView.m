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
        [self createBackground];
    }
    return self;
}

-(void)createBackground{
    self.background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login-bg"]];
    self.background.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2 - 50);
    [self addSubview:self.background];
    
    //tekst - label
    NSString *text = @"Meld je aan met je groepsnaam";
    UILabel *explanation = [UIElementFactory createLabelWithFont:CORKI andSize:20 andText:text andFrame:CGRectMake(70, 50, 230, 0) andColor:[UIColor blackColor] andTextalignment:NSTextAlignmentCenter];
    [self addSubview:explanation];
    
    //blocks
    UIImage *block1 = [UIImage imageNamed:@"redBlock"];
    UIImageView *redBlock1 = [[UIImageView alloc]initWithFrame:CGRectMake(20, explanation.frame.origin.y + 3, block1.size.width, block1.size.height)];
    redBlock1.image = block1;
    [self addSubview:redBlock1];
    
    UIImage *block2 = [UIImage imageNamed:@"redBlock"];
    UIImageView *redBlock2 = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width - block2.size.width - 20, explanation.frame.origin.y + 3, block2.size.width, block2.size.height)];
    redBlock2.image = block2;
    [self addSubview:redBlock2];
}

-(void)createTextfields{
    
    self.txtUsername = [UIElementFactory createTextFieldWithText:@"groepsnaam" andPoint:CGPointMake(20,  100)];
    [self addSubview:self.txtUsername];
    
    self.txtPassword = [UIElementFactory createTextFieldWithText:@"wachtwoord" andPoint:CGPointMake(20,  self.txtUsername.frame.origin.y + 72)];
    self.txtPassword.secureTextEntry = YES;
    [self addSubview:self.txtPassword];
}

-(void)createButton{
    
    self.btnLogin = [UIElementFactory createButtonWithImageName:@"aanmeldKnop" andPoint:CGPointMake(20, self.txtPassword.frame.origin.y + 72)];
    [self addSubview:self.btnLogin];
    /*
    UIImage *loginImage = [UIImage imageNamed:@"aanmeldKnop"];
    self.btnLogin = [[UIButton alloc] init];
    self.btnLogin.frame = CGRectMake(self.frame.size.width/2 - loginImage.size.width/2, self.txtPassword.frame.origin.y + 72, loginImage.size.width, loginImage.size.height);
    [self.btnLogin setImage:loginImage forState:UIControlStateNormal];
    [self addSubview:self.btnLogin];*/
}

/*-(void)showError{
    [UIView animateWithDuration:.2 animations:^{
        self.btnLogin.backgroundColor = [UIColor colorWithRed:200/255.0f green:0/255.0f blue:0/255.0f alpha:0.6];
    }];
}*/

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
