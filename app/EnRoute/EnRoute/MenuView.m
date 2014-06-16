//
//  MenuView.m
//  EnRoute
//
//  Created by Quinten Delahaye on 05/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "MenuView.h"

@implementation MenuView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor colorWithRed:230/250.0f green:234/250.0f blue:198/250.0f alpha:1];
        
        UIImage *logOutImage = [UIImage imageNamed:@"afmeldKnop"];
        self.afmeldKnop = [UIElementFactory createButtonWithImageName:@"afmeldKnop" andPoint:CGPointMake(0, self.frame.size.height - logOutImage.size.height)];
        [self addSubview:self.afmeldKnop];
        
        [self.afmeldKnop addTarget:self action:@selector(logOutTapped:) forControlEvents:UIControlEventTouchUpInside];
        
        UIImage *menuTutorial = [UIImage imageNamed:@"menu_tutorial"];
        self.btnHandleiding = [UIElementFactory createButtonWithImageName:@"menu_tutorial" andPoint:CGPointMake(0, self.afmeldKnop.frame.origin.y - menuTutorial.size.height +4)];
        [self addSubview:self.btnHandleiding];
        
        UIImage *legende = [UIImage imageNamed:@"menu_legende"];
        self.btnMap = [UIElementFactory createButtonWithImageName:@"menu_legende" andPoint:CGPointMake(0, self.self.btnHandleiding.frame.origin.y - legende.size.height +4)];
        [self addSubview:self.btnMap];
        
    }
    return self;
}

-(void)logOutTapped:(id)sender{

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Afmelden"
                                                    message:@"weet je zeker dat je wilt afmelden?"
                                                   delegate:self
                                          cancelButtonTitle:@"Nee"
                                          otherButtonTitles:@"Ja",nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"Button Index =%ld",(long)buttonIndex);
    if (buttonIndex == 0)
    {
        NSLog(@"You have clicked Cancel");
        [[NSNotificationCenter defaultCenter] postNotificationName:@"LOGOUT_CANCEL_TAPPED" object:self];
    }
    else if(buttonIndex == 1)
    {
        NSLog(@"You have clicked JA");
        [[NSNotificationCenter defaultCenter] postNotificationName:@"LOGOUT_TAPPED" object:self];
    }
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
