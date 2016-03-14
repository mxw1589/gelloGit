//
//  Skill.h
//  Player1
//
//  Created by zjq on 15-7-23.
//  Copyright (c) 2015年 zjq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHero : NSObject
{
    NSString *_heroName;
    int _redValue;
    int _blueValue;
}

- (instancetype)initWithName:(NSString *)name withRed:(int)red withBlue:(int)blue;

- (void)Qskill;
- (void)Wskill;
- (void)Eskill;
- (void)Rskill;
@end
