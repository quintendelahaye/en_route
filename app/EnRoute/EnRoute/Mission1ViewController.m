//
//  Mission1ViewController.m
//  EnRoute
//
//  Created by Thomas Verleye on 7/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "Mission1ViewController.h"

@interface Mission1ViewController ()

@end

@implementation Mission1ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.part = 1;
    }
    return self;
}

-(void)loadView{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[Mission1IntroductionView alloc]initWithFrame:bounds];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navControllerTitel"] forBarMetrics:UIBarMetricsDefault];
    CGRect bounds = [UIScreen mainScreen].bounds;
    TitleView *title = [[TitleView alloc]initWithFrame:CGRectMake(0, 0, bounds.size.width, 29) andTitle:@"opdracht collage"];
    TitleView *titleResult = [[TitleView alloc]initWithFrame:CGRectMake(0, 0, bounds.size.width, 29) andTitle:@"jullie collage"];
    [self.view addSubview:title];
    self.resultView = [[Mission1ResultView alloc]initWithFrame:bounds];
    [self.resultView addSubview:titleResult];
    [self.view.btnStart addTarget:self action:@selector(showCamera:) forControlEvents:UIControlEventTouchUpInside];
    [self.resultView.redo addTarget:self action:@selector(showCamera:) forControlEvents:UIControlEventTouchUpInside];
    [self.resultView.ok  addTarget:self action:@selector(done:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)showCamera:(id)sender{
    NSLog(@"[OverviewVC] Show camera");
    
    self.picker = [[UIImagePickerController alloc]init];
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        NSLog(@"[OverviewVC] Camera device available");
        NSArray *availableMediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
        self.picker.mediaTypes = availableMediaTypes;
        self.picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        CGRect bounds = [UIScreen mainScreen].bounds;
        self.cameraOverlay = [[Mission1CameraView alloc]initWithFrame:bounds andPart:self.part];
        self.cameraOverlay.part1.image = self.canvas;
        self.cameraOverlay.part2.image = self.frame;
        self.picker.cameraOverlayView = self.cameraOverlay;
        self.picker.showsCameraControls = NO;
        self.picker.allowsEditing = NO;
        
        [self.cameraOverlay.picture addTarget:self action:@selector(picture:) forControlEvents:UIControlEventTouchUpInside];
        [self.cameraOverlay.back addTarget:self action:@selector(prev:) forControlEvents:UIControlEventTouchUpInside];
    }else{
        NSLog(@"[OverviewVC] No camera device available");
        self.picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    [self presentViewController:self.picker animated:NO completion:^{}];
    
    self.picker.delegate = self;
}

- (void)prev:(id)selector{
    if (self.part == 1) {
        [self.picker dismissViewControllerAnimated:NO completion:^{}];
    }else{
        if (self.part == 2) {
            self.canvas = [UIImage alloc];
        }else if (self.part == 3){
            self.frame = [UIImage alloc];
        }
        [self.picker dismissViewControllerAnimated:NO completion:^{
            self.part--;
            [self showCamera:self];
        }];
    }
}

- (void)done:(id)selector{
    [self.navigationController popViewControllerAnimated:YES];
    [self.delegate Mission1Finished];
}

- (void)picture:(id)selector{
    [self.picker takePicture];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    NSLog(@"[OverviewVC] Did finish picking media: %@", info);
    
    UIImage *picture = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    UIImage *bla = [UIImage imageNamed:@"mission1_mask_bg"];
    
    UIImage *cropje = [self imageWithImage:picture scaledToSize:bla.size];
    
    switch (self.part) {
        case 1:
            self.canvas = [self maskImage:cropje withMask:[UIImage imageNamed:@"mission1_mask_canvas"]];
            break;
        case 2:
            self.frame = [self maskImage:cropje withMask:[UIImage imageNamed:@"mission1_mask_frame"]];
            break;
        case 3:
            self.bg = [self maskImage:cropje withMask:[UIImage imageNamed:@"mission1_mask_bg"]];
            self.collage = [self squareImageWithImage:[self createCollage] scaledToSize:CGSizeMake(self.bg.size.width, self.bg.size.width)];
            [self.view addSubview:self.resultView];
            self.resultView.imageView.image = self.collage;
            //uploaden
            break;
            
        default:
            break;
    }
    
    if (self.part != 3) {
        [picker dismissViewControllerAnimated:NO completion:^{
            self.part++;
            [self showCamera:self];
        }];
    }else{
        [picker dismissViewControllerAnimated:NO completion:^{
            self.part = 1;
            self.bg = [UIImage alloc];
            self.frame = [UIImage alloc];
            self.canvas = [UIImage alloc];
        }];
    }
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

- (UIImage*) maskImage:(UIImage *)image withMask:(UIImage *)maskImage {
    
	CGImageRef maskRef = maskImage.CGImage;
    
    CGImageRef mask = CGImageMaskCreate(CGImageGetWidth(maskRef),
                                        CGImageGetHeight(maskRef),
                                        CGImageGetBitsPerComponent(maskRef),
                                        CGImageGetBitsPerPixel(maskRef),
                                        CGImageGetBytesPerRow(maskRef),
                                        CGImageGetDataProvider(maskRef), NULL, false);
    
    CGImageRef masked = CGImageCreateWithMask([image CGImage], mask);
    return [UIImage imageWithCGImage:masked];
}

-(UIImage *)createCollage{
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
        UIGraphicsBeginImageContextWithOptions(self.bg.size, YES, 0.0);
    } else {
        UIGraphicsBeginImageContext(self.bg.size);
    }
    [self.bg drawInRect:CGRectMake(0, 0, self.bg.size.width, self.bg.size.height)];
    [self.frame drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [self.canvas drawInRect:CGRectMake(0, 0, self.canvas.size.width, self.canvas.size.height)];
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultImage;
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
