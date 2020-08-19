//
//  CAMTimedTaskController.h
//  TimeTracker
//
//  Created by Cody Morley on 8/17/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class CAMTimedTask;

@interface CAMTimedTaskController : NSObject

@property (nonatomic, copy) NSMutableArray<CAMTimedTask *> *tasks;

- (void)createTaskWithClient:(NSString *)client
                     summary:(NSString *)summary
                        rate:(double)rate
                       hours:(double)hours;

@end

NS_ASSUME_NONNULL_END
