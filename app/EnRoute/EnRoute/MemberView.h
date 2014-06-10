//
//  MemberView.h
//  EnRoute
//
//  Created by Thomas Verleye on 10/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIElementFactory.h"
#import "UIColor+Extentions.h"

@interface MemberView : UIView

@property (nonatomic, strong) UILabel *lblNaam;
@property (nonatomic, strong) NSString *name;

- (id)initWithName:(NSString*)name andCGPoint:(CGPoint)point;

@end
