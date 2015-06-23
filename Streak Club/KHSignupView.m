//
//  KHSignupView.m
//  Streak Club
//
//  Created by Kevin Hwang on 6/18/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHSignupView.h"

// View Helper
#import "UIFont+CustomFonts.h"
#import "UIColor+HexString.h"
#import <Masonry.h>

NS_ASSUME_NONNULL_BEGIN

@interface KHSignupView()

@property (nonatomic, strong) UIView *formContainer;

@property (nonatomic, strong) UITextField *usernameField;
@property (nonatomic, strong) UITextField *passwordField;
@property (nonatomic, strong) UITextField *repeatPasswordField;
@property (nonatomic, strong) UITextField *emailField;

@property (nonatomic, strong) UIButton *actionButton;
@property (nonatomic, strong) UIButton *switchModeButton;

@end

@implementation KHSignupView


- (instancetype)init {
    if (self = [super init]) {
        self.backgroundColor = [UIColor colorWithHexString:@"34a0f2"];
        [self _configureViews];
        [self _initializeAutolayout];
    }
    return self;
}

- (void)_configureViews {
    [self addSubview:self.formContainer];
    [self.formContainer addSubview:self.usernameField];
    [self.formContainer addSubview:self.passwordField];
    [self.formContainer addSubview:self.repeatPasswordField];
    [self.formContainer addSubview:self.emailField];
    [self.formContainer addSubview:self.actionButton];
    [self addSubview:self.switchModeButton];
}

- (void)_configureTextField:(UITextField *)textField {
    textField.font = [UIFont regularWithSize:16];
    textField.layer.borderColor = [UIColor colorWithHexString:@"cdcdcd"].CGColor;
    textField.layer.borderWidth = 2.0f;
    textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    
    UIView *viewSpacer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 0)];
    textField.leftView = viewSpacer;
    textField.leftViewMode = UITextFieldViewModeAlways;
}

- (void)_initializeAutolayout {
    CGFloat sideMargin = 20.0f;
    
    [self.formContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.actionButton);
        make.left.equalTo(self).with.offset(sideMargin);
        make.right.equalTo(self).with.offset(-sideMargin);
        make.centerY.equalTo(self);
    }];
    
    CGFloat sidePadding = 20.0f;
    CGFloat verticalPadding = 10.0f;
    CGFloat fieldHeight = 44.0f;
    
    [self.usernameField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.formContainer).with.offset(sidePadding);
        make.right.equalTo(self.formContainer).with.offset(-sidePadding);
        make.top.equalTo(self.formContainer).with.offset(verticalPadding);
        make.height.mas_equalTo(fieldHeight);
    }];
    
    [self.passwordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.usernameField);
        make.top.equalTo(self.usernameField.mas_bottom).with.offset(verticalPadding);
        make.height.equalTo(self.usernameField);
    }];
    
    [self.repeatPasswordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.usernameField);
        make.top.equalTo(self.passwordField.mas_bottom).with.offset(verticalPadding);
        make.height.equalTo(self.usernameField);
    }];
    
    [self.emailField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.usernameField);
        make.top.equalTo(self.repeatPasswordField.mas_bottom).with.offset(verticalPadding);
        make.height.equalTo(self.usernameField);
    }];
    
    [self.actionButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.usernameField);
        make.top.equalTo(self.emailField.mas_bottom);
        make.height.equalTo(self.usernameField);
    }];
    
    [self.switchModeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.usernameField);
        make.top.equalTo(self.actionButton.mas_bottom);
        make.height.equalTo(self.usernameField);
    }];
}

#pragma mark - Lazy Instantiation

- (UIView *)formContainer {
    if (!_formContainer) {
        _formContainer = ({
            UIView *view = [[UIView alloc] init];
            view.backgroundColor = [UIColor whiteColor];
            view.layer.cornerRadius = 3.0f;
            view.layer.masksToBounds = YES;
            view;
        });
    }
    return _formContainer;
}

- (UITextField *)usernameField {
    if (!_usernameField) {
        _usernameField = ({
            UITextField *field = [[UITextField alloc] init];
            field.placeholder = NSLocalizedString(@"Username", @"Input form for a username");
            [self _configureTextField:field];
            field;
        });
    }
    return _usernameField;
}

- (UITextField *)passwordField {
    if (!_passwordField) {
        _passwordField = ({
            UITextField *field = [[UITextField alloc] init];
            field.placeholder = NSLocalizedString(@"Password", @"Input form for a password");
            field.secureTextEntry = YES;
            [self _configureTextField:field];
            field;
        });
    }
    return _passwordField;
}

- (UITextField *)repeatPasswordField {
    if (!_repeatPasswordField) {
        _repeatPasswordField = ({
            UITextField *field = [[UITextField alloc] init];
            field.placeholder = NSLocalizedString(@"Repeat password", @"Input form to confirm password");
            field.secureTextEntry = YES;
            [self _configureTextField:field];
            field;
        });
    }
    return _repeatPasswordField;
}

- (UITextField *)emailField {
    if (!_emailField) {
        _emailField = ({
            UITextField *field = [[UITextField alloc] init];
            field.placeholder = NSLocalizedString(@"Email", @"Input form for email");
            [self _configureTextField:field];
            field;
        });
    }
    return _emailField;
}

- (UIButton *)actionButton {
    if (!_actionButton) {
        _actionButton = ({
            UIButton *button = [[UIButton alloc] init];
            [button setTitle:NSLocalizedString(@"Create Account", @"Button for creating an account") forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            button;
        });
    }
    return _actionButton;
}

- (UIButton *)switchModeButton {
    if (!_switchModeButton) {
        _switchModeButton = ({
            UIButton *button = [[UIButton alloc] init];
            [button setTitle:NSLocalizedString(@"Already have an account?", @"Button for moving from the register view to the login view") forState:UIControlStateNormal];
            button;
        });
    }
    return _switchModeButton;
}

@end

NS_ASSUME_NONNULL_END
