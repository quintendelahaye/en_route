//
//  TutorialMission2View.m
//  EnRoute
//
//  Created by Thomas Verleye on 12/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "TutorialMission2View.h"

@implementation TutorialMission2View

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor lightYellowColor];
        
        self.scrollView = [[UIScrollView alloc] initWithFrame:frame];
        [self addSubview:self.scrollView];
        self.scrollView.contentSize = CGSizeMake(frame.size.width*3, 0);
        self.scrollView.pagingEnabled = YES;
        
        self.tutorialScreen1 = [[TutorialScreenView alloc]initWithFrame:frame];
        [self.tutorialScreen1 createHead:@"Deel1" andExplanation:@"Jullie krijgen een stuk van een typisch Antwerps liedje met de kernwoorden in het rood" andImagename:@"Mission2Tutorial1"];
        [self.scrollView addSubview:self.tutorialScreen1];
        
        self.tutorialScreen2 = [[TutorialScreenView alloc]initWithFrame:CGRectMake(frame.size.width, 0, frame.size.width, frame.size.height)];
        [self.tutorialScreen2 createHead:@"Deel2" andExplanation:@"Zoek Antwerpenaren en laat hen deze woorden inspreken." andImagename:@"Mission2Tutorial2"];
        [self.scrollView addSubview:self.tutorialScreen2];
        
        self.tutorialScreen3 = [[TutorialScreenView alloc]initWithFrame:CGRectMake(frame.size.width*2, 0, frame.size.width, frame.size.height)];
        [self.tutorialScreen3 createHead:@"Deel3" andExplanation:@"Neem ook een achtergrond foto die perfect past bij dit stukje." andImagename:@"Mission2Tutorial3"];
        [self.scrollView addSubview:self.tutorialScreen3];
        
        CGRect f = CGRectMake(0, 405, 320, 20);
        self.pageControl = [[PageControl alloc] initWithFrame:f];
        self.pageControl.numberOfPages = 3;
        self.pageControl.currentPage = 0;
        [self addSubview:self.pageControl];
        
        self.btnstart = [UIElementFactory createButtonWithImageName:@"btn_start" andPoint:CGPointMake(660, 440)];
        [self.scrollView addSubview:self.btnstart];
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
