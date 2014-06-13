//
//  PhotoViewDelegate.h
//  EnRoute
//
//  Created by Thomas Verleye on 13/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PhotoViewDelegate <NSObject>
@required
-(void) photoCaptured;
@end
