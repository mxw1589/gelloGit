//
//  RegisterViewController.h
//  LoginDemo
//
//  Created by Chen on 16/1/18.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RegisterViewControlerDelegate <NSObject>

- (void)handleRegisterWithEmail:(NSString *)email passWord:(NSString *)passWord;

@end


@interface RegisterViewController : UIViewController

@property (weak, nonatomic) id<RegisterViewControlerDelegate> registerDelegate;

@end
