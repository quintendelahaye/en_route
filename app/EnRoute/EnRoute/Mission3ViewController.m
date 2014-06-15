//
//  Mission3ViewController.m
//  EnRoute
//
//  Created by Thomas Verleye on 14/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "Mission3ViewController.h"

@interface Mission3ViewController ()

@end

@implementation Mission3ViewController

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

- (void)loadView{
    CGRect bounds = [[UIScreen mainScreen]bounds];
    self.view = [[Mission3View alloc] initWithFrame:bounds];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navControllerTitel"] forBarMetrics:UIBarMetricsDefault];
    CGRect bounds = [UIScreen mainScreen].bounds;
    
    TitleView *title = [[TitleView alloc]initWithFrame:CGRectMake(0, 0, bounds.size.width, 29) andTitle:@"opdracht mode"];
    [self.view addSubview:title];
    
    [self.view.btnAdd addTarget:self action:@selector(addWinkel:) forControlEvents:UIControlEventTouchUpInside];
    
    self.winkels = [[NSMutableArray alloc]init];
}

-(void)dismissKeyboard {
    [self.view.textfieldMember resignFirstResponder];
}


- (void)addWinkel:(id)sender{
    if (self.view.textfieldMember.text && self.view.textfieldMember.text.length > 0){
        NSString *winkelName = self.view.textfieldMember.text;
        [self.winkels addObject:winkelName];
        int yPos = 57 * (self.winkels.count -1);
        MemberView *memberView = [[MemberView alloc]initWithName:winkelName andCGPoint:CGPointMake(0, yPos)];
        [self.view.scrollView addSubview:memberView];
        [self.view.btnAdd setFrame:CGRectMake(self.view.btnAdd.frame.origin.x, yPos+63, self.view.btnAdd.frame.size.width, self.view.btnAdd.frame.size.height)];
        [self.view.textfieldMember setFrame:CGRectMake(0, yPos+63, self.view.textfieldMember.frame.size.width, self.view.textfieldMember.frame.size.height)];
        [self.view.btnStart setFrame:CGRectMake(0, yPos+130, self.view.btnStart.frame.size.width, self.view.btnStart.frame.size.height)];
        [self.view.textfieldMember setText:@""];
        [self.view.scrollView setContentSize:CGSizeMake(0, yPos +340)];
        if (self.winkels.count>2) {
            CGPoint bottomOffset = CGPointMake(0, self.view.scrollView.contentSize.height - self.view.scrollView.bounds.size.height);
            [self.view.scrollView setContentOffset:bottomOffset animated:YES];
            self.view.btnStart = [UIElementFactory createButtonWithImageName:@"btnIndienen" andPoint:CGPointMake(0, yPos + 130)];
            [self.view.scrollView addSubview:self.view.btnStart];
            [self.view.btnStart addTarget:self action:@selector(indienen:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
}

- (void)indienen:(id)sender{
    NSLog(@"indienen");
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *groupid = [[NSUserDefaults standardUserDefaults]objectForKey:@"groupid"];
    NSDictionary *parameters = @{@"groupid": groupid,
                                 @"shops": self.winkels};
    NSLog(@"parameters: %@",parameters);
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager POST:[NSString stringWithFormat:@"%@mission3",API] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"success: %@",responseObject);
        [[NSNotificationCenter defaultCenter] postNotificationName:@"LOGIN_CHANGED" object:self];
        [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"isUserLoggedIn"];
        [self.navigationController popToRootViewControllerAnimated:NO];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
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
