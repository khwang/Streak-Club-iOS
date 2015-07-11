//
//  KHStreakService.m
//  Streak Club
//
//  Created by Kevin Hwang on 7/9/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHStreakService.h"

// API
#import "KHAPIService.h"

NS_ASSUME_NONNULL_BEGIN

@interface KHStreakService()

@property (nonatomic, weak) id<KHStreakServiceDelegate>delegate;
@property (nonatomic, strong) KHAPIService *apiService;

@end

@implementation KHStreakService

- (instancetype)init {
    return [self initWithDelegate:nil];
}

- (instancetype)initWithDelegate:(id<KHStreakServiceDelegate> __nonnull)delegate {
    NSParameterAssert(delegate);
    if (self = [super init]) {
        _delegate = delegate;
    }
    return self;
}

- (void)requestStreakInfo {
    //TODO: Fill this in when the API is there
}

#pragma mark - Lazy Instantiation

- (KHAPIService *)apiService {
    if (!_apiService) {
        _apiService = [[KHAPIService alloc] init];
    }
    return _apiService;
}

@end

NS_ASSUME_NONNULL_END