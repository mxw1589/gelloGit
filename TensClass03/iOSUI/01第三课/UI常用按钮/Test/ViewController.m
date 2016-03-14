//
//  ViewController.m
//  Test
//
//  Created by Chen on 16/1/11.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UITextFieldDelegate>
{
    UITextField *textField;
}

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
//    [self createLabel];
    [self createTextField];
}

- (void)createLabel {
    
    CGFloat width = CGRectGetWidth(self.view.frame);
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 30, width-30, 100)];
    
    // 设置文本信息
    label.text = @"你好 Tens 你好 Tens 你好 Tens 你好 Tens 你好 Tens 你好 Tens 你好 Tens 你好 Tens 你好 Tens 你好 Tens 你好 Tens 你好 Tens 你好 Tens 你好 Tens 你好 Tens 你好 Tens ";
    
    // 设置字体字号
    label.font = [UIFont fontWithName:@"Hiragino Mincho ProN"
                                 size:14];
//    label.font = [UIFont systemFontOfSize:50];
    
    /** 设置文本对齐方式 **
     NSTextAlignmentLeft      = 0,    // Visually left aligned
     NSTextAlignmentCenter    = 1,    // Visually centered
     NSTextAlignmentRight     = 2,
     */
    label.textAlignment = NSTextAlignmentLeft;
    
    // 文字颜色
    label.textColor = [UIColor colorWithRed:21/255.0 green:96/255.0 blue:254/255.0 alpha:1];
    
    /**
     NSLineBreakByWordWrapping = 0 //以空格为边界，保留单词。
     NSLineBreakByCharWrapping //保留整个字符
     NSLineBreakByClipping //简单剪裁，到边界为止
     NSLineBreakByTruncatingHead //前面部分文字以……方式省略，显示尾部文字内容
     NSLineBreakByTruncatingTail //结尾部分的内容以……方式省略，显示头的文字内容。
     NSLineBreakByTruncatingMiddle //中间的内容以……方式省略，显示头尾的文字内容。  
     */
    // 文本的最多行数
    label.numberOfLines = 1;
    label.lineBreakMode = NSLineBreakByCharWrapping;
    
    // 设置阴影的颜色
    label.shadowColor = [UIColor blackColor];
    
    // 设置阴影的偏移
    label.shadowOffset = CGSizeMake(0, 10);
    
    [self.view addSubview:label];
    
    
    // 获取系统支持的字体
//    NSArray *array = [UIFont familyNames];
    
//    NSLog(@"names == %@", array);
}

- (void)createTextField {
    
    textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 30, 300, 40)];
    
    textField.delegate = self;
    
    /** 设置边框样式
     UITextBorderStyleNone,
     UITextBorderStyleLine,
     UITextBorderStyleBezel,
     UITextBorderStyleRoundedRect
     */
    textField.borderStyle = UITextBorderStyleRoundedRect;
    
    // 设置文本样式
    textField.font = [UIFont systemFontOfSize:15];
    
    // 文本的提示信息
    textField.placeholder = @"请输入你的密码";
    
    // 安全输入
//    textField.secureTextEntry = YES;
    
    /** 键盘类型
     UIKeyboardTypeDefault,
     UIKeyboardTypeASCIICapable,
     UIKeyboardTypeNumbersAndPunctuation,
     UIKeyboardTypeURL,
     UIKeyboardTypeNumberPad,
     UIKeyboardTypePhonePad,
     UIKeyboardTypeNamePhonePad,
     UIKeyboardTypeEmailAddress,
     UIKeyboardTypeDecimalPad     
     UIKeyboardTypeTwitter
     UIKeyboardTypeWebSearch,
     */
    textField.keyboardType = UIKeyboardTypeDefault;
    
    /** return键的样式
     
     UIReturnKeyDefault,
     UIReturnKeyGo,
     UIReturnKeyGoogle,
     UIReturnKeyJoin,
     UIReturnKeyNext,
     UIReturnKeyRoute,
     UIReturnKeySearch,
     UIReturnKeySend,
     UIReturnKeyYahoo,
     UIReturnKeyDone,
     UIReturnKeyEmergencyCall,
     UIReturnKeyContinue NS_ENUM_AVAILABLE_IOS(9_0),
    */
    textField.returnKeyType = UIReturnKeyDefault;
    
    // 再次编辑时,把之前输入的给清除掉
    textField.clearsOnBeginEditing = YES;
    
    /** 设置清除按钮的样式
     UITextFieldViewModeNever,
     UITextFieldViewModeWhileEditing,
     UITextFieldViewModeUnlessEditing,
     UITextFieldViewModeAlways
     */
    textField.clearButtonMode = UITextFieldViewModeAlways;
    
    [self.view addSubview:textField];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // 获取文件框的值
    NSLog(@"text == %@", textField.text);
    
    
    // 第一种方式来关闭键盘
    // 文本框失去焦点
    /**
    [textField resignFirstResponder];
    
    // 文本框获得焦点
    [textField becomeFirstResponder];
     */
    
    // 第二种方式来关闭键盘
    
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    NSLog(@"文本框将要编辑");
    

    // 返回YES允许编辑文本框, 返回NO不允许编辑文本框
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    NSLog(@"文本框已经开始编辑");
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    NSLog(@"文本框将要结束编辑");
    
    // 返回YES允许结束编辑文本框, 返回NO不允许结束编辑文本框
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSLog(@"文本框已经结束编辑");
}

- (BOOL)textField:(UITextField *)textField1 shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSLog(@"text==%@ range== %@ string== %@", textField1.text, NSStringFromRange(range), string);
    
    if ([textField.text length] > 6) {
        return NO;
    }
    
    // 返回YES允许插入string,  返回NO则不允许
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    NSLog(@"将要清除文字");
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"将要结束编辑 ");
    
    [textField resignFirstResponder];
    
    return YES;
}


@end
