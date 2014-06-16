//
//  ChallengeDelegate.h
//  EnRoute
//
//  Created by Thomas Verleye on 16/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ChallengeDelegate <NSObject>
@required
-(void) challengeFinished;
@end
