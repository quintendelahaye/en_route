//
//  RecordView.h
//  EnRoute
//
//  Created by Thomas Verleye on 13/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIElementFactory.h"

@interface RecordView : UIView

@property (nonatomic, strong) UIImageView *bg;
@property (nonatomic, strong) UIButton *record;
@property (nonatomic, strong) UILabel *word;

- (id)initWithFrame:(CGRect)frame andWord:(NSString*)word;

@end
