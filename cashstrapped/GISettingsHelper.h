//
//  GISettingsHelper.h
//  pomodoro
//
//  Created by Matias Santiago Pan on 7/12/13.
//  Copyright (c) 2013 Green Stick Ideas. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kUDBudgetKey @"kUDBudgetKey"
#define kUDChangeoverDayKey @"kUDChangeoverDayKey"
#define kUDRolloverBehaviorKey @"kUDRolloverBehaviorKey"

@class CBChangeover;

@interface GISettingsHelper : NSObject

@property (nonatomic, assign) CGFloat budget;
@property (nonatomic, assign) CBChangeover *changeoverDay;
@property (nonatomic, assign) NSString *rolloverBehavior;

+ (GISettingsHelper *)sharedInstance;

@end
