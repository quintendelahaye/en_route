//
//  PhotoViewController.m
//  EnRoute
//
//  Created by Thomas Verleye on 13/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "PhotoViewController.h"

@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)loadView{
    CGRect mainScreenFrame = [[UIScreen mainScreen] bounds];
    
	GPUImageView *primaryView = [[GPUImageView alloc] initWithFrame:mainScreenFrame];
	primaryView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    UIImage *cameraOverlayImg = [UIImage imageNamed:@"mission2_cameraOverlay"];
    UIImageView *cameraOverlay = [[UIImageView alloc]initWithFrame:mainScreenFrame];
    cameraOverlay.image = cameraOverlayImg;
    [primaryView addSubview:cameraOverlay];
    
    self.picture = [UIElementFactory createButtonWithImageName:@"btn_picture" andPoint:CGPointMake(129, 474)];
    [primaryView addSubview:self.picture];
    [self.picture addTarget:self action:@selector(takePicture:) forControlEvents:UIControlEventTouchUpInside];
    
    self.view = primaryView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.stillCamera = [[GPUImageStillCamera alloc] init];
    self.stillCamera.outputImageOrientation = UIInterfaceOrientationPortrait;
    self.filter = [[GPUImageSepiaFilter alloc] init];
    [self.stillCamera addTarget:self.filter];
    GPUImageView *filterView = (GPUImageView *)self.view;
    [self.filter addTarget:filterView];
    [self.stillCamera startCameraCapture];
}

- (void)takePicture:(id)sender{
    [self.stillCamera capturePhotoAsJPEGProcessedUpToFilter:self.filter withCompletionHandler:^(NSData *processedJPEG, NSError *error){
        
        NSLog(@"save picture");
        
        self.capturedPicture = [UIImage imageWithData:processedJPEG];
        
        [self.delegate photoCaptured];
        
        [self dismissViewControllerAnimated:YES completion:^{}];
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
