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
        [[NSUserDefaults standardUserDefaults]setObject:@"1" forKey:@"upcomingMission"];
        [[NSUserDefaults standardUserDefaults]setObject:@"NO" forKey:@"lastMission"];
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
    
    //title
    TitleView *title = [[TitleView alloc]initWithFrame:CGRectMake(0, 0, bounds.size.width, 29) andTitle:@"map"];
    [self.view addSubview:title];
    
    //timer toevoegen
    self.bgTimer = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mapTimer"]];
    self.bgTimer.center = CGPointMake(160, 506);
    [self.view addSubview:self.bgTimer];
    
    self.lblTimer = [UIElementFactory createLabelWithFont:BEBAS andSize:22 andText:@"05:00" andFrame:CGRectMake(0, 0, 60, 0) andColor:[UIColor lightYellowColor] andTextalignment:NSTextAlignmentCenter];
    self.lblTimer.frame = CGRectMake(0, 0, 60, 33);
    self.lblTimer.center = CGPointMake(33, 507);
    [self.view addSubview:self.lblTimer];
    
    //timer starten
    self.secondsLeft = 10;
    self.timer = [NSTimer scheduledTimerWithTimeInterval: 1.0 target:self selector:@selector(updateCountdown) userInfo:nil repeats: YES];
}

- (void)annotationSelected:(NSString *)title{
    if (self.secondsLeft == 0) {
        if ([title  isEqual: @"opdracht1"] && [[[NSUserDefaults standardUserDefaults]objectForKey:@"upcomingMission"]  isEqual: @"1"]) {
            NSLog(@"show opdracht 1");
            self.mission1VC = [[Mission1ViewController alloc]initWithNibName:nil bundle:nil];
            self.mission1VC.delegate = self;
            [self.navigationController pushViewController:self.mission1VC animated:YES];
        } else if([title  isEqual: @"opdracht2"] && [[[NSUserDefaults standardUserDefaults]objectForKey:@"upcomingMission"]  isEqual: @"2"]){
            NSLog(@"show opdracht 2");
            self.tutorialMission2VC = [[TutorialMission2ViewController alloc]initWithNibName:nil bundle:nil];
            self.tutorialMission2VC.delegate = self;
            [self.navigationController pushViewController:self.tutorialMission2VC animated:YES];
        } else if([title  isEqual: @"opdracht3"] && [[[NSUserDefaults standardUserDefaults]objectForKey:@"upcomingMission"]  isEqual: @"3"]){
            NSLog(@"show opdracht 3");
            self.mission3ExplanationVC = [[Mission3ExplanationViewController alloc]initWithNibName:nil bundle:nil];
            self.mission3ExplanationVC.delegate = self;
            [self.navigationController pushViewController:self.mission3ExplanationVC animated:YES];
            
            //self.timeChallenge3VC = [[TimeChallenge3ViewController alloc]initWithNibName:nil bundle:nil];
            //[self.navigationController pushViewController:self.timeChallenge3VC animated:YES];
        }
    }
}

- (void)Mission1Finished{
    //UnlockedView
    UIImage *unlockedBg = [UIImage imageNamed:@"unlocked_screen"];
    self.unlockedView = [[UnlockedView alloc]initWithFrame:CGRectMake(20, 110, unlockedBg.size.width, unlockedBg.size.height) andText:@"Jullie kunnen kiezen welk deel jullie nu eerst gaan bezoeken." andLast:NO];
    [self.view addSubview:self.unlockedView];
    [self.unlockedView.kunst addTarget:self action:@selector(kunst:) forControlEvents:UIControlEventTouchUpInside];
    [self.unlockedView.mode addTarget:self action:@selector(mode:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.bgTimer];
    [self.view addSubview:self.lblTimer];
    self.secondsLeft = 10;
    self.timer = [NSTimer scheduledTimerWithTimeInterval: 1.0 target:self selector:@selector(updateCountdown) userInfo:nil repeats: YES];
}

- (void)Mission2Finished{
    if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lastMission"]  isEqual: @"NO"]) {
        [[NSUserDefaults standardUserDefaults]setObject:@"3" forKey:@"upcomingMission"];
        [[NSUserDefaults standardUserDefaults]setObject:@"YES" forKey:@"lastMission"];
        [self.view removeAllPinsButUserLocation];
        NSLog(@"miauw");
        [self.view addSubview:self.bgTimer];
        [self.view addSubview:self.lblTimer];
        self.secondsLeft = 10;
        self.timer = [NSTimer scheduledTimerWithTimeInterval: 1.0 target:self selector:@selector(updateCountdown) userInfo:nil repeats: YES];
    } else {
        NSLog(@"show einde niggertje");
    }
}

- (void)Mission3Finished{
    if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lastMission"]  isEqual: @"NO"]) {
        [[NSUserDefaults standardUserDefaults]setObject:@"2" forKey:@"upcomingMission"];
        [[NSUserDefaults standardUserDefaults]setObject:@"YES" forKey:@"lastMission"];
        [self.view removeAllPinsButUserLocation];
        [self.view addSubview:self.bgTimer];
        [self.view addSubview:self.lblTimer];
        self.secondsLeft = 10;
        self.timer = [NSTimer scheduledTimerWithTimeInterval: 1.0 target:self selector:@selector(updateCountdown) userInfo:nil repeats: YES];
    } else {
        NSLog(@"show einde niggertje");
    }
}

- (void)kunst:(id)sender{
    [[NSUserDefaults standardUserDefaults]setObject:@"2" forKey:@"upcomingMission"];
    [self.unlockedView removeFromSuperview];
    [self.view removeAllPinsButUserLocation];
}

- (void)mode:(id)sender{
    [[NSUserDefaults standardUserDefaults]setObject:@"3" forKey:@"upcomingMission"];
    [self.unlockedView removeFromSuperview];
    [self.view removeAllPinsButUserLocation];
}

-(void) updateCountdown {
    int  minutes, seconds;
    
    self.secondsLeft--;
    if (self.secondsLeft == 0) {
        [self.timer invalidate];
        self.timer = nil;
        [self.lblTimer removeFromSuperview];
        [self.bgTimer removeFromSuperview];
        if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"upcomingMission"]  isEqual: @"1"]) {
            //eerste opdracht
        } else if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lastMission"]  isEqual: @"YES"]){
            //laatste opdracht
        } else {
            //tweede opdracht
        }
    }
    minutes = (self.secondsLeft % 3600) / 60;
    seconds = (self.secondsLeft %3600) % 60;
    self.lblTimer.text = [NSString stringWithFormat:@"%02d:%02d", minutes, seconds];
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
