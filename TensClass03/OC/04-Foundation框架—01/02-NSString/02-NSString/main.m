//
//  main.m
//  02-NSString
//
//  Created by qinglinfu on 15/12/27.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//----------------------------- 1、字符串的创建------------------------

       // char *c = "423142";
        NSString *s1 = @"字符串";
       // NSString *s2 = [[NSString alloc] initWithString:@"字符串"];
        NSLog(@"%@",s1);
        
        // 可以接收格式符
        NSString *s2 = [[NSString alloc] initWithFormat:@"字符串%d",100];
        NSLog(@"%@",s2);

        // 类方法创建
        NSString *s3 = [NSString stringWithFormat:@"字符串s3 %d",1000];
        NSLog(@"%@",s3);

        
//----------------------------- 2、字符串的比较------------------------

        NSString *s4 = @"abcd";
        NSString *s5 = @"Abcd";
        NSString *s6 = [NSString stringWithFormat:@"abcd"];
        
        //1、 isEqualToString: 比较内容是否相同
        if ([s4 isEqualToString:s5]) {
            
            NSLog(@"s4和s5相同");
        }
        
        NSLog(@"%p",s4);
        NSLog(@"%p",s5);
        NSLog(@"%p",s6);
        
        // 2、== 比较是否是同一个对象（地址是否相同）
        if (s4 == s5) {
            NSLog(@"s4 == s5");
        }
        
        // 3、比较字符串的升序还是降序，首先比较第一个字符的ASCII值。
        // NSComparisonResult 枚举类型
         NSComparisonResult result = [s4 compare:s5];
        switch (result) {
            case NSOrderedAscending:
                NSLog(@"升序");
                break;
            case NSOrderedSame:
                NSLog(@"一样");
                break;
            case NSOrderedDescending:
                NSLog(@"降序");
                break;
        }
        
        //4、length 计算字符串的长度。
        NSString *s7 = @"12345";
        NSString *s8 = @"这里是汉字";
        
        NSUInteger len_s7 = [s7 length];
        NSUInteger len_s8 = [s8 length];
        NSLog(@"len_s7:%ld, len_s8:%ld",len_s7,len_s8);
        
//-------------------------------3、字符串的转换--------------------------------
        
        // 1、大小写的转换
        NSString *s9 = @"qWER tyiui";
        // lowercaseString 全部转为小写
        NSString *s9_low = [s9 lowercaseString];
        NSLog(@"s9_low : %@",s9_low);
        
        //  uppercaseString 全部转为大写
        NSString *s9_up = [s9 uppercaseString];
        NSLog(@"s9_up:%@",s9_up);
        
        // capitalizedString 首字母大写
        NSString *s9_cap = [s9 capitalizedString];
        NSLog(@"s9_cap:%@",s9_cap);
        
        
        // 2、基本数据类型间的转换
        NSString *s10 = @"12345678";
        
        // 基本数据类型 ———》 NSString
        NSString *ss = [NSString stringWithFormat:@"%d",100];
        
        // NSString --> 基本数据类型，必须是数字类型的字符串才能转
        int v_int = [s10 intValue];
        float v_float = [s10 floatValue];
        double v_double = [s10 doubleValue];
        NSInteger v_interger = [s10 integerValue];
        long long v_longlong = [s10 longLongValue];
        BOOL v_bool = [s10 boolValue];
        
        NSLog(@"%d %.2f %f %ld %lld,%d",v_int,v_float,v_double,v_interger,v_longlong,v_bool);
        
//-------------------------------4、字符串的拼接--------------------------------
        
        NSString *s11 = @"hello";
        NSString *s12 = @"world";
        
        // 1、stringWithFormat
        NSString *s13 = [NSString stringWithFormat:@"%@%@",s11,s12];
         NSLog(@"s13 :%@",s13);
        
        // 2、stringByAppendingString 两个字符串的拼接
        NSString *s14 = [s11 stringByAppendingString:s12];
        NSLog(@"s14 :%@",s14);
        
        // 3、stringByAppendingFormat: 可以接收格式符的拼接
        NSString *s15 = [s11 stringByAppendingFormat:@"字符串 %@",s14];
        NSLog(@"s15 :%@",s15);
        
//-----------------------------5、字符串的截取----------------------------------
        
        NSString *s16 = @"qwertyu汉字iop";
        
        // 1、substringFromIndex： 从什么位置截取到末尾
        NSString *s16_from = [s16 substringFromIndex:2];
        NSLog(@"s16_from :%@",s16_from);
        
        // 2、substringToIndex 从开始截取到指定位置
        NSString *s16_to = [s16 substringToIndex:2];
        NSLog(@"s16_to:%@",s16_to);
        
        // 3、substringWithRange 截取指定范围的字符串 NSRang 表示范围 
        NSRange range = {2,6};
        NSString *s16_range = [s16 substringWithRange:range];
        NSLog(@"s16_range： %@",s16_range);

        
 //-----------------------------6、字符串的查找替换----------------------------------
        
        NSString *s17 = @"qewretey汉字876986876";
        
        // 1、rangeOfString 查找指定的字符串所在的位置
        NSRange range_ = [s17 rangeOfString:@"汉字"];
        NSLog(@"%ld ： %ld", range_.location, range_.length);
        
        //判断是否查找到指定的字符串 ， NSNotFound表示是否存在
        if (range_.location != NSNotFound) {
            
            // 截取查找到的字符串
            NSString *s17_sub =  [s17 substringWithRange:range_];
            NSLog(@"%@",s17_sub);
            
        } else {
            
            NSLog(@"没有这个字符串");
        }
        
        NSString *qqEmail = @"43412341234@qq.com";
        
        // 2、stringByReplacingOccurrencesOfString:withString 替换指定的字符串
        NSString *newEmail = [qqEmail stringByReplacingOccurrencesOfString:@"qq" withString:@"163"];
        NSLog(@"%@",newEmail);
        
        // 3、stringByReplacingCharactersInRange：withString 替换指定范围的字符串
        NSRange repRange = {0,3};
        NSString *repEmial = [qqEmail stringByReplacingCharactersInRange:repRange withString:@"987"];
        NSLog(@"%@",repEmial);
        
        
//---------------------------------7、判断开头结尾---------------------------------
        
        NSString *s18 = @"www.baidu.com";
        
        // 1、hasPrefix 是否以某个字符串开口
        if ([s18 hasPrefix:@"www"]) {
            
            NSLog(@"以www开头");
        }
        
        // 2、 hasSuffix 是否以某个字符串结尾
        if ([s18 hasSuffix:@"com"]) {
            
            NSLog(@"以com结尾");
        }
    }
    return 0;
}



