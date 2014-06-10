//
//  MemberView.m
//  EnRoute
//
//  Created by Thomas Verleye on 10/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "MemberView.h"

@implementation MemberView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"member_item"]];
        
        self.lblNaam = [UIElementFactory createLabelWithFont:BEBAS andSize:25 andText:self.name andFrame:CGRectMake(0, 15, self.frame.size.width, 0) andColor:[UIColor niceGreenColor] andTextalignment:NSTextAlignmentCenter];
        [self addSubview:self.lblNaam];
    }
    return self;
}

- (id)initWithName:(NSString*)name andCGPoint:(CGPoint)point{
    self.name = name;
    UIImage *bg = [UIImage imageNamed:@"member_item"];
    return [self initWithFrame:CGRectMake(point.x, point.y, bg.size.width, bg.size.height)];
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
