//
//  KHBrowseCollectionViewDataSource.h
//  Streak Club
//
//  Created by Kevin Hwang on 5/10/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

#import "KHBrowseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface KHBrowseCollectionViewDataSource : NSObject

- (instancetype)init UNAVAILABLE_ATTRIBUTE;

- (instancetype)initWithBrowseView:(id<KHBrowseView>)browseView NS_DESIGNATED_INITIALIZER;

- (void)refreshData;

@end

NS_ASSUME_NONNULL_END