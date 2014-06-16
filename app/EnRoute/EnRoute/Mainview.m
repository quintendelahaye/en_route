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
        
        UIImage *homeHead = [UIImage imageNamed:@"homeHead"];
        UIImageView *head = [[UIImageView alloc] initWithFrame:CGRectMake(21, 21, homeHead.size.width, homeHead.size.height)];
        head.image = homeHead;
        [self addSubview:head];
        
        self.lblTitel = [[UILabel alloc] initWithFrame:CGRectMake(65, head.frame.origin.y + head.frame.size.height/2 + 150, 400, 50)];
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
        
        self.btnLogin = [UIElementFactory createButtonWithImageName:@"aanmeldKnop" andPoint:CGPointMake(20, 370)];
        [self addSubview:self.btnLogin];
        
        self.btnRegister = [UIElementFactory createButtonWithImageName:@"registreerKnop" andPoint:CGPointMake(20, self.btnLogin.frame.origin.y + self.btnLogin.frame.size.height + 20 )];
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
