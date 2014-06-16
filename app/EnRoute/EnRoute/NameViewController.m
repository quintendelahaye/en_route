//
//  NameViewController.m
//  EnRoute
//
//  Created by Thomas Verleye on 10/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "NameViewController.h"

@interface NameViewController ()

@end

@implementation NameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        NSString *path = [NSString stringWithFormat:@"%@users/%@",API, [[NSUserDefaults standardUserDefaults]objectForKey:@"groupid"]];
        NSURL *url = [NSURL URLWithString:path];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        //        NSLog(@"[LoginViewController] groupname = %@ and password = %@",self.view.txtUsername.text, self.view.txtPassword.text);
        NSLog(@"[NameViewController] url = %@",path);
        
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
        operation.responseSerializer = [AFJSONResponseSerializer serializer];
        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation,id responseObject){
            NSLog(@"loaded data = %@",responseObject);
            if([responseObject count] == 0){
                NSLog(@"fail");
            }else{
                NSLog(@"success");
                self.members = responseObject;
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error){
            NSLog(@"error loading data");
        }];
        [operation start];
        
    }
    return self;
}

- (void)loadView{
    CGRect bounds = [[UIScreen mainScreen]bounds];
    self.view = [[NameView alloc] initWithFrame:bounds];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //title ---------
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navControllerTitel"] forBarMetrics:UIBarMetricsDefault];
    CGRect bounds = [UIScreen mainScreen].bounds;
    
    TitleView *title = [[TitleView alloc]initWithFrame:CGRectMake(0, 0, bounds.size.width, 29) andTitle:[[NSUserDefaults standardUserDefaults]objectForKey:@"loggedInGroup"]];
    NSLog(@"%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"loggedInGroup"]);
    [self.view addSubview:title];
    
    [self.view.dropdown addTarget:self action:@selector(dropdown:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.hidesBackButton = YES;

}

- (void)dropdown:(id)sender{
    [self.view.btnStart removeFromSuperview];
    NSLog(@"Dropdown Tapped");
    self.view.dropdown.enabled = NO;
    [self.view createScrollView];
    int i = 0;
    
    if (self.members.count > 1) {
        for (NSDictionary *dict in self.members) {
            NSLog(@"%@",[dict objectForKey:@"member_name"]);
            NSString *image = @"dropitem";
            DropItemButton *dropitem = [DropItemButton buttonWithType:UIButtonTypeCustom];
            UIImage *imageButton = [UIImage imageNamed:image];
            [dropitem setBackgroundImage:imageButton forState:UIControlStateNormal];
            [dropitem setBackgroundImage:[UIImage imageNamed:[image stringByAppendingString:@"_Pushed"]] forState:UIControlStateHighlighted];
            [dropitem setFrame:CGRectMake(0, i*55, imageButton.size.width,imageButton.size.height)];
            [dropitem setTitle:[dict objectForKey:@"member_name"] forState:UIControlStateNormal];
            [dropitem setTitleColor:[UIColor niceGreenColor] forState:UIControlStateNormal];
            dropitem.index = [[dict objectForKey:@"id"]intValue];
            [dropitem addTarget:self action:@selector(itemSelected:) forControlEvents:UIControlEventTouchUpInside];
            [self.view.scrollView addSubview:dropitem];
            
            i++;
        }
    } else if (self.members.count == 1){
        NSLog(@"%@",[self.members objectForKey:@"member_name"]);
        NSString *image = @"dropitem";
        DropItemButton *dropitem = [DropItemButton buttonWithType:UIButtonTypeCustom];
        UIImage *imageButton = [UIImage imageNamed:image];
        [dropitem setBackgroundImage:imageButton forState:UIControlStateNormal];
        [dropitem setBackgroundImage:[UIImage imageNamed:[image stringByAppendingString:@"_Pushed"]] forState:UIControlStateHighlighted];
        [dropitem setFrame:CGRectMake(0, i*55, imageButton.size.width,imageButton.size.height)];
        [dropitem setTitle:[self.members objectForKey:@"member_name"] forState:UIControlStateNormal];
        [dropitem setTitleColor:[UIColor niceGreenColor] forState:UIControlStateNormal];
        dropitem.index = [[self.members objectForKey:@"id"]intValue];
        [dropitem addTarget:self action:@selector(itemSelected:) forControlEvents:UIControlEventTouchUpInside];
        [self.view.scrollView addSubview:dropitem];
        i++;
    }
    self.view.scrollView.contentSize = CGSizeMake(0, 10 + i*55);
}

- (void)itemSelected:(id)sender{
    DropItemButton *button = (DropItemButton *)sender;
    NSLog(@"%d",button.index);
    self.selectedId = button.index;
    [self.view.dropdown setTitle:button.titleLabel.text forState:UIControlStateNormal];
    self.view.dropdown.enabled = YES;
    [self.view.scrollView removeFromSuperview];
    [self.view createScrollView];
    [self.view createStart];
    [self.view.btnStart addTarget:self action:@selector(start:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)start:(id)sender{
    NSLog(@"miauw");
    [[NSUserDefaults standardUserDefaults]setObject:[NSString stringWithFormat:@"%d",self.selectedId] forKey:@"userid"];
    [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"isUserLoggedIn"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self.navigationController popToRootViewControllerAnimated:NO];
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
