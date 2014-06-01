//
//  Mainview.m
//  EnRoute
//
//  Created by Quinten Delahaye on 01/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "Mainview.h"

@implementation Mainview

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code        
        UIImage *logo = [UIImage imageNamed:@"en_route_logo"];
        UIImageView *logoView = [[UIImageView alloc] initWithImage:logo];
        logoView.frame = CGRectMake(self.frame.size.width/2 - logo.size.width/2, 100, logo.size.width, logo.size.height);
        [self addSubview:logoView];
        
        self.btnLogin = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnLogin.frame = CGRectMake(self.frame.size.width/2 - 100, 250, 200, 50);
        self.btnLogin.backgroundColor = [UIColor colorWithRed:228/255.0f green:102/255.0f blue:64/255.0f alpha:1];
        [self.btnLogin setTitle:@"Login" forState:UIControlStateNormal];
        [self addSubview:self.btnLogin];
        
        self.btnRegister = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnRegister.frame = CGRectMake(self.frame.size.width/2 - 100, 350, 200, 50);
        self.btnRegister.backgroundColor = [UIColor colorWithRed:228/255.0f green:102/255.0f blue:64/255.0f alpha:1];
        [self.btnRegister setTitle:@"Registeer" forState:UIControlStateNormal];
        [self addSubview:self.btnRegister];
    }
    return self;
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
