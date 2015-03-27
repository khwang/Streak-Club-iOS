//
//  KHSplashScreenContentViewController.m
//  Streak Club
//
//  Created by Kevin Hwang on 3/25/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHSplashScreenContentViewController.h"

#import "UIColor+HexString.h"
#import <Masonry.h>

@interface KHSplashScreenContentViewController ()

@property (nonatomic, strong) UIImageView *backgroundImage;
@property (nonatomic, strong) UILabel *descriptionLabel;

@end

@implementation KHSplashScreenContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"34A0F2"];
    
    self.backgroundImage = [[UIImageView alloc] init];
    [self.view addSubview:self.backgroundImage];
    
    [self.backgroundImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    self.descriptionLabel = [[UILabel alloc] init];
    [self.backgroundImage addSubview:self.descriptionLabel];
    
    [self.descriptionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.backgroundImage);
    }];
}

- (void)setDescriptionText:(NSString *)text {
    self.descriptionLabel.text = text;
}

- (void)setImagePath:(NSString *)imagePath {
    self.backgroundImage.image = [UIImage imageNamed:imagePath];
}

@end
