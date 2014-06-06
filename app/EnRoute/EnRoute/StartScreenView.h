//
//  StartScreenView.h
//  EnRoute
//
//  Created by Quinten Delahaye on 01/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuView.h"

@interface StartScreenView : UIView

@property (strong,nonatomic)UIButton *btnLogin;
@property (strong,nonatomic)UIButton *btnRegister;
@property (strong,nonatomic)UILabel *lblTitel;
-(void)loggedInWithUser: (NSString*)user;
@property (strong,nonatomic)UIButton *afmeldKnop;
@property (strong,nonatomic)MenuView *menu;
-(void)showMenu;
@end
