//
//  RegisterView.h
//  EnRoute
//
//  Created by Quinten Delahaye on 01/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIElementFactory.h"
#import "TitleView.h"

@interface RegisterView : UIView

@property (strong,nonatomic)UITextField *txtUsername;
@property (strong,nonatomic)UITextField *txtPassword;
@property (strong,nonatomic)UITextField *txtGroupName;
@property (nonatomic, strong) UITextField *textfieldMember;
@property (nonatomic,strong)UILabel *explanation;

@property (strong,nonatomic)UIButton *btnRegist;
@property (nonatomic, strong) UIButton *btnAdd;
@property (nonatomic, strong) UIButton *btnStart;
@property (nonatomic, strong) UIScrollView *scrollView;


@property (nonatomic, strong) UIView *feedbackMessage1;
@property (nonatomic, strong) UIView *feedbackMessage2;
@property (nonatomic, strong) UIView *feedbackMessage3;

-(void)hideGroup;
-(void)showGroup;
-(void)hideUser;
-(void)showUser;
-(void)hidePw;
-(void)showPw;
-(void)showAddMembersWithGroupname:(NSString*)name;


@end
