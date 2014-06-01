//
//  LoginViewController.m
//  EnRoute
//
//  Created by Quinten Delahaye on 01/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        NSLog(@"[LoginViewController] init");
        self.title = @"Login";
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view.btnLogin addTarget:self action:@selector(loginTapped:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadView{
    CGRect bounds = [[UIScreen mainScreen]bounds];
    self.view = [[LoginView alloc] initWithFrame:bounds];
}


-(void)loginTapped:(id)sender{
    NSLog(@"[LoginViewController] login tapped");
    if([self.view.txtUsername.text length] != 0 && [self.view.txtPassword.text length] != 0){
        
        NSLog(@"[LoginViewController] login not empty");
        
        NSString *path = [NSString stringWithFormat:@"http://localhost/MAIV/en_route/site/api/users/%@/%@",self.view.txtUsername.text, self.view.txtPassword.text];
        NSURL *url = [NSURL URLWithString:path];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        //        NSLog(@"[LoginViewController] groupname = %@ and password = %@",self.view.txtUsername.text, self.view.txtPassword.text);
        NSLog(@"[LoginViewController] url = %@",path);
        
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
        operation.responseSerializer = [AFJSONResponseSerializer serializer];
        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation,id responseObject){
            NSLog(@"loaded data = %@",responseObject);
            if([responseObject count] == 0){
                [self.view showError];
                [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"isUserLoggedIn"];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"LOGIN_CHANGED" object:self];
            }else{
                NSLog(@"dict = %@",[responseObject objectForKey:@"groupname"]);
                [[NSUserDefaults standardUserDefaults]setObject:[responseObject objectForKey:@"groupname"] forKey:@"loggedInUser"];
                [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"isUserLoggedIn"];
                [[NSUserDefaults standardUserDefaults] synchronize];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"LOGIN_CHANGED" object:self];
                StartScreenViewController *startScreenVC = [[StartScreenViewController alloc] initWithNibName:nil bundle:nil];
                [startScreenVC.view loggedInWithUser:[responseObject objectForKey:@"groupname"]];
                [self.navigationController pushViewController:startScreenVC animated:YES];
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error){
            NSLog(@"error loading data");
            [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"isUserLoggedIn"];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"LOGIN_CHANGED" object:self];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }];
        [operation start];
        
    }else{
        NSLog(@"[LoginViewController] login incorrect");
        [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"isUserLoggedIn"];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"LOGIN_CHANGED" object:self];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [self.view showError];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(void) viewWillDisappear:(BOOL)animated {
    if ([self.navigationController.viewControllers indexOfObject:self]==NSNotFound) {
        // back button was pressed.  We know this is true because self is no longer
        // in the navigation stack.
    }
    [super viewWillDisappear:animated];
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
