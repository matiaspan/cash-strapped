//
//  MonthlySummary.h
//  cashstrapped
//
//  Created by Maximiliano Gomez Vidal on 5/30/14.
//  Copyright (c) 2014 Cannonball HQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface MonthlySummary : NSManagedObject

@property (nonatomic, retain) NSDecimalNumber * amount;
@property (nonatomic, retain) NSDate * date;

@end
