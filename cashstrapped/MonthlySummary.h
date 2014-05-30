//
//  MonthlySummary.h
//  cashstrapped
//
//  Created by Maximiliano Gomez Vidal on 5/30/14.
//  Copyright (c) 2014 Cannonball HQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DailySummary;

@interface MonthlySummary : NSManagedObject

@property (nonatomic, retain) NSDecimalNumber * amount;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSString * monthName;
@property (nonatomic, retain) NSSet *dailySummaries;
@end

@interface MonthlySummary (CoreDataGeneratedAccessors)

- (void)addDailySummariesObject:(DailySummary *)value;
- (void)removeDailySummariesObject:(DailySummary *)value;
- (void)addDailySummaries:(NSSet *)values;
- (void)removeDailySummaries:(NSSet *)values;

@end
