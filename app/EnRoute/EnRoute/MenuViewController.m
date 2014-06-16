//
//  MenuViewController.m
//  EnRoute
//
//  Created by Thomas Verleye on 10/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)loadView{
    CGRect bounds = CGRectMake(0, 0, 320, 250);
    self.view = [[MenuView alloc] initWithFrame:bounds];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    //title ---------
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navController"] forBarMetrics:UIBarMetricsDefault];
    CGRect bounds = [UIScreen mainScreen].bounds;
    
    TitleView *title = [[TitleView alloc]initWithFrame:CGRectMake(0, 0, bounds.size.width, 29) andTitle:@"menu"];
    [self.view addSubview:title];
    
    [self.view.btnHandleiding addTarget:self action:@selector(startTutorial:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.btnMap addTarget:self action:@selector(showLegende:) forControlEvents:UIControlEventTouchUpInside];
    
    self.view.frame = CGRectMake(0, -250, 320, 250);
    self.zichtbaar = NO;
}

- (void)hideView{
    NSLog(@"yes");
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navController"] forBarMetrics:UIBarMetricsDefault];
    [UIView animateWithDuration:1 animations:^{
        self.view.frame = CGRectMake(0, -250, 320, 250);
    }];
    self.zichtbaar = NO;
}
- (void)showView{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navControllerTitel"] forBarMetrics:UIBarMetricsDefault];
    [UIView animateWithDuration:1 animations:^{
        self.view.frame = CGRectMake(0, 0, 320, 250);
    }];
    self.zichtbaar = YES;
}

-(void)showLegende:(id)sender{
    LegendeViewController *legendeVC = [[LegendeViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:legendeVC animated:YES];
    [self hideMenu];
}

- (void)startTutorial:(id)sender{
    TutorialViewController *tutorialVC = [[TutorialViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:tutorialVC animated:YES];
    [self hideMenu];
}

-(void)hideMenu{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navController"] forBarMetrics:UIBarMetricsDefault];
    self.view.frame = CGRectMake(0, -250, 320, 250);
    self.zichtbaar = NO;
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
