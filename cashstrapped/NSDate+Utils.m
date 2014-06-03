//
//  NSDate+Utils.m
//  cashstrapped
//
//  Created by Matias Pan on 6/3/14.
//  Copyright (c) 2014 Cannonball HQ. All rights reserved.
//

#import "NSDate+Utils.h"

NSCalendar *gregorianCalendar;

@implementation NSDate (Utils)

- (NSDate *)dateWithFilteredOutComponents {
    if (!gregorianCalendar) {
        gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    }
    
    NSDateComponents *components = [gregorianCalendar components:NSDayCalendarUnit|NSMonthCalendarUnit|NSYearCalendarUnit fromDate:self];
    
    return [gregorianCalendar dateFromComponents:components];
}

@end
