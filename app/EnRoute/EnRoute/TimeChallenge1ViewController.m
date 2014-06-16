//
//  TimeChallenge1ViewController.m
//  EnRoute
//
//  Created by Thomas Verleye on 15/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "TimeChallenge1ViewController.h"

@interface TimeChallenge1ViewController ()

@end

@implementation TimeChallenge1ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andPart:(int)part
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationItem.backBarButtonItem = nil;
        self.secondsLeft = 10;
        self.resultVisible = NO;
        self.part = part;
    }
    return self;
}

-(void)loadView{
    CGRect bounds = [UIScreen mainScreen].bounds;
    if (self.part == 4) {
        self.view = [[TimeChallengeExplanationView alloc]initWithFrame:bounds andHead:@"Beeld" andExplanation:@"Tijd voor een groepsfoto! Zoek het dichtsbijzijnde standbeeld, beeld deze uit samen met je groep en laat een foto nemen." andRemark:@"Je hebt 5 minuten de tijd!" andImage:[UIImage imageNamed:@"timeChallenge_pic1"]];
    } else if (self.part == 5){
        self.view = [[TimeChallengeExplanationView alloc]initWithFrame:bounds andHead:@"Vintage" andExplanation:@"Voor een moderne tijd als deze lopen er toch veel mensen rond met een oude kledingstijl, neem een foto van een persoon met oude kledij of accessoire." andRemark:@"Je hebt 5 minuten de tijd!" andImage:[UIImage imageNamed:@"timeChallenge_pic2"]];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navControllerTitel"] forBarMetrics:UIBarMetricsDefault];
    CGRect bounds = [UIScreen mainScreen].bounds;
    
    NSString *titleText = @"";
    if (self.part == 4) {
        titleText = @"opdracht beeld";
    }else{
        titleText = @"opdracht vintage";
    }
    
    TitleView *title = [[TitleView alloc]initWithFrame:CGRectMake(0, 0, bounds.size.width, 29) andTitle:titleText];
    [self.view addSubview:title];
    self.navigationItem.hidesBackButton = YES;
    [self.view.btnStart addTarget:self action:@selector(startChallenge:) forControlEvents:UIControlEventTouchUpInside];
    
    TitleView *titleResult = [[TitleView alloc]initWithFrame:CGRectMake(0, 0, bounds.size.width, 29) andTitle:titleText];
    self.resultView = [[TimeChallengeResultView alloc]initWithFrame:bounds];
    [self.resultView addSubview:titleResult];
    [self.resultView.redo addTarget:self action:@selector(startChallenge:) forControlEvents:UIControlEventTouchUpInside];
    [self.resultView.ok  addTarget:self action:@selector(done:) forControlEvents:UIControlEventTouchUpInside];
}

-(void) startChallenge:(id)sender{
    NSLog(@"[OverviewVC] Show camera");
    
    self.picker = [[UIImagePickerController alloc]init];
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        NSLog(@"[OverviewVC] Camera device available");
        NSArray *availableMediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
        self.picker.mediaTypes = availableMediaTypes;
        self.picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        CGRect bounds = [UIScreen mainScreen].bounds;
        self.cameraOverlay = [[Mission1CameraView alloc]initWithFrame:bounds andPart:self.part];
        self.picker.cameraOverlayView = self.cameraOverlay;
        self.picker.showsCameraControls = NO;
        self.picker.allowsEditing = NO;
        
        [self.cameraOverlay.picture addTarget:self action:@selector(picture:) forControlEvents:UIControlEventTouchUpInside];
    }else{
        NSLog(@"[OverviewVC] No camera device available");
        self.picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    [self presentViewController:self.picker animated:NO completion:^{}];
    
    self.picker.delegate = self;
    self.resultVisible = NO;
    
    if (self.secondsLeft == 10) {
        NSLog(@"bla");
        self.timer = [NSTimer scheduledTimerWithTimeInterval: 1.0 target:self selector:@selector(updateCountdown) userInfo:nil repeats: YES];
    }
}

-(void)done:(id)sender{
    [self.timer invalidate];
    self.timer = nil;
    NSLog(@"De foto wordt geupload");
    NSData *imageData = UIImageJPEGRepresentation(self.resultView.imageView.image, 0.4);
    NSString *urlString = [NSString stringWithFormat:@"%@mission%i.php",UPLOAD,self.part];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:urlString]];
    [request setHTTPMethod:@"POST"];
    
    NSString *boundary = @"---------------------------14737809831466499882746641449";
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
    [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
    
    NSMutableData *body = [NSMutableData data];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"uploadedfile\"; filename=\"test.jpg\"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[NSData dataWithData:imageData]];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    
    // text parameter
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"groupid\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    NSString *parameterValue1= [[NSUserDefaults standardUserDefaults]objectForKey:@"groupid"];
    [body appendData:[parameterValue1 dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"userid\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    NSString *parameterValue2= [[NSUserDefaults standardUserDefaults]objectForKey:@"userid"];
    [body appendData:[parameterValue2 dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    
    [request setHTTPBody:body];
    
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
    
    NSLog(@"Image Return String: %@", returnString);
    [self.delegate challengeFinished];
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)picture:(id)sender{
    [self.picker takePicture];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    NSLog(@"[OverviewVC] Did finish picking media: %@", info);
    self.resultVisible = YES;
    
    UIImage *picture = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    UIImage *bla = [UIImage imageNamed:@"mission1_mask_bg"];
    
    UIImage *cropje = [self imageWithImage:picture scaledToSize:bla.size];
    
    UIImage *square = [self squareImageWithImage:cropje scaledToSize:CGSizeMake(bla.size.width, bla.size.width)];
    
    if (self.secondsLeft == 0) {
        square = [self createFailwithImage:square];
    }
    
    [self.view addSubview:self.resultView];
    self.resultView.imageView.image = square;
    
    [picker dismissViewControllerAnimated:YES completion:^{}];
}

- (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize;{
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
        UIGraphicsBeginImageContextWithOptions(newSize, YES, 0.0);
    } else {
        UIGraphicsBeginImageContext(newSize);
    }
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (UIImage *)squareImageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    double ratio;
    double delta;
    CGPoint offset;
    
    //make a new square size, that is the resized imaged width
    CGSize sz = CGSizeMake(newSize.width, newSize.width);
    
    //figure out if the picture is landscape or portrait, then
    //calculate scale factor and offset
    if (image.size.width > image.size.height) {
        ratio = newSize.width / image.size.width;
        delta = (ratio*image.size.width - ratio*image.size.height);
        offset = CGPointMake(delta/2, 0);
    } else {
        ratio = newSize.width / image.size.height;
        delta = (ratio*image.size.height - ratio*image.size.width);
        offset = CGPointMake(0, delta/2);
    }
    
    //make the final clipping rect based on the calculated values
    CGRect clipRect = CGRectMake(-offset.x, -offset.y,
                                 (ratio * image.size.width) + delta,
                                 (ratio * image.size.height) + delta);
    
    
    //start a new context, with scale factor 0.0 so retina displays get
    //high quality image
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
        UIGraphicsBeginImageContextWithOptions(sz, YES, 0.0);
    } else {
        UIGraphicsBeginImageContext(sz);
    }
    UIRectClip(clipRect);
    [image drawInRect:clipRect];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

-(UIImage *)createFailwithImage:(UIImage*)image{
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
        UIGraphicsBeginImageContextWithOptions(image.size, YES, 0.0);
    } else {
        UIGraphicsBeginImageContext(image.size);
    }
    UIImage *stamp = [UIImage imageNamed:@"stampFail"];
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [stamp drawInRect:CGRectMake(0, 0, stamp.size.width, stamp.size.height)];
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultImage;
}

-(void) updateCountdown {
    int  minutes, seconds;
    
    self.secondsLeft--;
    if (self.secondsLeft == 0) {
        [self.picker takePicture];
    }
    if (self.secondsLeft < 0) {
        //failstamp toevoegen
        [self done:self];
        
        [self.timer invalidate];
        self.timer = nil;
        
    }
    minutes = (self.secondsLeft % 3600) / 60;
    seconds = (self.secondsLeft %3600) % 60;
    self.cameraOverlay.lblTime.text = [NSString stringWithFormat:@"%02d:%02d", minutes, seconds];
    self.resultView.lblTime.text = [NSString stringWithFormat:@"%02d:%02d", minutes, seconds];
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
