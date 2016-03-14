//
//  ViewController.m
//  04-属性列表(plist文件)
//
//  Created by qinglinfu on 16/2/27.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "ViewController.h"
#import "User.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // [self loadPlistFile];
    // [self userDefaults];
    [self writeFileToPlist];
    
    // NSLog(@"%@",NSHomeDirectory());
}

- (void)loadPlistFile
{
    // 1、获取文件所在的路径
    NSString *infoPath = [[NSBundle mainBundle] pathForResource:@"UserInfo" ofType:@"plist"];
    
    // 2、从plist文件中读取对应数据类型的数据
    // NSDictionary *userInfo = [NSDictionary dictionaryWithContentsOfFile:infoPath];
    NSArray *userInfos = [NSArray arrayWithContentsOfFile:infoPath];
    
    NSLog(@"%@",userInfos);
}

- (void)userDefaults
{
    /*NSUserDefaults 本地持久化保存数据，在沙盒目录的Library\Preferences会生成一个plist文件。
     这个一个单例类，整个项目中只创建一个plist文件，所以用了这个NSUserDefaults
     所有的数据都会保存到同一个plist文件中，适合保存少量的数据。
     */
    
    // -------------设置
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    // 通过键值对的方式设置，保存的数据类型只能是plist支持的数据类型
    [defaults setObject:@"admin" forKey:@"userName"];
    [defaults setObject:@"3659835987ufiur" forKey:@"password"];
    [defaults setObject:[NSDate date] forKey:@"registDate"];
    
    // 数据同步，及时更新数据，添加或修改过数据后要调用这个方法
    [defaults synchronize];

    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def setObject:@"更新的数据" forKey:@"update"];
    
    // 设置的基本数据类型会被设置保存为NSNumber类型
    [def setInteger:100 forKey:@"intValue"];
    [def setDouble:324.343 forKey:@"doubleValue"];
    [def setBool:YES forKey:@"boolValue"];
    
    [def synchronize];
    
    // ------------取值操作，根据保存时设置的key去取值
    NSDate *date =  [def objectForKey:@"registDate"];
    NSInteger value = [def integerForKey:@"intValue"];
    
    NSLog(@"registDate:%@ value:%ld",date,value);
    
    // ----------------移除指定key对应的值
    [def removeObjectForKey:@"update"];
    [def synchronize];
}

- (void)writeFileToPlist
{
    
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filePath = [docPath stringByAppendingPathComponent:@"userInfo.plist"];
    
    NSLog(@"%@",filePath);
    
    NSMutableDictionary *userInfo = [[NSMutableDictionary alloc] init];
    [userInfo setObject:@"小强" forKey:@"userName"];
    [userInfo setObject:@"0987654kjhdfk" forKey:@"userPassword"];
    [userInfo setObject:[NSDate date] forKey:@"registDate"];
    
    // 将字典类型的数据写入指定的plist文件中
    [userInfo writeToFile:filePath atomically:YES];
    
    // 读取plist文件的数据到对应的数据类型
    NSMutableDictionary *userInfo_dic = [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
    
    // 添加数据
    [userInfo_dic setObject:@"添加的数据" forKey:@"update"];
    
    // 之定义的对象数据不能直接添加到plist文件中
    // User *user = [[User alloc] init];
    // [userInfo_dic setObject:user forKey:@"userObj"];
   
    // 添加数据后重新写入
    [userInfo_dic writeToFile:filePath atomically:YES];
    
    NSMutableDictionary *userInfo_new = [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
     NSLog(@"%@",userInfo_new);
    
}


@end
