//
//  CAMTimedTaskController.m
//  TimeTracker
//
//  Created by Cody Morley on 8/17/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "CAMTimedTaskController.h"
#import "CAMTimedTask.h"

@implementation CAMTimedTaskController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _tasks = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)createTaskWithClient:(NSString *)client
                     summary:(NSString *)summary
                        rate:(double)rate
                       hours:(double)hours
{
    CAMTimedTask *task = [[CAMTimedTask alloc]initWithClient:client
                                                     summary:summary
                                                        rate:rate
                                                       hours:hours];
    [[self tasks] addObject:task];
}

@end
