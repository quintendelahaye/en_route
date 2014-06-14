//
//  Mission3View.h
//  EnRoute
//
//  Created by Thomas Verleye on 14/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIElementFactory.h"
#import "UIColor+Extentions.h"

@interface Mission3View : UIView

@property (nonatomic, strong) UILabel *explanation;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UITextField *textfieldMember;
@property (nonatomic, strong) UIButton *btnAdd;
@property (nonatomic, strong) UIButton *btnStart;

@end
