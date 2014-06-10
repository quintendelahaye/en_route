//
//  StartScreenView.h
//  EnRoute
//
//  Created by Quinten Delahaye on 01/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuView.h"
#import "UIElementFactory.h"

@interface StartScreenView : UIView

@property (strong,nonatomic)UIButton *btnStart;
@property (strong,nonatomic)UIButton *btnHandleiding;
@property (strong,nonatomic)UILabel *lblTitel;
@property (strong,nonatomic)UILabel *lblTeamName;
-(void)loggedInWithUser: (NSString*)user;
@property (strong,nonatomic)UIButton *afmeldKnop;
@property (strong,nonatomic)MenuView *menu;
-(void)showMenu;
@end
