//
//  KHRegisterManager.m
//  Streak Club
//
//  Created by Kevin Hwang on 3/30/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHRegisterManager.h"

@interface KHRegisterManager()

@property (nonatomic, weak) id<KHRegisterManagerDelegate>delegate;

@end

@implementation KHRegisterManager

- (instancetype)initWithDelegate:(id<KHRegisterManagerDelegate>)delegate {
    if (self = [super init]) {
        _delegate = delegate;
    }
    return self;
}

@end