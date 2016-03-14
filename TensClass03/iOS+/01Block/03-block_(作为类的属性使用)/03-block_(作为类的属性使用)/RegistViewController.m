//
//  RegistViewController.m
//  03-block_(作为类的属性使用)
//
//  Created by qinglinfu on 16/2/19.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "RegistViewController.h"

@interface RegistViewController ()
{
    
    __weak IBOutlet UITextField *userNameTxf;
    __weak IBOutlet UITextField *passWorkTxf;
}

@end

@implementation RegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)registAction:(UIButton *)sender {
    
    // 回调block,先判断block是否为nil
    if (self.block) {
         _block(userNameTxf.text,passWorkTxf.text);
    }
   
    [self dismissViewControllerAnimated:YES completion:nil];
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
