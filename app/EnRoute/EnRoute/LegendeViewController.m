//
//  LegendeViewController.m
//  EnRoute
//
//  Created by Thomas Verleye on 16/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "LegendeViewController.h"

@interface LegendeViewController ()

@end

@implementation LegendeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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

-(void)loadView{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[UIView alloc]initWithFrame:bounds];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"legende"]];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navControllerTitel"] forBarMetrics:UIBarMetricsDefault];
    CGRect bounds = [UIScreen mainScreen].bounds;
    
    TitleView *title = [[TitleView alloc]initWithFrame:CGRectMake(0, 0, bounds.size.width, 29) andTitle:@"legende map"];
    [self.view addSubview:title];
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
