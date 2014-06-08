//
//  TourViewController.m
//  EnRoute
//
//  Created by Thomas Verleye on 6/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "TourViewController.h"

@interface TourViewController ()

@end

@implementation TourViewController

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
    }
    return self;
}

- (void)loadView{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[TourView alloc]initWithFrame:bounds];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.delegate = self;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navControllerTitel"] forBarMetrics:UIBarMetricsDefault];
    CGRect bounds = [UIScreen mainScreen].bounds;
    TitleView *title = [[TitleView alloc]initWithFrame:CGRectMake(0, 0, bounds.size.width, 29) andTitle:@"map"];
    [self.view addSubview:title];
}

- (void)annotationSelected:(NSString *)title{
    if ([title  isEqual: @"opdracht1"]) {
        NSLog(@"show opdracht 1");
        Mission1ViewController *mission1VC = [[Mission1ViewController alloc]initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:mission1VC animated:YES];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
