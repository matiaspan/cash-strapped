//
//  CBDailySummaryDAO.m
//  cashstrapped
//
//  Created by Maximiliano Gomez Vidal on 5/15/14.
//  Copyright (c) 2014 Cannonball HQ. All rights reserved.
//

#import "CBDailySummaryDAO.h"
#import "DailySummary.h"

@implementation CBDailySummaryDAO

static CBDailySummaryDAO *_sharedInstance = nil;

static NSCalendar *gregorianCalendar;

#pragma makr - Singleton

+ (CBDailySummaryDAO *)sharedInstance {
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[self alloc] init];
    });
    
    return _sharedInstance;
}

#pragma mark - Fetch data

- (DailySummary *)summaryForDate:(NSDate *)date {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"date == %@",
                              [self filterOutDateComponentsFromDate:date]];
    NSArray *results = [DailySummary MR_findAllWithPredicate:predicate];
    
    if ([results count]) {
        return results[0];
    } else {
        return nil;
    }
}

- (DailySummary *)summaryForToday {
    return [self summaryForDate:[NSDate date]];
}

- (NSArray *)summariesFrom:(NSDate *)fromDate to:(NSDate *)toDate {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"date > %@ && date < @",
                              [self filterOutDateComponentsFromDate:fromDate],
                              [self filterOutDateComponentsFromDate:toDate]];
    NSArray *results = [DailySummary MR_findAllWithPredicate:predicate];
    
    if ([results count]) {
        return results[0];
    } else {
        return nil;
    }
}

- (NSArray *)allSummaries {
    return [DailySummary MR_findAllSortedBy:@"date" ascending:NO];
}

#pragma mark - Insert/Update

- (void)updateSummaryWithAmount:(NSDecimalNumber *)amount {
    DailySummary *todaySummary = [self summaryForToday];
    
    if (! todaySummary) {
        todaySummary = [DailySummary MR_createEntity];
        todaySummary.date = [self filterOutDateComponentsFromDate:[NSDate date]];
    }
    
    todaySummary.amount = [todaySummary.amount decimalNumberByAdding:amount];
}

#pragma mark - Utils

- (NSDate *)filterOutDateComponentsFromDate:(NSDate *)date {
    if (!gregorianCalendar) {
        gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    }
    
    NSDateComponents *components = [gregorianCalendar components:NSDayCalendarUnit|NSMonthCalendarUnit|NSYearCalendarUnit
                                                        fromDate:date];
    return [gregorianCalendar dateFromComponents:components];
}

@end
