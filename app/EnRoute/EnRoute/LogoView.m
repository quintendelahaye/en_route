//
//  LogoView.m
//  EnRoute
//
//  Created by Quinten Delahaye on 05/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "LogoView.h"

@implementation LogoView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        NSLog(@"[LogoView] init");
        [self drawBackGround];
        [self drawLogo];
    }
    return self;
}

-(void)drawBackGround{
    self.background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"kader"]];
    self.background.center = CGPointMake(0, 0);
    [self addSubview:self.background];
}

-(void)drawLogo{
    self.logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title"]];
    self.logo.center = CGPointMake(-20, -20);
    [self addSubview:self.logo];
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
