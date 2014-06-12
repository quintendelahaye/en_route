//
//  NameView.m
//  EnRoute
//
//  Created by Thomas Verleye on 10/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "NameView.h"

@implementation NameView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor lightYellowColor];
        
        UIImage *title = [UIImage imageNamed:@"title_nameView"];
        UIImageView *titleView = [[UIImageView alloc]initWithFrame:CGRectMake(45, 75, title.size.width, title.size.height)];
        titleView.image = title;
        [self addSubview:titleView];
        
        NSString *image = @"dropdown";
        self.dropdown = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *imageButton = [UIImage imageNamed:image];
        [self.dropdown setBackgroundImage:imageButton forState:UIControlStateNormal];
        [self.dropdown setBackgroundImage:[UIImage imageNamed:[image stringByAppendingString:@"_Pushed"]] forState:UIControlStateHighlighted];
        [self.dropdown setFrame:CGRectMake(20, 138, imageButton.size.width,imageButton.size.height)];
        [self.dropdown setTitle:@"..." forState:UIControlStateNormal];
        [self.dropdown setTitleColor:[UIColor niceGreenColor] forState:UIControlStateNormal];
        [self addSubview:self.dropdown];
    }
    return self;
}

- (void)createScrollView{
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(20, 202, 270, 332)];
    [self addSubview:self.scrollView];
}

- (void)createStart{
    self.btnStart = [UIElementFactory createButtonWithImageName:@"btn_start" andPoint:CGPointMake(20, 215)];
    [self addSubview:self.btnStart];
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
