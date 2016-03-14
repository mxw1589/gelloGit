//
//  Disk.h
//  homeWork1
//
//  Created by guoqiang on 15-7-23.
//  Copyright (c) 2015年 tens十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Disk : NSObject

{
    int _capacity;
}
-(void)setCapacity:(int)capacity;
-(int)capacity;

-(void)read;
-(void)preserve;
@end
