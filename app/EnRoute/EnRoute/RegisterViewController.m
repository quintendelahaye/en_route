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

        self.navigationItem.backBarButtonItem = nil;
        UIImage *temp = [[UIImage imageNamed:@"backButton"] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
        UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithImage:temp style:UIBarButtonItemStyleBordered target:self action:@selector(backButtonTapped:)];
        self.navigationItem.leftBarButtonItem = barButtonItem;
        
    }
    return self;
}

-(void)backButtonTapped:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    
    [self.view.btnLogin addTarget:self action:@selector(loginTapped:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)loginTapped:(id)sender{ 
//    NSLog(@"[LoginViewController] login tapped");
    
    if([self.view.txtUsername.text length] != 0 && [self.view.txtPassword.text length] != 0 && [self.view.txtGroupName.text length] != 0){
        
        NSLog(@"[RegisterViewController] login correct");
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        NSDictionary *parameters = @{@"groupname": self.view.txtUsername.text,
                                     @"password":self.view.txtPassword.text};
        [manager POST:@"http://localhost/MAIV/en_route/site/api/groups" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
//            NSLog(@"JSON: %@", responseObject);
            
            [[NSUserDefaults standardUserDefaults]setObject:[responseObject objectForKey:@"groupname"] forKey:@"loggedInGroup"];
//            [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"isUserLoggedIn"];
//            [[NSUserDefaults standardUserDefaults] synchronize];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"LOGIN_CHANGED" object:self];
            
            StartScreenViewController *startscreenVC = [[StartScreenViewController alloc] initWithNibName:nil bundle:nil];
            [startscreenVC.view loggedInWithUser:[responseObject objectForKey:@"groupname"]];
            [self.navigationController pushViewController:startscreenVC animated:YES];
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            NSLog(@"Error: %@", error);
//            [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"isUserLoggedIn"];
            [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"loggedInGroup"];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"LOGIN_CHANGED" object:self];
//            [[NSUserDefaults standardUserDefaults] synchronize];
            
        }];
        
        
        
        [self.view.txtUsername removeFromSuperview];
        [self.view.txtPassword removeFromSuperview];
        [self.view.txtGroupName removeFromSuperview];
        [self.view.btnLogin removeFromSuperview];
        [self.view.background removeFromSuperview];
        
    }else{
        NSLog(@"[RegisterViewController] login incorrect");
        [self.view showError];
    }
    
    [[NSUserDefaults standardUserDefaults] synchronize];

    
}

-(void)dismissKeyboard {
    [self.view.txtPassword resignFirstResponder];
    [self.view.txtGroupName resignFirstResponder];
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
