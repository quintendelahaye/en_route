//
//  UIElementFactory.m
//  EnRoute
//
//  Created by Thomas Verleye on 8/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "UIElementFactory.h"

@implementation UIElementFactory

+(UIButton *)createButtonWithImageName:(NSString*)image andPoint:(CGPoint)point{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *imageButton = [UIImage imageNamed:image];
    [button setBackgroundImage:imageButton forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:[image stringByAppendingString:@"_Pushed"]] forState:UIControlStateHighlighted];
    [button setFrame:CGRectMake(point.x, point.y, imageButton.size.width,imageButton.size.height)];
    
    return button;
}

+(UILabel*)createLabelWithFont:(NSString*)fontName andSize:(int)size andText:(NSString*)text andFrame:(CGRect)frame andColor:(UIColor*)color andTextalignment:(NSTextAlignment)alignment{
    
    UIFont *font = [UIFont fontWithName:fontName size:size];
    CGRect textRect = [text boundingRectWithSize:frame.size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, textRect.size.width, textRect.size.height)];
    label.font = font;
    label.numberOfLines = 0;
    label.text = text;
    label.textColor = color;
    label.textAlignment = alignment;
    
    return label;
    
}

+(UITextField*)createTextFieldWithText:(NSString*)text andPoint:(CGPoint)point{
    
    UIImage *textFieldImage = [UIImage imageNamed:@"bg_login_big"];
    
    UITextField *textfield = [[UITextField alloc]initWithFrame:CGRectMake(point.x, point.y, 280, 49)];
    textfield.placeholder = text;
    textfield.background = textFieldImage;
    textfield.font = [UIFont fontWithName:BEBAS size:20];
    textfield.textAlignment = NSTextAlignmentCenter;
    return textfield;
}

@end
