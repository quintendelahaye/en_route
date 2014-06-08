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
        
        //title
        UIImage *subTitleImg = [UIImage imageNamed:@"subtitle_collage"];
        UIImageView *subTitle = [[UIImageView alloc]initWithFrame:CGRectMake(20, 45, subTitleImg.size.width, subTitleImg.size.height)];
        subTitle.image = subTitleImg;
        [self addSubview:subTitle];
        
        //tekst
        NSString *text = @"Neem 3 foto’s. Deze foto’s worden in een collage gegoten. Zorg voor een duidelijk verschil tussen oud en modern in je foto’s.";
        UILabel *explanation = [UIElementFactory createLabelWithFont:CORKI andSize:20 andText:text andFrame:CGRectMake(45, 77, 230, 0) andColor:[UIColor blackColor] andTextalignment:NSTextAlignmentLeft];
        [self addSubview:explanation];
        
        //wees creatief
        NSString *weesCreatiefText = @"Wees creatief!";
        UILabel *weesCreatief = [UIElementFactory createLabelWithFont:CORKI andSize:21 andText:weesCreatiefText andFrame:CGRectMake(85, 148, 100, 0) andColor:[UIColor niceRedColor] andTextalignment:NSTextAlignmentLeft];
        [self addSubview:weesCreatief];
        
        //example
        UIImage *exampleImg = [UIImage imageNamed:@"collage_example"];
        UIImageView *example = [[UIImageView alloc]initWithFrame:CGRectMake(62, 200, exampleImg.size.width, exampleImg.size.height)];
        example.image = exampleImg;
        [self addSubview:example];
        
        //startbutton
        self.btnStart = [UIElementFactory createButtonWithImageName:@"red_Start_Medium"];
        self.btnStart.center = CGPointMake(self.frame.size.width/2, 456);
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
