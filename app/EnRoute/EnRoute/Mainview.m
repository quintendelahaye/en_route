//
//  Mainview.m
//  EnRoute
//
//  Created by Quinten Delahaye on 01/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "Mainview.h"
#import <QuartzCore/QuartzCore.h>

@implementation Mainview

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.backgroundColor = [UIColor colorWithRed:244/250.0f green:234/250.0f blue:198/250.0f alpha:1];
        
        self.imageLayer = [CALayer layer];
        
//        CALayer* maskLayer = [CALayer layer];
//        maskLayer.frame = self.frame;
//        maskLayer.contents = (__bridge id)[[UIImage imageNamed:@"yourMaskImage.png"] CGImage];
        
        self.logoView = [[LogoView alloc] initWithFrame:CGRectMake(self.frame.size.width/2 - self.logoView.background.frame.size.width/2, 120, self.logoView.background.frame.size.height, self.logoView.background.frame.size.height)];
        [self addSubview:self.logoView];
        
        UIImageView *antwerpenTitel = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"antwerpenTitel"]];
        antwerpenTitel.frame = CGRectMake(self.frame.size.width/2 - antwerpenTitel.frame.size.width/2, self.logoView.frame.origin.y + self.logoView.background.frame.size.height/2, antwerpenTitel.frame.size.width, antwerpenTitel.frame.size.height);
        [self addSubview:antwerpenTitel];
        
        self.lblTitel = [[UILabel alloc] initWithFrame:CGRectMake(65, antwerpenTitel.frame.origin.y + antwerpenTitel.frame.size.height/2 + 60, 400, 50)];
        self.lblTitel.text = @"OUD & NIEUW";
        self.lblTitel.font = [UIFont fontWithName:CORKI size:50];
        [self addSubview:self.lblTitel];
        
        CGFloat xPos = 25;
        
        for(int i = 0; i < 2; i++){
            UIImageView *block = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"block"]];
            block.frame = CGRectMake(xPos, self.lblTitel.frame.origin.y + 10, block.frame.size.width, block.frame.size.height);
            [self addSubview:block];
            xPos += 250;
        }
        
        UIImage *loginImage = [UIImage imageNamed:@"aanmeldKnop"];
        self.btnLogin = [[UIButton alloc] init];
        self.btnLogin.frame = CGRectMake(self.frame.size.width/2 - loginImage.size.width/2, self.frame.size.height - 40 - loginImage.size.height*2, loginImage.size.width, loginImage.size.height);
        [self.btnLogin setImage:loginImage forState:UIControlStateNormal];
        [self addSubview:self.btnLogin];
        
        UIImage *registerImage = [UIImage imageNamed:@"registreerKnop"];
        self.btnRegister = [[UIButton alloc]init];
        self.btnRegister.frame = CGRectMake(self.frame.size.width/2 - registerImage.size.width/2, self.frame.size.height - registerImage.size.height - 20, registerImage.size.width, registerImage.size.height);
        [self.btnRegister setImage:registerImage forState:UIControlStateNormal];
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
