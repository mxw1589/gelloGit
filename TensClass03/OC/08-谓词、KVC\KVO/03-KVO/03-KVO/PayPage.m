//
//  PayPage.m
//  03-KVO
//
//  Created by qinglinfu on 16/1/4.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "PayPage.h"

@implementation PayPage

- (void)dealloc
{
    // 使用完后要移除监听
    [_user removeObserver:self forKeyPath:@"userName"];
    [_user removeObserver:self forKeyPath:@"userPassWord"];
}

- (void)pay
{
    // user userName passWork;
    // 如果 userName passWork 值发生改变做支付
    
    NSLog(@"------%@",self.user);
    
    static int tag = 100;
    
    //1、 user 添加一个监听者
    [self.user addObserver:self    // 监听者
            forKeyPath:@"userName" // 被监听的属性名称
               options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew // 监听新值还是旧值
               context:&tag];      //  上下文传递的数据 void *
    
    [self.user addObserver:self
                forKeyPath:@"userPassWord"
                   options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew
                   context:NULL];
}


// 2、监听的对象属性值发生改变后就会自动调用这个方法
- (void)observeValueForKeyPath:(NSString *)keyPath // 监听的属性名称
                      ofObject:(id)object          // 监听者对象
                        change:(NSDictionary<NSString *,id> *)change // 改变的值
                       context:(void *)context     // 上下文传递的数据
{
    
    // 同监听的属性名称获取对应的 new 值和 old 值
    if ([keyPath isEqualToString:@"userName"]) {
        
        // 通过change获取属性的新值
        id newObj = change[@"new"];
        // 通过change获取属性的旧值
        id oldObj = change[@"old"];
        
        NSLog(@"新值：%@",newObj);
        NSLog(@"旧值：%@",oldObj);
        
        // 获取上下文传递的数据 void * --> int *
        NSLog(@"-----%d",*(int *)context);
        
    } else if([keyPath isEqualToString:@"userPassWord"]) {
        
        NSString *newPass = change[@"new"];
        NSString *oldPass = change[@"old"];
        
        NSLog(@"新密码：%@，旧密码：%@",newPass,oldPass);
    }
}


@end
