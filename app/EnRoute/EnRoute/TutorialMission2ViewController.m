//
//  TutorialMission2ViewController.m
//  EnRoute
//
//  Created by Thomas Verleye on 12/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "TutorialMission2ViewController.h"

@interface TutorialMission2ViewController ()

@end

@implementation TutorialMission2ViewController

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

-(void)loadView{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[TutorialMission2View alloc]initWithFrame:bounds];
}

-(void)backButtonTapped:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navControllerTitel"] forBarMetrics:UIBarMetricsDefault];
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view.scrollView.delegate = self;
    TitleView *title = [[TitleView alloc]initWithFrame:CGRectMake(0, 0, bounds.size.width, 29) andTitle:@"opdracht dialect"];
    [self.view addSubview:title];
    [self.view.btnstart addTarget:self action:@selector(showMission2:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)showMission2:(id)sender{
    NSLog(@"show mission2");
    self.mission2VC = [[Mission2ViewController alloc]initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:self.mission2VC animated:YES];
    self.mission2VC.delegate = self;
}

- (void)Mission2Finished{
    [self.navigationController popViewControllerAnimated:NO];
    [self.delegate Mission2Finished];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    int page = scrollView.contentOffset.x / scrollView.frame.size.width;
    self.view.pageControl.currentPage = page;
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
