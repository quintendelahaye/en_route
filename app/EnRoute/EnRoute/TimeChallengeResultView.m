//
//  TimeChallengeResultView.m
//  EnRoute
//
//  Created by Thomas Verleye on 15/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "TimeChallengeResultView.h"

@implementation TimeChallengeResultView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor lightYellowColor];
        
        CGRect bounds = CGRectMake(0, 3, 320, 320);
        self.imageView = [[UIImageView alloc]initWithFrame:bounds];
        [self addSubview:self.imageView];
        
        UIImage *bgImg = [UIImage imageNamed:@"mission1_result_bg"];
        UIImageView *bg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 323, bgImg.size.width, bgImg.size.height)];
        bg.image = bgImg;
        [self addSubview:bg];
        
        NSString *text = @"Is deze foto goed of wil je deze opnieuw nemen?";
        UILabel *explanation = [UIElementFactory createLabelWithFont:CORKI andSize:20 andText:text andFrame:CGRectMake(50, 366, 222, 0) andColor:[UIColor blackColor] andTextalignment:NSTextAlignmentLeft];
        [self addSubview:explanation];
        
        NSString *title = @"klaar!";
        UILabel *lblTitle = [UIElementFactory createLabelWithFont:CORKI andSize:20 andText:title andFrame:CGRectMake(145, 340, 40, 0) andColor:[UIColor blackColor] andTextalignment:NSTextAlignmentCenter];
        
        [self addSubview:lblTitle];
        
        UIImageView *timerBg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"timerbg"]];
        timerBg.center = CGPointMake(self.frame.size.width/2, 287);
        [self addSubview:timerBg];
        self.lblTime = [UIElementFactory createLabelWithFont:CORKI andSize:22 andText:@"05:00" andFrame:CGRectMake(0, 0, 60, 0) andColor:[UIColor lightYellowColor] andTextalignment:NSTextAlignmentCenter];
        self.lblTime.frame = CGRectMake(0, 0, 60, 33);
        self.lblTime.center = CGPointMake(self.frame.size.width/2, 287);
        [self addSubview:self.lblTime];
        
        self.redo = [UIElementFactory createButtonWithImageName:@"btn_redo" andPoint:CGPointMake(50, 432)];
        [self addSubview:self.redo];
        
        self.ok = [UIElementFactory createButtonWithImageName:@"btn_ok" andPoint:CGPointMake(205, 432)];
        [self addSubview:self.ok];
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
