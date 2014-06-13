//
//  Mission2View.h
//  EnRoute
//
//  Created by Thomas Verleye on 12/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+Extentions.h"
#import "WordView.h"
#import "UIElementFactory.h";

@interface Mission2View : UIView

@property (nonatomic, strong) WordView *word1;
@property (nonatomic, strong) WordView *word2;
@property (nonatomic, strong) WordView *word3;
@property (nonatomic, strong) UILabel *lblTodo;
@property (nonatomic, strong) UIButton *picture;
@property (nonatomic, strong) UIImageView *capturedPicture;
@property (nonatomic, strong) UIImageView *bg;

- (void)changeLblTodoWithText:(NSString*)text;

@end
