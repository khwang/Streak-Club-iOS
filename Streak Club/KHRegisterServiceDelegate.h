//
//  KHRegisterServiceDelegate.h
//  Streak Club
//
//  Created by Kevin Hwang on 3/29/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol KHRegisterServiceDelegate <NSObject>

- (void)registerSucceededWithUsername:(NSString *)username key:(NSString *)key;
- (void)registerFailedWithError:(NSError *)error;

@end
