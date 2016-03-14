//
//  TNSLaunchViewContorller.m
//  TensNews
//
//  Created by Chen on 16/1/27.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "TNSLaunchViewContorller.h"

@interface TNSLaunchViewContorller ()

/**
 *  从window中移出self.view
 */
- (void)moveFromWindow;

@end

@implementation TNSLaunchViewContorller


#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];

    [self performSelector:@selector(moveFromWindow)
                    withObject:nil
                    afterDelay:2];
}


#pragma mark - Private

- (void)moveFromWindow {
    
    [UIView animateWithDuration:0.25 animations:^{
        self.view.alpha = 0;
    } completion:^(BOOL finished) {
        [self.view removeFromSuperview];
    }];
}

@end
