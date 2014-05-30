//
//  CBMonthlySummaryDAO.h
//  cashstrapped
//
//  Created by Maximiliano Gomez Vidal on 5/30/14.
//  Copyright (c) 2014 Cannonball HQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MonthlySummary;

@interface CBMonthlySummaryDAO : NSObject

- (MonthlySummary *)monthlySummaryForDate:(NSDate *)date;
- (NSArray *)allMonthlySummaries;

- (void)updateMonthlySummaryForDate:(NSDate *)date withAmount:(NSDecimalNumber *)amount;

+ (CBMonthlySummaryDAO *)sharedInstance;

@end
