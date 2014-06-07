//
//  Mission1IntroductionView.m
//  EnRoute
//
//  Created by Thomas Verleye on 7/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "Mission1IntroductionView.h"

@implementation Mission1IntroductionView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor lightYellowColor];
        
        self.btnStart = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnStart.frame = CGRectMake(self.frame.size.width/2 - 100, 410, 200, 50);
        self.btnStart.backgroundColor = [UIColor colorWithRed:228/255.0f green:102/255.0f blue:64/255.0f alpha:1];
        [self.btnStart setTitle:@"Start" forState:UIControlStateNormal];
        [self addSubview:self.btnStart];
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
