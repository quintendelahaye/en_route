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
        
        [self createButtons];
        
        self.backgroundColor = [UIColor colorWithRed:230/250.0f green:234/250.0f blue:198/250.0f alpha:1];
        
        UIImage *logOutImage = [UIImage imageNamed:@"afmeldKnop"];
        self.afmeldKnop = [[UIButton alloc] init];
        [self.afmeldKnop setImage:logOutImage forState:UIControlStateNormal];
        self.afmeldKnop.frame = CGRectMake(0, self.frame.size.height - logOutImage.size.height, logOutImage.size.width, logOutImage.size.height);
        [self addSubview:self.afmeldKnop];
        
        [self.afmeldKnop addTarget:self action:@selector(logOutTapped:) forControlEvents:UIControlEventTouchUpInside];
        
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

-(void)createButtons{
    self.btnMap = [UIElementFactory createButtonWithImageName:@"btnMenuMap" andPoint:CGPointMake(20, 30 )];
    [self addSubview:self.btnMap];
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
