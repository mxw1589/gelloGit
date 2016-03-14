//
//  RegisterViewController.m
//  LoginDemo
//
//  Created by Chen on 16/1/18.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@property (strong, nonatomic) UITextField *nickNameTextField;
@property (strong, nonatomic) UIButton *registerButton;

/**
 *  注册用户
 */
- (void)registerButtonOnClicked:(UIButton *)sender;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithRed:39/255.0 green:49/255.0 blue:55/255.0 alpha:1];
    
    // Add subViews
    [self.view addSubview:self.nickNameTextField];
    [self.view addSubview:self.emailTextField];
    [self.view addSubview:self.passwordTextField];
    [self.view addSubview:self.registerButton];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    CGFloat edge = 15;
    CGFloat screenWidht = CGRectGetWidth(self.view.frame);
    
    self.nickNameTextField.frame = CGRectMake(edge, 50, screenWidht-edge*2, 45);
    
    self.emailTextField.frame = CGRectMake(edge, 110, screenWidht-edge*2, 45);
    
    self.passwordTextField.frame = CGRectMake(edge, 175, screenWidht-edge*2, 45);
    
    self.registerButton.frame = CGRectMake(edge, 235, screenWidht-edge*2, 45);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions

- (void)registerButtonOnClicked:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - Custom Accessors

- (UITextField *)nickNameTextField {
    if (!_nickNameTextField) {
        _nickNameTextField = [[UITextField alloc] init];
        _nickNameTextField.borderStyle = UITextBorderStyleRoundedRect;
        _nickNameTextField.placeholder = @"请输入您的昵称";
    }
    return _nickNameTextField;
}

- (UITextField *)emailTextField {
    if (!_emailTextField) {
        _emailTextField = [[UITextField alloc] init];
        _emailTextField.borderStyle = UITextBorderStyleRoundedRect;
        _emailTextField.placeholder = @"请输入您的邮箱";
    }
    return _emailTextField;
}


- (UITextField *)passwordTextField {
    if (!_passwordTextField) {
        _passwordTextField = [[UITextField alloc] init];
        _passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
        _passwordTextField.placeholder = @"密码";
    }
    return _passwordTextField;
}

- (UIButton *)registerButton {
    if (!_registerButton) {
        _registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _registerButton.backgroundColor = [UIColor greenColor];
        [_registerButton addTarget:self
                            action:@selector(registerButtonOnClicked:)
                  forControlEvents:UIControlEventTouchUpInside];
        [_registerButton setTitle:@"注册" forState:UIControlStateNormal];
        
    }
    return _registerButton;
}

@end
