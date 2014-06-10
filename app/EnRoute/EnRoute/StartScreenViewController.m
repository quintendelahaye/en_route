//
//  StartScreenViewController.m
//  EnRoute
//
//  Created by Quinten Delahaye on 01/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "StartScreenViewController.h"
#import "MainViewController.h"

@interface StartScreenViewController ()

@end

@implementation StartScreenViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        UIButton *button =  [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(menuTapped:)forControlEvents:UIControlEventTouchUpInside];
        [button setFrame:CGRectMake(0, 0, 25, 31)];
        UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:button];
        self.navigationItem.leftBarButtonItem = barButton;
        
        //self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:uibar target:self action:@selector(menuTapped:)];
        NSLog(@"is logged in --> %hhd",[[NSUserDefaults standardUserDefaults]boolForKey:@"isUserLoggedIn"]);
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(logout:) name:@"LOGOUT_TAPPED" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginChanged:) name:@"LOGIN_CHANGED" object:nil];
    }
    return self;
}

-(void)viewDidAppear:(BOOL)animated{
    self.view.lblTeamName.text = [[NSUserDefaults standardUserDefaults]objectForKey:@"loggedInGroup"];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navController"] forBarMetrics:UIBarMetricsDefault];
}

-(void)menuTapped:(id)sender{
    //[self.view showMenu];
    
    MenuViewController *menuVC = [[MenuViewController alloc] initWithNibName:nil bundle:nil];
    //[self.navigationController pushViewController:menuVC animated:NO];
    //[self presentViewController:menuVC animated:YES completion:^{}];
    [self addChildViewController:menuVC];
    [self.view addSubview:menuVC.view];
    [menuVC didMoveToParentViewController:self];
}

-(void)logout:(id)sender{
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"loggedInUser"];
    [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"isUserLoggedIn"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    MainViewController *mainVC = [[MainViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:mainVC animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view.btnStart addTarget:self action:@selector(startTour:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)startTour:(id)sender{
    NSLog(@"bla");
    TourViewController *tourVC = [[TourViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:tourVC animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadView{
    if ([[NSUserDefaults standardUserDefaults]boolForKey:@"isUserLoggedIn"] == 0) {
        MainViewController *mainVC = [[MainViewController alloc]initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:mainVC animated:NO];
    }
    CGRect bounds = [[UIScreen mainScreen]bounds];
    self.view = [[StartScreenView alloc] initWithFrame:bounds];
}

- (void)loginChanged:(id)sender{
    if ([[NSUserDefaults standardUserDefaults]boolForKey:@"isUserLoggedIn"] == 0) {
        CGRect bounds = [[UIScreen mainScreen]bounds];
        self.view = [[StartScreenView alloc] initWithFrame:bounds];
    }
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
