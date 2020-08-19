//
//  CAMTimedTask.m
//  TimeTracker
//
//  Created by Cody Morley on 8/17/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "CAMTimedTask.h"

@implementation CAMTimedTask


- (instancetype)initWithClient:(NSString *)client
                       summary:(NSString *)summary
                          rate:(double)rate
                         hours:(double)hours
{
    self = [super init];
    if (self) {
        _client = [client copy];
        _summary = [summary copy];
        _rate = rate;
        _hours = hours;
    }
    return self;
}

- (double)total
{
    return self.rate * self.hours;
}
@end
