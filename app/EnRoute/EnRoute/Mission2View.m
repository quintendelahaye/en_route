//
//  Mission2View.m
//  EnRoute
//
//  Created by Thomas Verleye on 12/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "Mission2View.h"

@implementation Mission2View

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor lightYellowColor];
        
        UIImage *bgimg = [UIImage imageNamed:@"mission2_bg"];
        self.bg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 5, 320, 521)];
        self.bg.image = bgimg;
        [self addSubview:self.bg];
        
        self.capturedPicture = [[UIImageView alloc]initWithFrame:CGRectMake(0, 3, 320, 323)];
        [self addSubview:self.capturedPicture];
        
        UIImage *songtekstimg = [UIImage imageNamed:@"mission2_song"];
        UIImageView *songtekst = [[UIImageView alloc]initWithFrame:CGRectMake(0, 5, 320, 320)];
        songtekst.image = songtekstimg;
        [self addSubview:songtekst];
        
        self.word1 = [[WordView alloc]initWithFrame:CGRectMake(210, 106, 100, 50) andPart:1];
        self.word2 = [[WordView alloc]initWithFrame:CGRectMake(67, 144, 100, 50) andPart:2];
        self.word3 = [[WordView alloc]initWithFrame:CGRectMake(192, 182, 100, 50) andPart:3];
        
        [self addSubview:self.word1];
        [self addSubview:self.word2];
        [self addSubview:self.word3];
        
        self.lblTodo = [UIElementFactory createLabelWithFont:CORKI andSize:20 andText:@"Je moet nog 2 woorden opnemen en een achtergrond foto nemen." andFrame:CGRectMake(55, 342, 210, 0) andColor:[UIColor blackColor] andTextalignment:NSTextAlignmentCenter];
        [self addSubview:self.lblTodo];
        self.picture = [UIElementFactory createButtonWithImageName:@"btn_picture" andPoint:CGPointMake(129, 420)];
        [self addSubview:self.picture];
        self.klaar = [UIElementFactory createButtonWithImageName:@"klaar" andPoint:CGPointMake(135, 432)];
    }
    return self;
}

- (void)changeLblTodoWithText:(NSString*)text{
    [self.lblTodo removeFromSuperview];
    self.lblTodo = [UIElementFactory createLabelWithFont:CORKI andSize:20 andText:text andFrame:CGRectMake(55, 342, 210, 0) andColor:[UIColor blackColor] andTextalignment:NSTextAlignmentCenter];
    [self addSubview:self.lblTodo];
}

- (void)createVideo{
    NSString *movName = @"upload";
    NSString* outputPath = [[NSBundle mainBundle] pathForResource:movName ofType:@"mp4"];
    NSLog(@"%@",movName);
    
    self.videoController = [[MPMoviePlayerController alloc] init];
    self.videoController.movieSourceType = MPMovieSourceTypeFile;
    
    UIImage *placeholderimg = [UIImage imageNamed:@"placeholder01"];
    UIImageView *placeholder = [[UIImageView alloc]initWithImage:placeholderimg];
    
    NSURL *mov2 = [NSURL fileURLWithPath:outputPath];
    [self.videoController setContentURL:mov2];
    [self.videoController.view setFrame:CGRectMake (25, 118, 270, 245)];
    self.videoController.controlStyle = MPMovieControlStyleNone;
    self.videoController.repeatMode = YES;
    [self.videoController.backgroundView addSubview:placeholder];
    [self addSubview:self.videoController.view];
    
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
