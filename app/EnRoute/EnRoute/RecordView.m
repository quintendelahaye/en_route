//
//  RecordView.m
//  EnRoute
//
//  Created by Thomas Verleye on 13/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "RecordView.h"

@implementation RecordView

- (id)initWithFrame:(CGRect)frame andWord:(NSString*)word
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.bg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        self.bg.image = [UIImage imageNamed:@"recordViewBg"];
        [self addSubview:self.bg];
                   
        self.word = [UIElementFactory createLabelWithFont:BEBAS andSize:42 andText:word andFrame:CGRectMake(170, 135, 140, 50) andColor:[UIColor whiteColor] andTextalignment:NSTextAlignmentCenter];
        [self addSubview:self.word];
                   
        self.record = [UIElementFactory createButtonWithImageName:@"mic_icon" andPoint:CGPointMake(25, 114)];
        [self addSubview:self.record];
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
