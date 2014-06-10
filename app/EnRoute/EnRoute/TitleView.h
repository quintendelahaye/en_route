//
//  TitleView.h
//  EnRoute
//
//  Created by Thomas Verleye on 8/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+Extentions.h"

@interface TitleView : UIView

@property (nonatomic, strong) UILabel *lblTitle;
- (id)initWithFrame:(CGRect)frame andTitle:(NSString*)title;
@end
