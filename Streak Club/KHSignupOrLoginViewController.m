//
//  KHSignupOrLoginViewController.m
//  Streak Club
//
//  Created by Kevin Hwang on 3/28/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHSignupOrLoginViewController.h"

// Views
#import "KHSignupOrLoginView.h"

// View Helpers
#import <Masonry.h>

// Login
#import "KHSignupOrLoginViewModel.h"

@interface KHSignupOrLoginViewController()<KHSignupOrLoginViewProtocol, UITextFieldDelegate>

@property (nonatomic, strong) KHSignupOrLoginView *signupLoginView;

@property (nonatomic, strong) KHSignupOrLoginViewModel *viewModel;

@property (nonatomic, assign) BOOL loginForm;

@end

@implementation KHSignupOrLoginViewController

- (instancetype)init {
    if (self = [super init]) {
        _loginForm = YES;
        _viewModel = [[KHSignupOrLoginViewModel alloc] initWithView:self];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.signupLoginView = [[KHSignupOrLoginView alloc] init];
    [self.view addSubview:self.signupLoginView];
    
    [self.signupLoginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    self.signupLoginView.usernameField.delegate = self;
    self.signupLoginView.passwordField.delegate = self;
    self.signupLoginView.repeatPasswordField.delegate = self;
    self.signupLoginView.emailField.delegate = self;
    
    [self.signupLoginView.actionButton addTarget:self action:@selector(_actionTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.signupLoginView.switchModeButton addTarget:self action:@selector(_switchModeTapped:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - KHSignupOrLoginViewProtocol

- (void)setLoginMode:(BOOL)loginMode {
    self.loginForm = loginMode;
    self.signupLoginView.loginForm = self.loginForm;
}

#pragma mark - Button Presses

- (void)_actionTapped:(id)sender {
    NSString *username = self.signupLoginView.usernameField.text;
    NSString *password = self.signupLoginView.passwordField.text;
    NSString *repeatPassword = self.signupLoginView.repeatPasswordField.text;
    NSString *email = self.signupLoginView.emailField.text;
    [self.viewModel actionTapped:username password:password repeatPassword:repeatPassword email:email];
}

- (void)_switchModeTapped:(id)sender {
    [self.viewModel toggleModeTapped];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([textField isEqual:self.signupLoginView.usernameField]) {
        [self.signupLoginView.passwordField becomeFirstResponder];
        return NO;
    } else if ([textField isEqual:self.signupLoginView.passwordField]) {
        if (self.loginForm) {
            return YES;
        } else {
            [self.signupLoginView.repeatPasswordField becomeFirstResponder];
            return NO;
        }
    } else if ([textField isEqual:self.signupLoginView.repeatPasswordField]) {
        [self.signupLoginView.emailField becomeFirstResponder];
        return NO;
    } else {
        [textField resignFirstResponder];
        [self _actionTapped:nil];
        return YES;
    }
}

@end
