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
        
        //title_bg
        UIImageView *bgTitle = [[UIImageView alloc]initWithFrame:titleFrame];
        bgTitle.image = [UIImage imageNamed:@"title_bg"];
        [self addSubview:bgTitle];
        
        
        //title
        NSString *strTitle = [title uppercaseString];
        //UIFont *fontNaam = [UIFont fontWithName:BEBAS_NEUE size:30];
        UILabel *lblTitle = [[UILabel alloc]initWithFrame:titleFrame];
        //lblNaam.font = fontNaam;
        lblTitle.textAlignment = NSTextAlignmentCenter;
        lblTitle.numberOfLines = 0;
        lblTitle.text = strTitle;
        lblTitle.textColor = [UIColor lightYellowColor];
        [self addSubview:lblTitle];
        
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
