//
//  KHBrowseDataSource.h
//  Streak Club
//
//  Created by Kevin Hwang on 4/27/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "KHBrowseDataSourceDelegate.h"


@interface KHBrowseDataSource : NSObject

- (instancetype)init UNAVAILABLE_ATTRIBUTE;

- (instancetype)initWithDelegate:(id<KHBrowseDataSourceDelegate>)delegate NS_DESIGNATED_INITIALIZER;

- (void)requestBrowseScreen;

@end
