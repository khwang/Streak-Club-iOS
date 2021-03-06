//
//  KHLoginInteractor.h
//  Streak Club
//
//  Created by Kevin Hwang on 6/22/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KHLoginInteractor : NSObject

- (void)actionTapped:(nullable NSString *)username password:(nullable NSString *)password;


@end

NS_ASSUME_NONNULL_END