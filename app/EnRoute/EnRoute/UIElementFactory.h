//
//  UIElementFactory.h
//  EnRoute
//
//  Created by Thomas Verleye on 8/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIElementFactory : NSObject
+(UIButton *)createButtonWithImageName:(NSString*)image andPoint:(CGPoint)point;
+(UILabel*)createLabelWithFont:(NSString*)fontName andSize:(int)size andText:(NSString*)text andFrame:(CGRect)frame andColor:(UIColor*)color andTextalignment:(NSTextAlignment)alignment;
+(UITextField*)createTextFieldWithText:(NSString*)text andPoint:(CGPoint)point;
@end
