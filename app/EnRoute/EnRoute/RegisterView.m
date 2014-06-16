//
//  RegisterView.m
//  EnRoute
//
//  Created by Quinten Delahaye on 01/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "RegisterView.h"

@implementation RegisterView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor colorWithRed:244/250.0f green:234/250.0f blue:198/250.0f alpha:1];        
        [self createBackground];
        [self createTextfields];
        [self createButton];
        [self createHints];
    }
    return self;
}

-(void)createBackground{
    
    //tekst - label
    NSString *text = @"Maak een groepsaccount aan en vul je eigen naam in";
    self.explanation = [UIElementFactory createLabelWithFont:CORKI andSize:20 andText:text andFrame:CGRectMake(45, 40, 230, 0) andColor:[UIColor blackColor] andTextalignment:NSTextAlignmentCenter];
    [self addSubview:self.explanation];
    
    //blocks
    UIImage *block1 = [UIImage imageNamed:@"redBlock"];
    UIImageView *redBlock1 = [[UIImageView alloc]initWithFrame:CGRectMake(20, self.explanation.frame.origin.y + 3, block1.size.width, block1.size.height)];
    redBlock1.image = block1;
    [self addSubview:redBlock1];
    
    UIImage *block2 = [UIImage imageNamed:@"redBlock"];
    UIImageView *redBlock2 = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width - block2.size.width - 20, self.explanation.frame.origin.y + 3, block2.size.width, block2.size.height)];
    redBlock2.image = block2;
    [self addSubview:redBlock2];
}

-(void)createTextfields{
    
    self.txtGroupName = [UIElementFactory createTextFieldWithText:@"groepsnaam" andPoint:CGPointMake(20,  100)];
    [self addSubview:self.txtGroupName];
    
    self.txtUsername = [UIElementFactory createTextFieldWithText:@"eigen Naam" andPoint:CGPointMake(20, self.txtGroupName.frame.origin.y + 72)];
    [self addSubview:self.txtUsername];
    
    self.txtPassword = [UIElementFactory createTextFieldWithText:@"wachtwoord" andPoint:CGPointMake(20,  self.txtUsername.frame.origin.y + 72)];
    self.txtPassword.secureTextEntry = YES;
    [self addSubview:self.txtPassword];
    
    [self.txtUsername addTarget:self action:@selector(textFieldUserNameActive:) forControlEvents:UIControlEventEditingDidBegin];
    [self.txtGroupName addTarget:self action:@selector(textFieldGroupNameActive:) forControlEvents:UIControlEventEditingDidBegin];
    [self.txtPassword addTarget:self action:@selector(textFieldPasswordActive:) forControlEvents:UIControlEventEditingDidBegin];
}

-(void)createHints{
    UIImage *fbBG = [UIImage imageNamed:@"feedbackBg"];
    self.feedbackMessage1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, fbBG.size.width, fbBG.size.height)];
    self.feedbackMessage1.center = self.txtGroupName.center;
    self.feedbackMessage1.backgroundColor = [UIColor colorWithPatternImage:fbBG];
    UILabel *message1 = [UIElementFactory createLabelWithFont:CORKI andSize:13 andText:@"De groepsnaam moet min. 6 letters bevatten." andFrame:CGRectMake(11, 3, fbBG.size.width, 0) andColor:[UIColor blackColor] andTextalignment:NSTextAlignmentLeft];
    [self.feedbackMessage1 addSubview:message1];
    [self addSubview:self.feedbackMessage1];
    [self sendSubviewToBack:self.feedbackMessage1];
    
    self.feedbackMessage2 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, fbBG.size.width, fbBG.size.height)];
    self.feedbackMessage2.center = self.txtUsername.center;
    self.feedbackMessage2.backgroundColor = [UIColor colorWithPatternImage:fbBG];
    UILabel *message2 = [UIElementFactory createLabelWithFont:CORKI andSize:13 andText:@"Je naam moet min. 2 letters bevatten." andFrame:CGRectMake(11, 3, fbBG.size.width, 0) andColor:[UIColor blackColor] andTextalignment:NSTextAlignmentLeft];
    [self.feedbackMessage2 addSubview:message2];
    [self addSubview:self.feedbackMessage2];
    [self sendSubviewToBack:self.feedbackMessage2];
    
    self.feedbackMessage3 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, fbBG.size.width, fbBG.size.height)];
    self.feedbackMessage3.center = self.txtPassword.center;
    self.feedbackMessage3.backgroundColor = [UIColor colorWithPatternImage:fbBG];
    UILabel *message3 = [UIElementFactory createLabelWithFont:CORKI andSize:13 andText:@"Het wachtwoord moet min. 4 karakters bevatten." andFrame:CGRectMake(11, 3, fbBG.size.width, 0) andColor:[UIColor blackColor] andTextalignment:NSTextAlignmentLeft];
    [self.feedbackMessage3 addSubview:message3];
    [self addSubview:self.feedbackMessage3];
    [self sendSubviewToBack:self.feedbackMessage3];
}

-(void)textFieldUserNameActive:(id)sender{
    [self showUser];
    [self hideGroup];
    [self hidePw];
}

-(void)textFieldGroupNameActive:(id)sender{
    [self hideUser];
    [self showGroup];
    [self hidePw];
}

-(void)textFieldPasswordActive:(id)sender{
    [self hideUser];
    [self hideGroup];
    [self showPw];
}

-(void)hideGroup{
    [UIView animateWithDuration:.2 animations:^{
        self.feedbackMessage1.center = self.txtGroupName.center;
    }];
}

-(void)showGroup{
    [UIView animateWithDuration:.2 animations:^{
        self.feedbackMessage1.center = CGPointMake(self.txtGroupName.center.x, self.txtGroupName.center.y + (self.feedbackMessage1.frame.size.height)+12);
    }];
}

-(void)hideUser{
    [UIView animateWithDuration:.2 animations:^{
        self.feedbackMessage2.center = self.txtUsername.center;
    }];
}

-(void)showUser{
    [UIView animateWithDuration:.2 animations:^{
        self.feedbackMessage2.center = CGPointMake(self.txtUsername.center.x, self.txtUsername.center.y + (self.feedbackMessage2.frame.size.height)+12);
    }];
}

-(void)hidePw{
    [UIView animateWithDuration:.2 animations:^{
        self.feedbackMessage3.center = self.txtPassword.center;
    }];
}

-(void)showPw{
    [UIView animateWithDuration:.2 animations:^{
        self.feedbackMessage3.center = CGPointMake(self.txtPassword.center.x, self.txtPassword.center.y + (self.feedbackMessage3.frame.size.height)+12);
    }];
}



-(void)createButton{
    
    self.btnRegist = [UIElementFactory createButtonWithImageName:@"registreerKnop" andPoint:CGPointMake(20, self.txtPassword.frame.origin.y + self.txtPassword.frame.size.height + 20 )];
    [self addSubview:self.btnRegist];
}

/*-(void)showError{
    [UIView animateWithDuration:.2 animations:^{
        self.btnRegist.backgroundColor = [UIColor colorWithRed:200/255.0f green:0/255.0f blue:0/255.0f alpha:0.6];
    }];
}*/

-(void)showAddMembersWithGroupname:(NSString*)name{
    [self.explanation removeFromSuperview];
    [self.txtGroupName removeFromSuperview];
    [self.txtUsername removeFromSuperview];
    [self.txtPassword removeFromSuperview];
    [self.btnRegist removeFromSuperview];
    [self.feedbackMessage1 removeFromSuperview];
    [self.feedbackMessage2 removeFromSuperview];
    [self.feedbackMessage3 removeFromSuperview];
    
    TitleView *title = [[TitleView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 29) andTitle:name];
    [self addSubview:title];
    
    NSString *text = @"Voeg mensen toe aan je team";
    self.explanation = [UIElementFactory createLabelWithFont:CORKI andSize:20 andText:text andFrame:CGRectMake(75, 40, 190, 0) andColor:[UIColor blackColor] andTextalignment:NSTextAlignmentCenter];
    [self addSubview:self.explanation];
    
    UIImage *titleImg = [UIImage imageNamed:@"title_toegevoegd"];
    UIImageView *titleToegevoegd = [[UIImageView alloc]initWithFrame:CGRectMake(20, 90, titleImg.size.width, titleImg.size.height)];
    titleToegevoegd.image = titleImg;
    [self addSubview:titleToegevoegd];
    
    //scrollview enzo
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(20, 122, 277, 402)];
    [self addSubview:self.scrollView];
    
    UIImage *textFieldImage = [UIImage imageNamed:@"bg_textfield_persoon"];
    
    self.textfieldMember = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 203, 50)];
    self.textfieldMember.placeholder = @"NAAM";
    self.textfieldMember.background = textFieldImage;
    self.textfieldMember.font = [UIFont fontWithName:BEBAS size:20];
    self.textfieldMember.textAlignment = NSTextAlignmentCenter;
    
    [self.scrollView addSubview:self.textfieldMember];
    
    self.btnAdd = [UIElementFactory createButtonWithImageName:@"btn_plus" andPoint:CGPointMake(213, 0)];
    [self.scrollView addSubview:self.btnAdd];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
