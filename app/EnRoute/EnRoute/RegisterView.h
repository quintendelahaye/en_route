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

@property (strong,nonatomic)UIImageView *background;

@property (strong,nonatomic)UITextField *txtUsername;
@property (strong,nonatomic)UITextField *txtPassword;
@property (strong,nonatomic)UITextField *txtGroupName;
@property (nonatomic, strong) UITextField *textfieldMember;
@property (nonatomic,strong)UILabel *explanation;

@property (strong,nonatomic)UIButton *btnRegist;
@property (nonatomic, strong) UIButton *btnAdd;
@property (nonatomic, strong) UIScrollView *scrollView;

-(void)showError;
-(void)showAddMembersWithGroupname:(NSString*)name;


@end
