//
//  Animal.h
//  02-继承
//
//  Created by qinglinfu on 15/12/25.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Animal : NSObject {
    
    @public
    NSString *_animalName;
    NSString *_categery;
    
    @protected
    NSString *_varProtected;
    
    @private
    NSString *_varPrivate;
}

- (void)eat;

//- (void)sleep;

- (void)supMethod;


@end
