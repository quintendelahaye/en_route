//
//  RegisterViewController.m
//  EnRoute
//
//  Created by Quinten Delahaye on 01/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "RegisterViewController.h"
#import "StartScreenViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        NSLog(@"[RegisterViewController] init");
        self.title = @"Register";
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    [self.view.btnLogin addTarget:self action:@selector(loginTapped:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)loginTapped:(id)sender{
    NSLog(@"[LoginViewController] login tapped");
    if([self.view.txtUsername.text length] != 0 && [self.view.txtPassword.text length] != 0 && [self.view.txtPassword2.text length] != 0 && [self.view.txtPassword.text isEqualToString:self.view.txtPassword2.text]){
        
        NSLog(@"[RegisterViewController] login correct");
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        NSDictionary *parameters = @{@"groupname": self.view.txtUsername.text,
                                     @"password":self.view.txtPassword.text};
        [manager POST:@"http://localhost/MAIV/en_route/site/api/users" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"JSON: %@", responseObject);
            [[NSUserDefaults standardUserDefaults]setObject:[responseObject objectForKey:@"groupname"] forKey:@"loggedInUser"];
            [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"isUserLoggedIn"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"LOGIN_CHANGED" object:self];
            StartScreenViewController *startscreenVC = [[StartScreenViewController alloc] initWithNibName:nil bundle:nil];
            [startscreenVC.view loggedInWithUser:[responseObject objectForKey:@"groupname"]];
            [self.navigationController pushViewController:startscreenVC animated:YES];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Error: %@", error);
            [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"isUserLoggedIn"];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"LOGIN_CHANGED" object:self];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }];
        
        [self.view.txtUsername removeFromSuperview];
        [self.view.txtPassword removeFromSuperview];
        [self.view.txtPassword2 removeFromSuperview];
        [self.view.btnLogin removeFromSuperview];
        [self.view.background removeFromSuperview];
        
    }else{
        NSLog(@"[RegisterViewController] login incorrect");
        [self.view showError];
    }
}

-(void)dismissKeyboard {
    [self.view.txtPassword resignFirstResponder];
    [self.view.txtPassword2 resignFirstResponder];
    [self.view.txtUsername resignFirstResponder];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadView{
    CGRect bounds = [[UIScreen mainScreen]bounds];
    self.view = [[RegisterView alloc] initWithFrame:bounds];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
