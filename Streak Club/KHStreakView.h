//
//  KHStreakView.h
//  Streak Club
//
//  Created by Kevin Hwang on 8/4/15.
//  Copyright © 2015 Kevin Hwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KHStreakViewModel;

NS_ASSUME_NONNULL_BEGIN

@interface KHStreakView : UIView

- (void)configureWithViewModel:(KHStreakViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END