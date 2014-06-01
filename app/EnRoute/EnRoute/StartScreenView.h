//
//  StartScreenView.h
//  EnRoute
//
//  Created by Quinten Delahaye on 01/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StartScreenView : UIView

@property (strong,nonatomic)UIButton *btnLogin;
@property (strong,nonatomic)UIButton *btnRegister;
@property (strong,nonatomic)UILabel *lblTitel;
-(void)loggedInWithUser:(NSString*)user;
@end
