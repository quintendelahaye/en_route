//
//  Mainview.h
//  EnRoute
//
//  Created by Quinten Delahaye on 01/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LogoView.h"
#import "UIElementFactory.h"

@interface Mainview : UIView

@property (strong,nonatomic)UIButton *btnLogin;
@property (strong,nonatomic)UIButton *btnRegister;
@property (strong,nonatomic)LogoView *logoView;
@property (strong,nonatomic)UIImageView *background;
@property (strong,nonatomic)CALayer *imageLayer;
@property (strong,nonatomic)CALayer *maskLayer;
@property (strong,nonatomic)UILabel *lblTitel;

@end
