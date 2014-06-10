//
//  MenuView.h
//  EnRoute
//
//  Created by Quinten Delahaye on 05/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIElementFactory.h"

@interface MenuView : UIView<UIAlertViewDelegate>

@property (strong,nonatomic)UIButton *afmeldKnop;
@property (nonatomic, assign)id<UIAlertViewDelegate>delegate;

@property(nonatomic, strong)UIButton *btnMap;
@property(nonatomic, strong)UIButton *btnHandleiding;
@property(nonatomic, strong)UIButton *btnWerken;
@property(nonatomic, strong)UIButton *btnstop;

@end
