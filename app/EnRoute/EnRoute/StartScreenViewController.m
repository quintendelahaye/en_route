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
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize target:self action:@selector(menuTapped:)];
        NSLog(@"is logged in --> %hhd",[[NSUserDefaults standardUserDefaults]boolForKey:@"isUserLoggedIn"]);
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(logout:) name:@"LOGOUT_TAPPED" object:nil];
    }
    return self;
}

-(void)menuTapped:(id)sender{
    [self.view showMenu];
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadView{
    CGRect bounds = [[UIScreen mainScreen]bounds];
    self.view = [[StartScreenView alloc] initWithFrame:bounds];
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
