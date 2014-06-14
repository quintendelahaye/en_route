//
//  Mission2ViewController.m
//  EnRoute
//
//  Created by Thomas Verleye on 12/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "Mission2ViewController.h"

@interface Mission2ViewController ()

@end

@implementation Mission2ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationItem.backBarButtonItem = nil;
        UIImage *temp = [[UIImage imageNamed:@"backButton"] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
        UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithImage:temp style:UIBarButtonItemStyleBordered target:self action:@selector(backButtonTapped:)];
        self.navigationItem.leftBarButtonItem = barButtonItem;
        self.records = [NSMutableDictionary dictionary];
        [self.records setObject:@"" forKey:[NSString stringWithFormat:@"%i",1]];
        [self.records setObject:@"" forKey:[NSString stringWithFormat:@"%i",2]];
        [self.records setObject:@"" forKey:[NSString stringWithFormat:@"%i",3]];
        self.photoIsCaptured = NO;
        self.klaarPressed = NO;
    }
    return self;
}

-(void)backButtonTapped:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)loadView{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[Mission2View alloc]initWithFrame:bounds];
}

- (void)updateTodo{
    [self removeReady];
    NSString *todo = @"Je bent klaar met deze opdracht. Dien in of neem iets opnieuw op";
    int count = 0;
    for (NSString *key in self.records) {
        if ([[self.records objectForKey:key]  isEqual: @""]) {
            count++;
        }
    }
    NSLog(@"count: %i",count);
    if (count>1) {
        todo = [NSString stringWithFormat:@"Je moet nog %i woorden opnemen",count];
        if (!self.photoIsCaptured) {
            todo = [todo stringByAppendingString:@" en een achtergrond foto nemen."];
        }else{
            todo = [todo stringByAppendingString:@"."];
        }
    } else if (count == 1){
        todo = @"Je moet nog 1 woord opnemen";
        if (!self.photoIsCaptured) {
            todo = [todo stringByAppendingString:@" en een achtergrond foto nemen."];
        }else{
            todo = [todo stringByAppendingString:@"."];
        }
    } else if (count == 0){
        if (!self.photoIsCaptured) {
            todo = @"Je moet nog een achtergrond foto nemen.";
        }else{
            todo = [todo stringByAppendingString:@"."];
            [self.view addSubview:self.view.klaar];
            self.view.picture.center = CGPointMake(75, 460);
            //[self.view.klaar addTarget:self action:@selector(upload:) forControlEvents:UIControlEventTouchUpInside];
            [self.view.klaar addTarget:self action:@selector(uploadDown:) forControlEvents:UIControlEventTouchDown];
        }
    }
    [self.view changeLblTodoWithText:todo];
}

- (void)removeReady{
    [self.view.klaar removeFromSuperview];
    self.view.picture.center = CGPointMake(160, 460);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navControllerTitel"] forBarMetrics:UIBarMetricsDefault];
    CGRect bounds = [UIScreen mainScreen].bounds;
    TitleView *title = [[TitleView alloc]initWithFrame:CGRectMake(0, 0, bounds.size.width, 29) andTitle:@"opdracht dialect"];
    [self.view addSubview:title];
    [self.view.picture addTarget:self action:@selector(showCrazyShit:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.word1.word addTarget:self action:@selector(showRecordView1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.word2.word addTarget:self action:@selector(showRecordView2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.word3.word addTarget:self action:@selector(showRecordView3:) forControlEvents:UIControlEventTouchUpInside];
    [self updateTodo];
    self.view.delegate = self;
}

- (void)showRecordView1:(id)sender{
    if ( [[self.records objectForKey:@"1"]  isEqual: @""]) {
        self.recordView = [[RecordView alloc]initWithFrame:CGRectMake(0, 3, 320, 323) andWord:@"schelde"];
        [self.view insertSubview:self.recordView aboveSubview:self.view.word3];
        [self.recordView.record addTarget:self action:@selector(recordTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self initRecorderWithWord:@"schelde"];
        self.recording = NO;
        [self.view.word1 showRemove];
        [self.view.word1.remove addTarget:self action:@selector(hideRemove1:) forControlEvents:UIControlEventTouchUpInside];
    }else{
        [self playRecordWithUrl:[self.records objectForKey:@"1"]];
    }
}

- (void)hideRemove1:(id)sender{
    NSLog(@"HideRemove1");
    [self.records setObject:@"" forKey:[NSString stringWithFormat:@"%i",1]];
    [self.view.word1 hideRemove];
    [self updateTodo];
}

- (void)showRecordView2:(id)sender{
    if ( [[self.records objectForKey:@"2"]  isEqual: @""]) {
        self.recordView = [[RecordView alloc]initWithFrame:CGRectMake(0, 3, 320, 323) andWord:@"beiaard"];
        [self.view insertSubview:self.recordView aboveSubview:self.view.word3];
        [self.recordView.record addTarget:self action:@selector(recordTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self initRecorderWithWord:@"beiaard"];
        self.recording = NO;
        [self.view.word2 showRemove];
        [self.view.word2.remove addTarget:self action:@selector(hideRemove2:) forControlEvents:UIControlEventTouchUpInside];
    }else{
        [self playRecordWithUrl:[self.records objectForKey:@"2"]];
    }
}

- (void)hideRemove2:(id)sender{
    NSLog(@"HideRemove2");
    [self.records setObject:@"" forKey:[NSString stringWithFormat:@"%i",2]];
    [self.view.word2 hideRemove];
    [self updateTodo];
}

- (void)showRecordView3:(id)sender{
    if ( [[self.records objectForKey:@"3"]  isEqual: @""]) {
        self.recordView = [[RecordView alloc]initWithFrame:CGRectMake(0, 3, 320, 323) andWord:@"bank"];
        [self.view insertSubview:self.recordView aboveSubview:self.view.word3];
        [self.recordView.record addTarget:self action:@selector(recordTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self initRecorderWithWord:@"bank"];
        self.recording = NO;
        [self.view.word3 showRemove];
        [self.view.word3.remove addTarget:self action:@selector(hideRemove3:) forControlEvents:UIControlEventTouchUpInside];
    }else{
        [self playRecordWithUrl:[self.records objectForKey:@"3"]];
    }
}

- (void)uploadDown:(id)sender{
    NSLog(@"DOWN");
    UIView *loadingView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 522)];
    loadingView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"uploadbg"]];
    [self.view addSubview:loadingView];
    if (!self.klaarPressed) {
        [self.view createVideo];
    }
    
    self.klaarPressed = YES;
    
}

- (void)videoPlaying{
    NSData *imageData = UIImageJPEGRepresentation([self addText], 0.4);
    NSString *urlString = @"http://169.254.216.138/MAIV/en_route/site/upload/mission2.php";
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:urlString]];
    [request setHTTPMethod:@"POST"];
    
    NSString *boundary = @"---------------------------14737809831466499882746641449";
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
    [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
    
    NSMutableData *body = [NSMutableData data];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition:form-data;name=\"userfile[]\"; filename=\"%@\"\r\n", @"picture.jpg"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[NSData dataWithData:imageData]];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    for (NSString *key in self.records) {
        NSString * fileName1 = [[self.records objectForKey:key] lastPathComponent];
        NSData * attachedFile1 = [NSData dataWithContentsOfFile:[self.records objectForKey:key]];
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition:form-data;name=\"userfile[]\"; filename=\"%@\"\r\n", fileName1] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Type:application/octet-stream\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[NSData dataWithData:attachedFile1]];
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    }
    
    
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
    [self.navigationController popViewControllerAnimated:NO];
    [self.delegate Mission2Finished];
}


-(UIImage *)addText{
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
        UIGraphicsBeginImageContextWithOptions(self.view.capturedPicture.image.size, YES, 0.0);
    } else {
        UIGraphicsBeginImageContext(self.view.capturedPicture.image.size);
    }
    UIImage *songTekst = [UIImage imageNamed:@"mission2_song"];
    [self.view.capturedPicture.image drawInRect:CGRectMake(0, 0, self.view.capturedPicture.image.size.width, self.view.capturedPicture.image.size.height)];
    [songTekst drawInRect:CGRectMake(0, 0, songTekst.size.width, songTekst.size.height)];
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultImage;
}

- (void)hideRemove3:(id)sender{
    NSLog(@"HideRemove3");
    [self.records setObject:@"" forKey:[NSString stringWithFormat:@"%i",3]];
    [self.view.word3 hideRemove];
    [self updateTodo];
}

- (void)recordTapped:(id)sender{
    NSLog(@"recordTapped");
    if (self.recording) {
        NSLog(@"stop");
        if (self.audioRecorder.recording)
        {
            [self.audioRecorder stop];
            if ([self.recordView.word.text  isEqual: @"schelde"]) {
                [self.records setObject:self.audioRecorder.url forKey:[NSString stringWithFormat:@"%i",1]];
            }else if ([self.recordView.word.text  isEqual: @"beiaard"]){
                [self.records setObject:self.audioRecorder.url forKey:[NSString stringWithFormat:@"%i",2]];
            }else{
                [self.records setObject:self.audioRecorder.url forKey:[NSString stringWithFormat:@"%i",3]];
            }
            NSLog(@"%@",self.audioRecorder.url);
            NSLog(@"%@",self.records);
            [self.recordView removeFromSuperview];
            [self updateTodo];
        }
    }else{
        NSLog(@"start");
        [self.recordView.record removeFromSuperview];
        self.recordView.record = [UIElementFactory createButtonWithImageName:@"mic_record" andPoint:CGPointMake(25, 114)];
        [self.recordView addSubview:self.recordView.record];
        self.recordView.bg.image = [UIImage imageNamed:@"recordViewBg_recording"];
        [self.recordView.record addTarget:self action:@selector(recordTapped:) forControlEvents:UIControlEventTouchUpInside];
        if (!self.audioRecorder.recording)
        {
            [self.audioRecorder record];
        }
        self.recording = YES;
    }
}

- (void)showCrazyShit:(id)sender{
    self.photoVC = [[PhotoViewController alloc]initWithNibName:nil bundle:nil];
    [self presentViewController:self.photoVC animated:YES completion:^{}];
    self.photoVC.delegate = self;
}

- (void) photoCaptured{
    NSLog(@"show picture");
    self.view.capturedPicture.image = [self squareImageWithImage:self.photoVC.capturedPicture scaledToSize:CGSizeMake(320, 320)];
    self.photoIsCaptured = YES;
    [self updateTodo];
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

- (void)initRecorderWithWord:(NSString*)word{
    NSArray *dirPaths;
    NSString *docsDir;
    
    dirPaths = NSSearchPathForDirectoriesInDomains(
                                                   NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = dirPaths[0];
    
    NSString *soundFilePath = [docsDir
                               stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.m4a",word]];
    
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
    
    
    NSDictionary *recordSettings = [NSDictionary dictionaryWithObjectsAndKeys:
                                    [NSNumber numberWithInt: kAudioFormatMPEG4AAC], AVFormatIDKey,
                                    [NSNumber numberWithFloat:16000.0], AVSampleRateKey,
                                    [NSNumber numberWithInt: 1], AVNumberOfChannelsKey,
                                    nil];
    
    NSError *error = nil;
    
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession setCategory:AVAudioSessionCategoryPlayAndRecord
                        error:nil];
    
    self.audioRecorder = [[AVAudioRecorder alloc]
                          initWithURL:soundFileURL
                          settings:recordSettings
                          error:&error];
    
    if (error)
    {
        NSLog(@"error: %@", [error localizedDescription]);
    } else {
        [self.audioRecorder prepareToRecord];
    }
}

- (void)playRecordWithUrl:(NSURL*)url{
    NSError *error;
    
    self.audioPlayer = [[AVAudioPlayer alloc]
                        initWithContentsOfURL:url
                        error:&error];
    
    UInt32 audioRouteOverride = kAudioSessionOverrideAudioRoute_Speaker;
    
    AudioSessionSetProperty (
                             kAudioSessionProperty_OverrideAudioRoute,
                             sizeof (audioRouteOverride),
                             &audioRouteOverride
                             );
    
    
    self.audioPlayer.volume = 1;
    
    if (error)
        NSLog(@"Error: %@",
              [error localizedDescription]);
    else
        [self.audioPlayer play];
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
