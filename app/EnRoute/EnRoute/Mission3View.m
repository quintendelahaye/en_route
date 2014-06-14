//
//  Mission3View.m
//  EnRoute
//
//  Created by Thomas Verleye on 14/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "Mission3View.h"

@implementation Mission3View

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor lightYellowColor];
        
        NSString *text = @"Geef de winkelnaam in waarvan je een label hebt. (Minimum: 3)";
        self.explanation = [UIElementFactory createLabelWithFont:CORKI andSize:20 andText:text andFrame:CGRectMake(45, 40, 230, 0) andColor:[UIColor blackColor] andTextalignment:NSTextAlignmentCenter];
        [self addSubview:self.explanation];
        
        UIImage *titleImg = [UIImage imageNamed:@"toegevoegdeWinkels"];
        UIImageView *titleToegevoegd = [[UIImageView alloc]initWithFrame:CGRectMake(20, 100, titleImg.size.width, titleImg.size.height)];
        titleToegevoegd.image = titleImg;
        [self addSubview:titleToegevoegd];
        
        //blocks
        UIImage *block1 = [UIImage imageNamed:@"redBlock"];
        UIImageView *redBlock1 = [[UIImageView alloc]initWithFrame:CGRectMake(20, self.explanation.frame.origin.y + 3, block1.size.width, block1.size.height)];
        redBlock1.image = block1;
        [self addSubview:redBlock1];
        
        UIImage *block2 = [UIImage imageNamed:@"redBlock"];
        UIImageView *redBlock2 = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width - block2.size.width - 20, self.explanation.frame.origin.y + 3, block2.size.width, block2.size.height)];
        redBlock2.image = block2;
        [self addSubview:redBlock2];
        
        //scrollview enzo
        self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(20, 132, 277, 392)];
        [self addSubview:self.scrollView];
        
        UIImage *textFieldImage = [UIImage imageNamed:@"bg_textfield_persoon"];
        
        self.textfieldMember = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 203, 50)];
        self.textfieldMember.placeholder = @"WINKELNAAM";
        self.textfieldMember.background = textFieldImage;
        self.textfieldMember.font = [UIFont fontWithName:BEBAS size:20];
        self.textfieldMember.textAlignment = NSTextAlignmentCenter;
        
        [self.scrollView addSubview:self.textfieldMember];
        
        self.btnAdd = [UIElementFactory createButtonWithImageName:@"btn_plus" andPoint:CGPointMake(213, 0)];
        [self.scrollView addSubview:self.btnAdd];
        
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
