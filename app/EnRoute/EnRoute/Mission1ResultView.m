//
//  Mission1ResultView.m
//  EnRoute
//
//  Created by Thomas Verleye on 8/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "Mission1ResultView.h"

@implementation Mission1ResultView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor lightYellowColor];
        
        CGRect bounds = CGRectMake(0, 3, 320, 426);
        self.imageView = [[UIImageView alloc]initWithFrame:bounds];
        [self addSubview:self.imageView];
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
