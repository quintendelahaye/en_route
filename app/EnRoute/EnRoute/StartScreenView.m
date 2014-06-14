//
//  StartScreenView.m
//  EnRoute
//
//  Created by Quinten Delahaye on 01/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "StartScreenView.h"

@implementation StartScreenView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor colorWithRed:244/250.0f green:234/250.0f blue:198/250.0f alpha:1];
        
        UIImage *logo = [UIImage imageNamed:@"en_route_logo"];
        UIImageView *logoView = [[UIImageView alloc] initWithImage:logo];
        logoView.frame = CGRectMake(self.frame.size.width/2 - logo.size.width/2, 100, logo.size.width, logo.size.height);
        [self addSubview:logoView];
        
        [self createButtons];
        [self createBackground];
        
//        UIImage *logOutImage = [UIImage imageNamed:@"afmeldKnop"];
//        self.afmeldKnop = [[UIButton alloc] init];
//        self.afmeldKnop.frame = CGRectMake(0, self.frame.size.height - logOutImage.size.height, logOutImage.size.width, logOutImage.size.height);
//        [self.afmeldKnop setImage:logOutImage forState:UIControlStateNormal];
//        [self addSubview:self.afmeldKnop];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dismissMenu:) name:@"LOGOUT_CANCEL_TAPPED" object:nil];
        // DEALLOC?
        
    }
    return self;
}

-(void)createBackground{
    UIImageView *startImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img_start"]];
    startImg.frame = CGRectMake(self.frame.size.width/2 - startImg.frame.size.width/2, 30, startImg.frame.size.width, startImg.frame.size.height);
    [self addSubview:startImg];
    
    self.lblTitel = [[UILabel alloc] initWithFrame:CGRectMake(65, startImg.frame.origin.y + startImg.frame.size.height/2 + 120, 400, 50)];
    self.lblTitel.text = @"OUD & NIEUW";
    self.lblTitel.font = [UIFont fontWithName:CORKI size:50];
    [self addSubview:self.lblTitel];
    
    self.lblTeamName = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width/2 - startImg.frame.size.width/2, startImg.frame.origin.y + startImg.frame.size.height/2 + 46, startImg.frame.size.width, 50)];
    self.lblTeamName.text = @"teamnaam enzo";
    self.lblTeamName.textAlignment = NSTextAlignmentCenter;
    self.lblTeamName.font = [UIFont fontWithName:BEBAS size:30];
    self.lblTeamName.textColor = [UIColor colorWithRed:244/250.0f green:234/250.0f blue:198/250.0f alpha:1];
    [self addSubview:self.lblTeamName];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 3)];
    line.backgroundColor = [UIColor blackColor];
    [self addSubview:line];
}

-(void)createButtons{
    self.btnHandleiding = [UIElementFactory createButtonWithImageName:@"handleidingKnop" andPoint:CGPointMake(20, 320)];
    [self addSubview:self.btnHandleiding];
    
    self.btnStart = [UIElementFactory createButtonWithImageName:@"startKnop" andPoint:CGPointMake(20, self.btnHandleiding.frame.origin.y + self.btnHandleiding.frame.size.height + 20 )];
    [self addSubview:self.btnStart];
    
}

-(void)loggedInWithUser:(NSString*)user{
    self.lblTitel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    self.lblTitel.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    self.lblTitel.text = [NSString stringWithFormat:@"Logged in as %@",user];
    [self addSubview:self.lblTitel];
}

/*-(void)showMenu{
    CGRect bounds = [[UIScreen mainScreen] bounds];
    self.menu = [[MenuView alloc] initWithFrame:bounds];
    [self addSubview:self.menu];
    self.menu.frame = CGRectMake(0, -self.frame.size.height, self.frame.size.width, self.frame.size.height);
    [UIView animateWithDuration:0.5 animations:^{
        self.menu.frame = CGRectMake(0, -150, self.frame.size.width, self.frame.size.height);
    }];
}*/

-(void)dismissMenu:(id)sender{
    [UIView animateWithDuration:0.5 animations:^{
        self.menu.frame = CGRectMake(0, -self.frame.size.height, self.frame.size.width, self.frame.size.height);
    }completion:^(BOOL finished) {
        [self.menu removeFromSuperview];
    }];
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
