//
//  CBDailySummaryDAO.h
//  cashstrapped
//
//  Created by Maximiliano Gomez Vidal on 5/15/14.
//  Copyright (c) 2014 Cannonball HQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DailySummary;

@interface CBDailySummaryDAO : NSObject

- (DailySummary *)summaryForDate:(NSDate *)date;
- (DailySummary *)summaryForToday;

- (NSArray *)summariesFrom:(NSDate *)fromDate to:(NSDate *)toDate;
- (NSArray *)allSummaries;

- (void)updateSummaryWithAmount:(NSDecimalNumber *)amount;

+ (CBDailySummaryDAO *)sharedInstance;

@end
