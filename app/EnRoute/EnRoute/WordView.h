//
//  WordView.h
//  EnRoute
//
//  Created by Thomas Verleye on 12/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIElementFactory.h"

@interface WordView : UIView

@property (nonatomic, strong) UIButton *word;
@property (nonatomic, strong) UIButton *remove;
@property (nonatomic, assign) int part;

- (id)initWithFrame:(CGRect)frame andPart:(int)part;
- (void)showRemove;
- (void)hideRemove;

@end
