//
//  LoginViewController.m
//  03-block_(作为类的属性使用)
//
//  Created by qinglinfu on 16/2/19.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "LoginViewController.h"
#import "RegistViewController.h"

@interface LoginViewController ()
{
    
    __weak IBOutlet UITextField *passWorkTxf;
    __weak IBOutlet UITextField *userNameTef;
}

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)toRegistAction:(UIButton *)sender {
    
    RegistViewController *registVC = [self.storyboard instantiateViewControllerWithIdentifier:@"RegistViewController"];
    
    registVC.block = ^(NSString *userName, NSString *password) {
        
        userNameTef.text = userName;
        passWorkTxf.text = password;
    };
    
    [self presentViewController:registVC animated:YES completion:nil];
    
}
- (IBAction)loginAction:(UIButton *)sender {
    
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
