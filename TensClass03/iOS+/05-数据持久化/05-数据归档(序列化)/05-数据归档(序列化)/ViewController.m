//
//  ViewController.m
//  05-数据归档(序列化)
//
//  Created by qinglinfu on 16/2/27.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "ViewController.h"
#import "User.h"

@interface ViewController ()<NSCoding>

@end

@implementation ViewController

/*数据归档：
    
    1、数据归档是将数据以二进制的形式保存，达到数据的隐蔽性。
    2、要实现归档必须实现<NSCoding>协议，对数据进行编码和解码的操作。
    3、常用的NSFoundation类都实现了<NSCoding>协议，所以可以直接归档
    4、自定义的对象归档需要自己去实现<NSCoding>协议的
    - (void)encodeWithCoder:(NSCoder *)aCoder (编码)
    - (instancetype)initWithCoder:(NSCoder *)aDecoder (解码)
    方法对对象的属性编码和解码。

 */

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // NSKeyedArchiver, NSKeyedUnarchiver
    NSLog(@"%@",NSHomeDirectory());

    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *archivePath = [docPath stringByAppendingPathComponent:@"user.achive"];
    
    NSMutableDictionary *userInfo = [[NSMutableDictionary alloc] init];
    [userInfo setObject:@"小强" forKey:@"userName"];
    [userInfo setObject:@"0987654kjhdfk" forKey:@"userPassword"];
    [userInfo setObject:[NSDate date] forKey:@"registDate"];
    
    User *user = [[User alloc] init];
    [userInfo setObject:user forKey:@"user"];
    
    //1、 将NSMutableDictionary 类型的数据归档(编码保存)，数据归档会将数据以二进制的形式保存，从而达到数据的隐秘性。
    [NSKeyedArchiver archiveRootObject:userInfo toFile:archivePath];
    
    // 2、将归档的数据解归档(解码)，返回对应的数据类型。
    NSMutableDictionary *userInfo_load = [NSKeyedUnarchiver unarchiveObjectWithFile:archivePath];
    NSLog(@"%@",userInfo_load);
    
    
    // 方式二：
    // 1、将对象编码为NSData(二进制类型)保存，再将数据写入指定的文件中
    NSData *userData = [NSKeyedArchiver archivedDataWithRootObject:user];
    [userData writeToFile:archivePath atomically:YES];
    
    // 2、将编码的NSData类型数据反编码为原来的对象类型
    User *user_ = [NSKeyedUnarchiver unarchiveObjectWithData:userData];
    NSLog(@"----%@",user_);
    
}


@end
