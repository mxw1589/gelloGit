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

@property (strong, nonatomic) UITextField *userTextField;
@property (strong, nonatomic) UITextField *passwordTextField;
@property (strong, nonatomic) UIButton *loginButton;
@property (strong, nonatomic) UIButton *registerButton;


@property (strong, nonatomic) UILabel *nameLabel;

@property (strong, nonatomic) RegisterViewController *registerUser;

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

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"registerUser.emailTextField.text"];
    [self removeObserver:self forKeyPath:@"registerUser.passwordTextField.text"];
}


#pragma mark - IBActions

- (void)registerButtonOnClicked:(UIButton *)sender {
    
    self.registerUser = [[RegisterViewController alloc] init];
//    [registerUser addObserver:self forKeyPath:@"emailTextField.text" options:NSKeyValueObservingOptionNew context:nil];
//    [registerUser addObserver:self forKeyPath:@"passwordTextField.text" options:NSKeyValueObservingOptionNew context:nil];
    
    [self addObserver:self forKeyPath:@"registerUser.emailTextField.text" options:NSKeyValueObservingOptionNew context:nil];
    [self addObserver:self forKeyPath:@"registerUser.passwordTextField.text" options:NSKeyValueObservingOptionNew context:nil];
    NSLog(@"Add");
    /**
     A class addobserver remove
     
     */

    /**
     被监听对象  register 移出的时候 把kvo从监听者里移除
     监听者
     
     
     被监听对象  login 移出的时候 把kvo从监听者里移除
     监听者

     */
    
    [self presentViewController:self.registerUser animated:YES completion:nil];
}



#pragma mark - KVO Observer

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    
    if ([keyPath isEqualToString:@"registerUser.emailTextField.text"]) {
        self.userTextField.text = change[NSKeyValueChangeNewKey];
    }
    
    if ([keyPath isEqualToString:@"registerUser.passwordTextField.text"]) {
        self.passwordTextField.text = change[NSKeyValueChangeNewKey];
    }
}


#pragma mark - Custom Accessors

- (void)setRegisterUser:(RegisterViewController *)registerUser {

    if (_registerUser != nil) {
        [self removeObserver:self forKeyPath:@"registerUser.emailTextField.text"];
        [self removeObserver:self forKeyPath:@"registerUser.passwordTextField.text"];
        NSLog(@"remove");
    }
    
    _registerUser = registerUser;
}

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
