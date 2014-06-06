//
//  CBChangeover.h
//  cashstrapped
//
//  Created by Matias Pan on 6/6/14.
//  Copyright (c) 2014 Cannonball HQ. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum changeoverType {
    changeoverTypeDaily,
    changeoverTypeWeekly,
    changeoverTypeMonthly,
    changeoverTypeEveryNumberDays
} changeoverType;

typedef enum weeklyChangeoverValue {
    weeklyChangeoverTypeSunday,
    weeklyChangeoverTypeMonday,
    weeklyChangeoverTypeTuesday,
    weeklyChangeoverTypeWednesday,
    weeklyChangeoverTypeThursday,
    weeklyChangeoverTypeFriday,
    weeklyChangeoverTypeSaturday
} weeklyChangeoverValue;

typedef enum monthlyChangeoverType {
    monthlyChangeoverTypeEveryDayNumber,
    monthlyChangeoverTypeWeekdayBeforeDayNumber
} monthlyChangeoverType;

@interface CBChangeover : NSObject <NSCoding>

@property (assign, nonatomic) changeoverType changeoverType; // daily, weekly, monthly, every # days

@property (assign, nonatomic) weeklyChangeoverValue weeklyChangeoverValue; // every sunday, monday, etc.
@property (assign, nonatomic) monthlyChangeoverType monthlyChangeoverType; // every #day_number#, weekday before #day_number#
@property (assign, nonatomic) NSInteger monthlyChangeoverValue; // #day_number#

@property (assign, nonatomic) NSInteger everyNumberDays; // 1, 2, 3, etc.

@property (strong, nonatomic) NSDate *lastResetDate; // 10-10-2014
@property (strong, nonatomic, readonly) NSDate *nextResetDate; // 10-10-2014

- (NSInteger)daysUntilReset;

- (NSDictionary *)storableObject;
- (CBChangeover *)setupWithDictionary:(NSDictionary *)dictionary;

@end
