//
//  CBChangeover.m
//  cashstrapped
//
//  Created by Matias Pan on 6/6/14.
//  Copyright (c) 2014 Cannonball HQ. All rights reserved.
//

#import "CBChangeover.h"
#import "NSDate+Utils.h"

@implementation CBChangeover

- (NSInteger)daysUntilReset {
    return ([_nextResetDate timeIntervalSince1970] - [_lastResetDate timeIntervalSince1970]) / 24 / 60 / 60;
}

- (void)setLastResetDate:(NSDate *)lastResetDate {
    _lastResetDate = [lastResetDate dateWithFilteredOutComponents];
    _nextResetDate = [_lastResetDate dateByAddingTimeInterval:7 * 60 * 60 * 24];
}

- (NSString *)description {
    switch (_changeoverType) {
        case changeoverTypeDaily:
            return [self descriptionForMonthlyChangeoverType];
        case changeoverTypeWeekly:
            return [self descriptionForWeeklyChangeoverType];
        case changeoverTypeMonthly:
            return [self descriptionForMonthlyChangeoverType];
        case changeoverTypeEveryNumberDays:
            return [self descriptionForMonthlyChangeoverType];
    }
}

- (NSString *)descriptionForWeeklyChangeoverType {
    NSArray *days = @[@"Sunday", @"Monday", @"Tuesday", @"Wednesday", @"Thursday", @"Friday", @"Saturday"];
    return [NSString stringWithFormat:@"Every %@", days[_weeklyChangeoverValue]];
}

- (NSString *)descriptionForMonthlyChangeoverType {
    return @"";
}

- (NSDictionary *)storableObject {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    [dictionary setObject:@(_changeoverType) forKey:@"_changeoverType"];
    [dictionary setObject:@(_weeklyChangeoverValue) forKey:@"_weeklyChangeoverValue"];
    [dictionary setObject:@(_monthlyChangeoverType) forKey:@"_monthlyChangeoverType"];
    [dictionary setObject:@(_monthlyChangeoverValue) forKey:@"_monthlyChangeoverValue"];
    [dictionary setObject:@(_everyNumberDays) forKey:@"_everyNumberDays"];
    [dictionary setObject:_lastResetDate forKey:@"_lastResetDate"];
    [dictionary setObject:_nextResetDate forKey:@"_nextResetDate"];
    return dictionary;
}

- (CBChangeover *)setupWithDictionary:(NSDictionary *)dictionary {
    _changeoverType = [[dictionary objectForKey:@"_changeoverType"] intValue];
    _weeklyChangeoverValue = [[dictionary objectForKey:@"_weeklyChangeoverValue"] intValue];
    _monthlyChangeoverType = [[dictionary objectForKey:@"_monthlyChangeoverType"] intValue];
    _monthlyChangeoverValue = [[dictionary objectForKey:@"_monthlyChangeoverValue"] intValue];
    _everyNumberDays = [[dictionary objectForKey:@"_everyNumberDays"] intValue];
    _lastResetDate = [dictionary objectForKey:@"_lastResetDate"];
    _nextResetDate = [dictionary objectForKey:@"_nextResetDate"];
    return self;
}

@end
