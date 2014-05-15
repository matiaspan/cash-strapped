//
//  DailySummary.h
//  cashstrapped
//
//  Created by Maximiliano Gomez Vidal on 5/15/14.
//  Copyright (c) 2014 Cannonball HQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface DailySummary : NSManagedObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSDecimalNumber * amount;
@property (nonatomic, retain) NSDecimalNumber * dailyBudget;

@end
