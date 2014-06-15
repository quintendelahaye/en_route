//
//  TimeChallengeExplanationView.h
//  EnRoute
//
//  Created by Thomas Verleye on 15/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIElementFactory.h"
#import "UIColor+Extentions.h"

@interface TimeChallengeExplanationView : UIView

@property (nonatomic, strong) UILabel *head;
@property (nonatomic, strong) UILabel *explanation;
@property (nonatomic, strong) UILabel *remark;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIButton *btnStart;

- (id)initWithFrame:(CGRect)frame andHead:(NSString*)head andExplanation:(NSString*)explanation andRemark:(NSString*)remark andImage:(UIImage*)image;

@end
