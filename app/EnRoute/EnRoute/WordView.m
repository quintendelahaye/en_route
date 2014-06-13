//
//  WordView.m
//  EnRoute
//
//  Created by Thomas Verleye on 12/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "WordView.h"

@implementation WordView

- (id)initWithFrame:(CGRect)frame andPart:(int)part
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.part = part;
        
        self.word = [UIElementFactory createButtonWithImageName:[NSString stringWithFormat:@"word%i",part] andPoint:CGPointMake(0, 11)];
        [self addSubview:self.word];
        
        self.remove = [UIElementFactory createButtonWithImageName:@"close" andPoint:CGPointMake(self.word.frame.size.width -18, 0)];
    }
    return self;
}

- (void)showRemove{
    [self addSubview:self.remove];
}

- (void)hideRemove{
    [self.remove removeFromSuperview];
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
