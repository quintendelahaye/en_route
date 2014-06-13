//
//  TutorialScreenView.m
//  EnRoute
//
//  Created by Thomas Verleye on 11/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "TutorialScreenView.h"

@implementation TutorialScreenView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIImage *headimg = [UIImage imageNamed:@"tutorial_title"];
        UIImageView *head = [[UIImageView alloc]initWithImage:headimg];
        head.center = CGPointMake(160, 45);
        [self addSubview:head];
        
        UIImage *expimg = [UIImage imageNamed:@"tutorial_explanation"];
        UIImageView *exp = [[UIImageView alloc]initWithImage:expimg];
        exp.center = CGPointMake(160, 83);
        [self addSubview:exp];
    }
    return self;
}

- (void)createHead:(NSString*)head andExplanation:(NSString*)explanation andImagename:(NSString*)imagename{
    
    self.head = [UIElementFactory createLabelWithFont:CORKI andSize:20 andText:head andFrame:CGRectMake(145, 35, 44, 0) andColor:[UIColor blackColor] andTextalignment:NSTextAlignmentCenter];
    [self addSubview:self.head];
    
    self.explanation = [UIElementFactory createLabelWithFont:CORKI andSize:20 andText:explanation andFrame:CGRectMake(63, 60, 205, 0) andColor:[UIColor blackColor] andTextalignment:NSTextAlignmentCenter];
    [self addSubview:self.explanation];
    
    UIImage *picture = [UIImage imageNamed:imagename];
    UIImageView *pictureView = [[UIImageView alloc]initWithImage:picture];
    pictureView.center = CGPointMake(160, 270);
    [self addSubview:pictureView];
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
