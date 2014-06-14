//
//  Mission3ExplanationView.m
//  EnRoute
//
//  Created by Thomas Verleye on 14/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "Mission3ExplanationView.h"

@implementation Mission3ExplanationView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Mission3_explanation_bg"]];
        
        UILabel *head = [UIElementFactory createLabelWithFont:CORKI andSize:20 andText:@"Mode" andFrame:CGRectMake(143, 50, 33, 0) andColor:[UIColor blackColor] andTextalignment:NSTextAlignmentLeft];
        [self addSubview:head];
        
        UILabel *text1 = [UIElementFactory createLabelWithFont:CORKI andSize:20 andText:@"Antwerpen is een modestad, jullie opdracht is om min. 3 kledinglabels te verzamelen van verschillende winkels." andFrame:CGRectMake(50, 80, 220, 0) andColor:[UIColor blackColor] andTextalignment:NSTextAlignmentLeft];
        [self addSubview:text1];
        
        UILabel *text2 = [UIElementFactory createLabelWithFont:CORKI andSize:20 andText:@"Op het einde van deze tour kunnen jullie deze labels nieten op een kleed uit de 17e eeuw." andFrame:CGRectMake(50, 190, 220, 0) andColor:[UIColor blackColor] andTextalignment:NSTextAlignmentLeft];
        [self addSubview:text2];
        
        UILabel *text3 = [UIElementFactory createLabelWithFont:CORKI andSize:20 andText:@"Zo creeeren we samen een antiek kleed in een modern jasje" andFrame:CGRectMake(50, 270, 220, 0) andColor:[UIColor blackColor] andTextalignment:NSTextAlignmentLeft];
        [self addSubview:text3];
        
        UILabel *remark = [UIElementFactory createLabelWithFont:CORKI andSize:25 andText:@"Vraag er aan winkelaars!" andFrame:CGRectMake(70, 155, 220, 0) andColor:[UIColor nicerDarkGreenColor] andTextalignment:NSTextAlignmentLeft];
        [self addSubview:remark];
        
        self.btnstart = [UIElementFactory createButtonWithImageName:@"btn_start" andPoint:CGPointMake(20, 440)];
        [self addSubview:self.btnstart];
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
