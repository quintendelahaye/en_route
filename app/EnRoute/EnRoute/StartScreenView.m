//
//  StartScreenView.m
//  EnRoute
//
//  Created by Quinten Delahaye on 01/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "StartScreenView.h"

@implementation StartScreenView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor colorWithRed:244/250.0f green:234/250.0f blue:198/250.0f alpha:1];
        
        UIImage *logo = [UIImage imageNamed:@"en_route_logo"];
        UIImageView *logoView = [[UIImageView alloc] initWithImage:logo];
        logoView.frame = CGRectMake(self.frame.size.width/2 - logo.size.width/2, 100, logo.size.width, logo.size.height);
        [self addSubview:logoView];
        
        self.btnLogin = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnLogin.frame = CGRectMake(self.frame.size.width/2 - 100, 410, 200, 50);
        self.btnLogin.backgroundColor = [UIColor colorWithRed:228/255.0f green:102/255.0f blue:64/255.0f alpha:1];
        [self.btnLogin setTitle:@"Start Tour" forState:UIControlStateNormal];
        [self addSubview:self.btnLogin];
        
        self.btnRegister = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnRegister.frame = CGRectMake(self.frame.size.width/2 - 100, 470, 200, 50);
        self.btnRegister.backgroundColor = [UIColor colorWithRed:228/255.0f green:102/255.0f blue:64/255.0f alpha:1];
        [self.btnRegister setTitle:@"Tutorial" forState:UIControlStateNormal];
        [self addSubview:self.btnRegister];
        
//        UIImage *logOutImage = [UIImage imageNamed:@"afmeldKnop"];
//        self.afmeldKnop = [[UIButton alloc] init];
//        self.afmeldKnop.frame = CGRectMake(0, self.frame.size.height - logOutImage.size.height, logOutImage.size.width, logOutImage.size.height);
//        [self.afmeldKnop setImage:logOutImage forState:UIControlStateNormal];
//        [self addSubview:self.afmeldKnop];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dismissMenu:) name:@"LOGOUT_CANCEL_TAPPED" object:nil];
        // DEALLOC?
        
    }
    return self;
}


-(void)loggedInWithUser:(NSString*)user{
    self.lblTitel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    self.lblTitel.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    self.lblTitel.text = [NSString stringWithFormat:@"Logged in as %@",user];
    [self addSubview:self.lblTitel];
}

-(void)showMenu{
    CGRect bounds = [[UIScreen mainScreen] bounds];
    self.menu = [[MenuView alloc] initWithFrame:bounds];
    [self addSubview:self.menu];
    self.menu.frame = CGRectMake(0, -self.frame.size.height, self.frame.size.width, self.frame.size.height);
    [UIView animateWithDuration:0.5 animations:^{
        self.menu.frame = CGRectMake(0, -150, self.frame.size.width, self.frame.size.height);
    }];
}

-(void)dismissMenu:(id)sender{
    [UIView animateWithDuration:0.5 animations:^{
        self.menu.frame = CGRectMake(0, -self.frame.size.height, self.frame.size.width, self.frame.size.height);
    }completion:^(BOOL finished) {
        [self.menu removeFromSuperview];
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
