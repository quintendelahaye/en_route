//
//  PhotoViewController.h
//  EnRoute
//
//  Created by Thomas Verleye on 13/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPUImage.h"
#import "UIElementFactory.h"
#import "PhotoViewDelegate.h"

@interface PhotoViewController : UIViewController

@property (nonatomic, strong) GPUImageStillCamera *stillCamera;
@property (nonatomic, strong) GPUImageOutput<GPUImageInput> *filter;
@property (nonatomic, strong) UIButton *picture;
@property (nonatomic, strong) UIImage *capturedPicture;
@property (nonatomic, weak) id<PhotoViewDelegate> delegate;

@end
