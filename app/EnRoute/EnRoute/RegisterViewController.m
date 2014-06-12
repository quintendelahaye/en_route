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
    
    [self.view.btnRegist addTarget:self action:@selector(registTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    //title ---------
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navControllerTitel"] forBarMetrics:UIBarMetricsDefault];
    CGRect bounds = [UIScreen mainScreen].bounds;

    self.titleView = [[TitleView alloc]initWithFrame:CGRectMake(0, 0, bounds.size.width, 29) andTitle:@"registreren"];
    [self.view addSubview:self.titleView];
    self.navigationItem.hidesBackButton = YES;
}



-(void)registTapped:(id)sender{
//    NSLog(@"[LoginViewController] login tapped");
    
    if([self.view.txtUsername.text length] != 0 && [self.view.txtPassword.text length] != 0 && [self.view.txtGroupName.text length] != 0){
        
        NSLog(@"[RegisterViewController] login correct");
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        NSDictionary *parameters = @{@"groupname": self.view.txtGroupName.text,
                                     @"password":self.view.txtPassword.text};
        [manager POST:@"http://169.254.216.138/MAIV/en_route/site/api/groups" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"JSON: %@", [responseObject objectForKey:@"id"]);
            NSString *groupid = [NSString stringWithFormat:@"%@",[responseObject objectForKey:@"id"]];
            NSDictionary *parameters = @{@"groupid": groupid, @"user":self.view.txtUsername.text};
            NSLog(@"parameters: %@", parameters);
            
            AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
            [manager POST:@"http://169.254.216.138/MAIV/en_route/site/api/user" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
                NSLog(@"DEUTSCHLAND");
                NSLog(@"JSON: %@", responseObject);
                [[NSUserDefaults standardUserDefaults]setObject:[responseObject objectForKey:@"id"] forKey:@"userid"];
                
            }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                NSLog(@"Error: %@", error);
            }];
            
            [[NSUserDefaults standardUserDefaults]setObject:[responseObject objectForKey:@"groupname"] forKey:@"loggedInGroup"];
            [[NSUserDefaults standardUserDefaults]setObject:[responseObject objectForKey:@"id"] forKey:@"groupid"];
            
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            self.navigationItem.leftBarButtonItem = nil;
            [self.view showAddMembersWithGroupname:[responseObject objectForKey:@"groupname"]];
            [self.view.btnAdd addTarget:self action:@selector(addMember:) forControlEvents:UIControlEventTouchUpInside];
            self.members = [[NSMutableArray alloc]init];
            
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            NSLog(@"Error: %@", error);
            [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"isUserLoggedIn"];
            [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"loggedInGroup"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
        }];
        
    }else{
        NSLog(@"[RegisterViewController] login incorrect");
//        [self.view showError];
    }
    
    [[NSUserDefaults standardUserDefaults] synchronize];

    
}

- (void)addMember:(id)selector{
    if (self.view.textfieldMember.text && self.view.textfieldMember.text.length > 0)
    {
        /* empty - do something */
        NSLog(@"ddd");
        NSString *memberName = self.view.textfieldMember.text;
        [self.members addObject:memberName];
        int yPos = 57 * (self.members.count -1);
        MemberView *memberView = [[MemberView alloc]initWithName:memberName andCGPoint:CGPointMake(0, yPos)];
        [self.view.scrollView addSubview:memberView];
        [self.view.btnAdd setFrame:CGRectMake(self.view.btnAdd.frame.origin.x, yPos+63, self.view.btnAdd.frame.size.width, self.view.btnAdd.frame.size.height)];
        [self.view.textfieldMember setFrame:CGRectMake(0, yPos+63, self.view.textfieldMember.frame.size.width, self.view.textfieldMember.frame.size.height)];
        [self.view.btnStart setFrame:CGRectMake(0, yPos+130, self.view.btnStart.frame.size.width, self.view.btnStart.frame.size.height)];
        [self.view.textfieldMember setText:@""];
        [self.view.scrollView setContentSize:CGSizeMake(0, yPos +340)];
        if (self.members.count>2) {
            CGPoint bottomOffset = CGPointMake(0, self.view.scrollView.contentSize.height - self.view.scrollView.bounds.size.height);
            [self.view.scrollView setContentOffset:bottomOffset animated:YES];
        }
        if (self.members.count == 1) {
            self.view.btnStart = [UIElementFactory createButtonWithImageName:@"btn_start" andPoint:CGPointMake(0, yPos + 130)];
            [self.view.scrollView addSubview:self.view.btnStart];
            [self.view.btnStart addTarget:self action:@selector(startTapped:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
}

-(void)startTapped:(id)sender{
    NSLog(@"start");
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *groupid = [[NSUserDefaults standardUserDefaults]objectForKey:@"groupid"];
    NSDictionary *parameters = @{@"groupid": groupid,
                                 @"members": self.members};
    NSLog(@"parameters: %@",parameters);
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager POST:@"http://169.254.216.138/MAIV/en_route/site/api/users" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"success: %@",responseObject);
        [[NSNotificationCenter defaultCenter] postNotificationName:@"LOGIN_CHANGED" object:self];
        [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"isUserLoggedIn"];
        [self.navigationController popToRootViewControllerAnimated:NO];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

-(void)dismissKeyboard {
    [self.view.txtPassword resignFirstResponder];
    [self.view.txtGroupName resignFirstResponder];
    [self.view.txtUsername resignFirstResponder];
    [self.view.textfieldMember resignFirstResponder];
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
