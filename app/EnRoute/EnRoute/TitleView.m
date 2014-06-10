//
//  TitleView.m
//  EnRoute
//
//  Created by Thomas Verleye on 8/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "TitleView.h"

@implementation TitleView

- (id)initWithFrame:(CGRect)frame andTitle:(NSString*)title
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        CGRect titleFrame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        CGRect labelFrame = CGRectMake(0, 0, frame.size.width, 22);
        
        //title_bg
        UIImageView *bgTitle = [[UIImageView alloc]initWithFrame:titleFrame];
        bgTitle.image = [UIImage imageNamed:@"title_bg"];
        [self addSubview:bgTitle];
        
        
        //title
        NSString *strTitle = [title uppercaseString];
        UIFont *fontNaam = [UIFont fontWithName:BEBAS size:22];
        self.lblTitle = [[UILabel alloc]initWithFrame:labelFrame];
        self.lblTitle.font = fontNaam;
        self.lblTitle.textAlignment = NSTextAlignmentCenter;
        self.lblTitle.numberOfLines = 0;
        self.lblTitle.text = strTitle;
        self.lblTitle.textColor = [UIColor lightYellowColor];
        [self addSubview:self.lblTitle];
        
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
