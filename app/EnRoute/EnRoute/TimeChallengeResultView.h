//
//  TimeChallengeResultView.h
//  EnRoute
//
//  Created by Thomas Verleye on 15/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIElementFactory.h"
#import "UIColor+Extentions.h"

@interface TimeChallengeResultView : UIView

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIButton *redo;
@property (nonatomic, strong) UIButton *ok;
@property (nonatomic, strong) UILabel *lblTime;

@end
