//
//  TimeChallengeExplanationView.m
//  EnRoute
//
//  Created by Thomas Verleye on 15/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "TimeChallengeExplanationView.h"

@implementation TimeChallengeExplanationView

- (id)initWithFrame:(CGRect)frame andHead:(NSString*)head andExplanation:(NSString*)explanation andRemark:(NSString*)remark andImage:(UIImage*)image
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"timeChallenge"]];
        
        self.head = [UIElementFactory createLabelWithFont:CORKI andSize:20 andText:head andFrame:CGRectMake(0, 0, 55, 0) andColor:[UIColor blackColor] andTextalignment:NSTextAlignmentCenter];
        self.head.center = CGPointMake(self.frame.size.width/2, 62);
        [self addSubview:self.head];
        
        self.explanation = [UIElementFactory createLabelWithFont:CORKI andSize:20 andText:explanation andFrame:CGRectMake(50, 90, 220, 0) andColor:[UIColor blackColor] andTextalignment:NSTextAlignmentLeft];
        [self addSubview:self.explanation];
        
        self.remark = [UIElementFactory createLabelWithFont:CORKI andSize:20 andText:remark andFrame:CGRectMake(50, 100+self.explanation.frame.size.height, 220, 0) andColor:[UIColor niceRedColor] andTextalignment:NSTextAlignmentLeft];
        [self addSubview:self.remark];
        
        int yPos = (440 - self.remark.frame.origin.y - self.remark.frame.size.height)/2 + self.remark.frame.origin.y +  self.remark.frame.size.height;
        self.imageView = [[UIImageView alloc]initWithImage:image];
        self.imageView.center = CGPointMake(self.frame.size.width/2, yPos);
        [self addSubview:self.imageView];
        
        self.btnStart = [UIElementFactory createButtonWithImageName:@"btn_start" andPoint:CGPointMake(20, 440)];
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
