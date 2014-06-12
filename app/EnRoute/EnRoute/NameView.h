//
//  NameView.h
//  EnRoute
//
//  Created by Thomas Verleye on 10/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+Extentions.h"
#import "UIElementFactory.h"

@interface NameView : UIView

@property (nonatomic, strong) UIButton *dropdown;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIButton *btnStart;
- (void)createScrollView;
- (void)createStart;
@end
