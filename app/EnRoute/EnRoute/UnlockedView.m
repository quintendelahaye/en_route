//
//  UnlockedView.m
//  EnRoute
//
//  Created by Thomas Verleye on 9/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "UnlockedView.h"

@implementation UnlockedView

- (id)initWithFrame:(CGRect)frame andText:(NSString*)text andLast:(BOOL)last
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UILabel *titel = [UIElementFactory createLabelWithFont:CORKI andSize:20 andText:@"opdracht voltooid!" andFrame:CGRectMake(90, 15, 115, 0) andColor:[UIColor blackColor] andTextalignment:NSTextAlignmentCenter];
        [self addSubview:titel];
        
        UIImage *unlockedBg = [UIImage imageNamed:@"unlocked_screen"];
        self.backgroundColor = [UIColor colorWithPatternImage:unlockedBg];
        
        UILabel *textLabel = [UIElementFactory createLabelWithFont:CORKI andSize:20 andText:text andFrame:CGRectMake(50, 105, 200, 0) andColor:[UIColor blackColor] andTextalignment:NSTextAlignmentLeft];
        [self addSubview:textLabel];
        
        if (last) {
            self.gaverder = [UIElementFactory createButtonWithImageName:@"btnGaVerder" andPoint:CGPointMake(23, 190)];
            [self addSubview:self.gaverder];
        }else{
            self.mode = [UIElementFactory createButtonWithImageName:@"modebuurt" andPoint:CGPointMake(20, 190)];
            [self addSubview:self.mode];
            self.kunst = [UIElementFactory createButtonWithImageName:@"kunstbuurt" andPoint:CGPointMake(150, 190)];
            [self addSubview:self.kunst];
        }
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
