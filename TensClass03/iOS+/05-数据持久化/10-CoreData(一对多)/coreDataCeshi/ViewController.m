//
//  ViewController.m
//  coreDataCeshi
//
//  Created by tens03 on 16/3/1.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "ViewController.h"
#import "Max+CoreDataProperties.h"
#import "Min+CoreDataProperties.h"
#import "AppDelegate.h"

@interface ViewController ()
{
    AppDelegate *delegate;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     NSLog(@"%@",NSHomeDirectory());
    
     [self Inserinto];
    
    
    // [self clearTable];
    
}

/**
 *  随机生成数据
 */
-(void) Inserinto
{
    
    delegate = [UIApplication sharedApplication].delegate;
    Max *max;
    Min *min;
    NSMutableSet<Min *> *minset;
    
    for (int i = 1; i <= 10; i ++) {
        
        max = [NSEntityDescription insertNewObjectForEntityForName:@"Max" inManagedObjectContext:delegate.managedObjectContext];
        max.maxid = @(i);
        max.maxname = [NSString stringWithFormat:@"max_%d",i];
        
        minset = [NSMutableSet set];
        
        for (int m = 1; m <= 10; m ++) {
            
            min = [NSEntityDescription insertNewObjectForEntityForName:@"Min" inManagedObjectContext:delegate.managedObjectContext];
            min.minid = @(i * m);
            min.minname = [NSString stringWithFormat:@"min_%d%d",i,m];
            min.max = max;
            [minset addObject:min];
            
        }
        
        
        [max addMin:minset];
        
        [delegate saveContext];
    }
    
}


/**
 *  清空数据  做完操作需要保存上下文
 */
-(void) clearTable
{
    delegate = [UIApplication sharedApplication].delegate;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Max"];
    
    
    NSArray *arr = [delegate.managedObjectContext executeFetchRequest:request error:nil];
    
    for (Max *maxItem in arr) {
        
        [delegate.managedObjectContext deleteObject:maxItem];
    }
    
    NSFetchRequest *min_request = [NSFetchRequest fetchRequestWithEntityName:@"Min"];
    
    NSArray *min_arr = [delegate.managedObjectContext executeFetchRequest:min_request error:nil];
    
    for (Min *minItem in min_arr) {
        [delegate.managedObjectContext deleteObject:minItem];
    }
    
    [delegate saveContext];
}
@end
