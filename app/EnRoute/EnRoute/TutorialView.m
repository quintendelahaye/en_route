//
//  TutorialView.m
//  EnRoute
//
//  Created by Thomas Verleye on 11/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "TutorialView.h"

@implementation TutorialView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor lightYellowColor];
        
        self.scrollView = [[UIScrollView alloc] initWithFrame:frame];
        [self addSubview:self.scrollView];
        self.scrollView.contentSize = CGSizeMake(frame.size.width*4, 0);
        self.scrollView.pagingEnabled = YES;
        
        self.tutorialScreen1 = [[TutorialScreenView alloc]initWithFrame:frame];
        [self.tutorialScreen1 createHead:@"Deel1" andExplanation:@"Ga met je groep naar een aangeduid deel van de stad" andImagename:@"handleiding_stap01"];
        [self.scrollView addSubview:self.tutorialScreen1];
        
        self.tutorialScreen2 = [[TutorialScreenView alloc]initWithFrame:CGRectMake(frame.size.width, 0, frame.size.width, frame.size.height)];
        [self.tutorialScreen2 createHead:@"Deel2" andExplanation:@"Volg de instructies van de opdracht en voer deze in groep uit" andImagename:@"handleiding_stap02"];
        [self.scrollView addSubview:self.tutorialScreen2];
        
        self.tutorialScreen3 = [[TutorialScreenView alloc]initWithFrame:CGRectMake(frame.size.width*2, 0, frame.size.width, frame.size.height)];
        [self.tutorialScreen3 createHead:@"Deel3" andExplanation:@"Ontdek nieuwe opdrachten en coole buurten!" andImagename:@"handleiding_stap03"];
        [self.scrollView addSubview:self.tutorialScreen3];
        
        self.tutorialScreen4 = [[TutorialScreenView alloc]initWithFrame:CGRectMake(frame.size.width*3, 0, frame.size.width, frame.size.height)];
        [self.tutorialScreen4 createHead:@"Deel4" andExplanation:@"Als alle opdrachten af zijn, keren jullie terug naar	     en herbekijken alles op de website" andImagename:@"handleiding_stap04"];
        UIImage *huisjeimg = [UIImage imageNamed:@"huisje"];
        UIImageView *huisje = [[UIImageView alloc]initWithImage:huisjeimg];
        huisje.center = CGPointMake(195, 95);
        [self.tutorialScreen4 addSubview:huisje];
        [self.scrollView addSubview:self.tutorialScreen4];
        
        CGRect f = CGRectMake(0, 410, 320, 20);
        self.pageControl = [[PageControl alloc] initWithFrame:f];
        self.pageControl.numberOfPages = 4;
        self.pageControl.currentPage = 0;
        self.pageControl.delegate = self;
        [self addSubview:self.pageControl];
        
        self.btnstart = [UIElementFactory createButtonWithImageName:@"btn_start" andPoint:CGPointMake(980, 440)];
        [self.scrollView addSubview:self.btnstart];
        
        [self createVideo:0];
    }
    return self;
}

-(void)createVideo:(int)page{
    [self.videoController.view removeFromSuperview];
    page++;
    
    NSString *movName = [NSString stringWithFormat:@"handleiding_stap0%i",page];
    NSString* outputPath = [[NSBundle mainBundle] pathForResource:movName ofType:@"mp4"];
    NSLog(@"%@",movName);
    
    self.videoController = [[MPMoviePlayerController alloc] init];
    self.videoController.movieSourceType = MPMovieSourceTypeFile;
    
    UIImage *placeholderimg = [UIImage imageNamed:[NSString stringWithFormat:@"placeholder0%i",page]];
    UIImageView *placeholder = [[UIImageView alloc]initWithImage:placeholderimg];
    
    NSURL *mov2 = [NSURL fileURLWithPath:outputPath];
    page--;
    [self.videoController setContentURL:mov2];
    [self.videoController.view setFrame:CGRectMake (25 + (320*page), 148, 270, 245)];
    self.videoController.controlStyle = MPMovieControlStyleNone;
    self.videoController.repeatMode = YES;
    [self.videoController.backgroundView addSubview:placeholder];
    [self.scrollView addSubview:self.videoController.view];
    
    [self.videoController play];
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
