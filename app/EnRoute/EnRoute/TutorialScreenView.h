//
//  TutorialScreenView.h
//  EnRoute
//
//  Created by Thomas Verleye on 11/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIElementFactory.h";

@interface TutorialScreenView : UIView

@property (nonatomic, strong) UILabel *head;
@property (nonatomic, strong) UILabel *explanation;

- (void)createHead:(NSString*)head andExplanation:(NSString*)explanation andImagename:(NSString*)imagename;

@end
