//
//  DailySummary.h
//  cashstrapped
//
//  Created by Maximiliano Gomez Vidal on 5/30/14.
//  Copyright (c) 2014 Cannonball HQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class MonthlySummary;

@interface DailySummary : NSManagedObject

@property (nonatomic, retain) NSDecimalNumber * amount;
@property (nonatomic, retain) NSDecimalNumber * dailyBudget;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) MonthlySummary *monthlySummary;

@end
