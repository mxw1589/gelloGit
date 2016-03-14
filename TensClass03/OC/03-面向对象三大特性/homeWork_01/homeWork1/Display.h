//
//  Display.h
//  homeWork1
//
//  Created by guoqiang on 15-7-23.
//  Copyright (c) 2015年 tens十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Display : NSObject

{
    int _inch;
}

-(void)setInch:(int)inch;
-(int)inch;

-(void)showScreen;
-(void)close;
@end
