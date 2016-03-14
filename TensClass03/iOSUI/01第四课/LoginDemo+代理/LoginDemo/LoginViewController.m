//
//  LoginViewController.m
//  LoginDemo
//
//  Created by Chen on 16/1/18.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "LoginViewController.h"

#import "RegisterViewController.h"

#define kScreenWidth CGRectGetWidth([[UIScreen mainScreen] bounds])

@interface LoginViewController ()
<RegisterViewControlerDelegate>

@property (strong, nonatomic) UITextField *userTextField;
@property (strong, nonatomic) UITextField *passwordTextField;
@property (strong, nonatomic) UIButton *loginButton;
@property (strong, nonatomic) UIButton *registerButton;

/**
 *  跳转到注册页面
 */
- (void)registerButtonOnClicked:(UIButton *)sender;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithRed:39/255.0 green:49/255.0 blue:55/255.0 alpha:1];
    
    // Add subViews
    [self.view addSubview:self.userTextField];
    [self.view addSubview:self.passwordTextField];
    [self.view addSubview:self.loginButton];
    [self.view addSubview:self.registerButton];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    CGFloat edge = 15;
    
    self.userTextField.frame = CGRectMake(edge, 50, kScreenWidth-edge*2, 45);
    
    self.passwordTextField.frame = CGRectMake(edge, 110, kScreenWidth-edge*2, 45);
    
    self.loginButton.frame = CGRectMake(edge, 175, kScreenWidth-edge*2, 45);
    
    self.registerButton.frame = CGRectMake(kScreenWidth-60-edge, 230, 60, 30);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - IBActions

- (void)registerButtonOnClicked:(UIButton *)sender {
    
    RegisterViewController *registerUser = [[RegisterViewController alloc] init];
    registerUser.registerDelegate = self;
    
    [self presentViewController:registerUser animated:YES completion:nil];
}


#pragma mark - RegisterViewControlerDelegate

- (void)handleRegisterWithEmail:(NSString *)email passWord:(NSString *)passWord {
    NSLog(@"email: %@ , password: %@", email, passWord);
    
    self.userTextField.text = email;
    self.passwordTextField.text = passWord;
}


#pragma mark - Custom Accessors

- (UITextField *)userTextField {
    if (!_userTextField) {
        _userTextField = [[UITextField alloc] init];
        _userTextField.borderStyle = UITextBorderStyleRoundedRect;
        _userTextField.placeholder = @"邮箱";
    }
    return _userTextField;
}

- (UITextField *)passwordTextField {
    if (!_passwordTextField) {
        _passwordTextField = [[UITextField alloc] init];
        _passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
        _passwordTextField.placeholder = @"密码";
    }
    return _passwordTextField;
}

- (UIButton *)loginButton {
    if (!_loginButton) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginButton.backgroundColor = [UIColor greenColor];
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
    }
    
    return _loginButton;
}

- (UIButton *)registerButton {
    if (!_registerButton) {
        _registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _registerButton.backgroundColor = [UIColor clearColor];
        [_registerButton addTarget:self
                            action:@selector(registerButtonOnClicked:)
                  forControlEvents:UIControlEventTouchUpInside];
        [_registerButton setTitle:@"注册" forState:UIControlStateNormal];

    }
    return _registerButton;
}

@end
