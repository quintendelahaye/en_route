//
//  UnlockedView.h
//  EnRoute
//
//  Created by Thomas Verleye on 9/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIElementFactory.h"

@interface UnlockedView : UIView

@property (nonatomic, strong) UIButton *mode;
@property (nonatomic, strong) UIButton *kunst;

@property (nonatomic, strong) UIButton *gaverder;

- (id)initWithFrame:(CGRect)frame andText:(NSString*)text andLast:(BOOL)last;

@end
