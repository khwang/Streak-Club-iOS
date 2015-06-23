//
//  KHSignupViewController.m
//  Streak Club
//
//  Created by Kevin Hwang on 6/18/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHSignupViewController.h"

// View
#import "KHSignupView.h"

// Interactor
#import "KHSignupInteractor.h"

// View Helper
#import <Masonry.h>

NS_ASSUME_NONNULL_BEGIN

@interface KHSignupViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) KHSignupInteractor *interactor;
@property (nonatomic, strong) KHSignupView *signupView;

@end

@implementation KHSignupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.signupView];
    
    [self.signupView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    self.signupView.usernameField.delegate = self;
    self.signupView.passwordField.delegate = self;
    self.signupView.repeatPasswordField.delegate = self;
    self.signupView.emailField.delegate = self;
    
    [self.signupView.actionButton addTarget:self action:@selector(_actionTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.signupView.switchModeButton addTarget:self action:@selector(_switchModeTapped:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - Lazy Instantiation

- (KHSignupView *)signupView {
    if (!_signupView) {
        _signupView = [[KHSignupView alloc] init];
    }
    return _signupView;
}

- (KHSignupInteractor *)interactor {
    if (!_interactor) {
        _interactor = [[KHSignupInteractor alloc] init];
    }
    return _interactor;
}

#pragma mark - Button Presses

- (void)_actionTapped {
    NSString *username = self.signupView.usernameField.text;
    NSString *password = self.signupView.passwordField.text;
    NSString *repeatPassword = self.signupView.repeatPasswordField.text;
    NSString *email = self.signupView.emailField.text;
    
    [self.interactor actionTapped:username password:password repeatPassword:repeatPassword email:email];
}

- (void)_switchModeTapped:(id)sender {
    
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    BOOL shouldReturn = NO;
    if ([textField isEqual:self.signupView.usernameField]) {
        [self.signupView.passwordField becomeFirstResponder];
    } else if ([textField isEqual:self.signupView.passwordField]) {
        [self.signupView.repeatPasswordField becomeFirstResponder];
    } else if ([textField isEqual:self.signupView.repeatPasswordField]) {
        [self.signupView.emailField becomeFirstResponder];
    } else if ([textField isEqual:self.signupView.emailField]) {
        [self.signupView.emailField resignFirstResponder];
        shouldReturn = YES;
        [self _actionTapped];
    }
    return shouldReturn;
}

@end

NS_ASSUME_NONNULL_END
