//
//  CBMonthlySummaryDAO.m
//  cashstrapped
//
//  Created by Maximiliano Gomez Vidal on 5/30/14.
//  Copyright (c) 2014 Cannonball HQ. All rights reserved.
//

#import "CBMonthlySummaryDAO.h"
#import "MonthlySummary.h"

@implementation CBMonthlySummaryDAO

static CBMonthlySummaryDAO *_sharedInstance = nil;

static NSDateFormatter *dateFormatter;
static NSCalendar *gregorianCalendar;

#pragma mark - Singleton

+ (CBMonthlySummaryDAO *)sharedInstance {
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[self alloc] init];
    });
    
    return _sharedInstance;
}

#pragma mark - Fetch data

- (MonthlySummary *)monthlySummaryForDate:(NSDate *)date {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"date == %@",
                              [self filterOutDateComponentsFromDate:date]];
    NSArray *results = [MonthlySummary MR_findAllWithPredicate:predicate];
    
    if ([results count]) {
        return results[0];
    } else {
        return nil;
    }
}

- (NSArray *)allMonthlySummaries {
    return [MonthlySummary MR_findAllSortedBy:@"date" ascending:NO];
}

#pragma mark - Insert/Update

- (void)updateMonthlySummaryForDate:(NSDate *)date withAmount:(NSDecimalNumber *)amount {
    MonthlySummary *summary = [self monthlySummaryForDate:date];
    
    if (! summary) {
        summary = [MonthlySummary MR_createEntity];
        summary.date = [self filterOutDateComponentsFromDate:date];
        summary.monthName = [self monthNameFromDate:date];
    }
    
    summary.amount = [summary.amount decimalNumberByAdding:amount];
}

#pragma mark - Utils

// We only care about the month and the year. The rest of the date info is discarded.
- (NSDate *)filterOutDateComponentsFromDate:(NSDate *)date {
    if (! gregorianCalendar) {
        gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    }
    
    NSDateComponents *components = [gregorianCalendar components:NSMonthCalendarUnit|NSYearCalendarUnit
                                                        fromDate:date];
    return [gregorianCalendar dateFromComponents:components];
}

- (NSString *)monthNameFromDate:(NSDate *)date {
    if (! gregorianCalendar) {
        gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    }
    
    if (! dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
    }
    
    NSDateComponents *components = [gregorianCalendar components:NSMonthCalendarUnit|NSYearCalendarUnit
                                                        fromDate:date];
    return [dateFormatter standaloneMonthSymbols][[components month] - 1];
}

@end
