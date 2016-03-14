//
//  main.m
//  NSDate_Demo
//
//  Created by Kinglin_Fu on 15/7/27.
//  Copyright (c) 2015年 tens十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        /*=============================NSDate日期类的使用=============================*/
        
        // 获取当前时间，获得的时0时区的时间跟北京时间相差8小时
        NSDate *currentDate = [NSDate date]; // GMT 格林威治时间（世界标准时间）
        NSLog(@"currentDate :%@",currentDate);
        
        //timeIntervalSince1970：当前时间到1970-1-1的秒数，也叫时间戳（NSTimeInterval）
        NSTimeInterval interval1970 = [currentDate timeIntervalSince1970];
        NSLog(@"interval = %lf",interval1970);
        
        
        // timeIntervalSinceReferenceDate 当前时间到2001-1-1 的秒数 //  473045101.999553
        NSTimeInterval interval2001 = [currentDate timeIntervalSinceReferenceDate];
        NSLog(@"interval2001 = %lf",interval2001);
        
        
        // timeIntervalSinceNow 距当前时间的秒数
        NSTimeInterval intervalNow = [currentDate timeIntervalSinceNow];
        NSLog(@"intervalNow = %lf",intervalNow);
        
        
        NSTimeInterval hour = 60 * 60;
        // 一小时后 ，添加一个小时的秒数
        NSDate *h1 = [currentDate dateByAddingTimeInterval:hour];
        NSLog(@"h1 :%@",h1);
        
        // 一小时前
        NSDate *h2 = [currentDate dateByAddingTimeInterval:-hour];
        NSLog(@"h2 :%@",h2);
        
       
        // 计算北京时区时间，（使用系统当前的时区：systemTimeZone）,0时区和系统时间相差的秒数
        NSTimeInterval inter = [[NSTimeZone systemTimeZone] secondsFromGMT];
        NSLog(@"%f",inter);
        NSDate *bjDate = [currentDate dateByAddingTimeInterval:inter];
        NSLog(@"bjDate :%@",bjDate);
    
        
        NSTimeInterval day = 24 * 60 * 60;
        // 方式一：
        // NSDate *yesterday = [NSDate dateWithTimeIntervalSinceNow:day];
        // NSLog(@"%@",yesterday);
        // 方式二：
        
        
        // 昨天
        NSDate *yesterday = [bjDate dateByAddingTimeInterval:-day];
        NSLog(@"yesterday:%@",yesterday);
        
        // 今天
        NSDate *today = [bjDate dateByAddingTimeInterval:0];
        NSLog(@"today:%@",today);
        
        // 明天
        NSDate *tomorrow = [bjDate dateByAddingTimeInterval:day];
        NSLog(@"tomorrow:%@",tomorrow);
        
        
        // isEqualToDate 两个日期的比较
        if ([yesterday isEqualToDate:tomorrow]) {
            
            NSLog(@"两个日期相同");
            
        } else {
            
            NSLog(@"两个日期不相同");
            
        }
        
        // compare 两个日期的比较
        NSComparisonResult result = [yesterday compare:tomorrow];
        if (result == NSOrderedAscending) {
            
            NSLog(@"日期升序");
            
        } else if(result == NSOrderedSame) {
            
            NSLog(@"两个日期相同");
            
        } else if(result == NSOrderedDescending) {
            
            NSLog(@"两个日期降序");
        }
        
        
        //distantFuture 未来的一个时间 4001-01-01 00:00:00
        NSDate *future = [NSDate distantFuture];
        NSLog(@"future :%@",future);
        
        //distantPast 远古的一个时间 0001-12-30 00:00:00
        NSDate *past = [NSDate distantPast];
        NSLog(@"past :%@",past);
        
       
        // dateWithTimeIntervalSince1970 将时间戳转为日期类型 （重点）
        NSString *time = @"345678980";
        NSDate *timeDate = [NSDate dateWithTimeIntervalSince1970:[time doubleValue]];
        NSLog(@"timeDate :%@",timeDate);
        
        
        // 时间格式化 (重点)
        NSDate *now = [NSDate date];
        // NSDateFormatter 日期格式化类
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy年MM月dd日 HH:mm:ss"];
        
        // stringFromDate 将日期类型格式化，转为NSString 类型
        NSString *current = [formatter stringFromDate:now];
        NSLog(@"current:%@",current);
        
        
        // 2015年12月29日 09:51:24  --> NSDate
        
        //dateFromString 将时间字符串转化为日期类型，
        [formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]]; // 默认使用0时区，所以需要时区的转换
        NSDate *nowDate = [formatter dateFromString:current];
        NSLog(@"nowDate :%@",nowDate);
        
    }
    return 0;
}
