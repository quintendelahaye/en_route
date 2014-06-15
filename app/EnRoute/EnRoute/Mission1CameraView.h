//
//  Mission1CameraView.h
//  EnRoute
//
//  Created by Thomas Verleye on 8/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIElementFactory.h"
#import "UIColor+Extentions.h"

@interface Mission1CameraView : UIView

@property (nonatomic, strong) UIButton *picture;
@property (nonatomic, strong) UIButton *back;
@property (nonatomic, strong) UIImageView *part1;
@property (nonatomic, strong) UIImageView *part2;
@property (nonatomic, strong) UILabel *lblTime;

- (id)initWithFrame:(CGRect)frame andPart:(int)part;

@end
