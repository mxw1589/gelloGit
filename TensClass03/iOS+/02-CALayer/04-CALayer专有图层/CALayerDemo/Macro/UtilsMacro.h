//
//  UtilsMacro.h
//  CALayerDemo
//
//  Created by Chen on 15/7/14.
//  Copyright (c) 2015年 Wet. All rights reserved.
//

#ifndef CALayerDemo_UtilsMacro_h
#define CALayerDemo_UtilsMacro_h

#ifndef DEBUG
    #define DLog(...)
#else
    #define DLog(...) NSLog(__VA_ARGS__)
#endif

#endif
