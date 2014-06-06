//
//  GISettingsHelper.m
//  pomodoro
//
//  Created by Matias Santiago Pan on 7/12/13.
//  Copyright (c) 2013 Green Stick Ideas. All rights reserved.
//

#import "GISettingsHelper.h"
#import "CBChangeover.h"

GISettingsHelper *_sharedSettingsHelper;

#define kUDBudget 250.f
#define kUDChangeoverDay [[self defaultChangeoverDay] storableObject]
#define kUDRolloverBehavior @"Reset Spend"

//#define kUDPomodoroLengthKey @"kUDPomodoroLengthKey"
//#define kUDPomodoroLength 25 * 60
//
//#define kUDBreakLengthKey @"kUDBreakLengthKey"
//#define kUDBreakLength 5 * 60
//
//#define kUDLongBreakLengthKey @"kUDLongBreakLengthKey"
//#define kUDLongBreakLength 15 * 60
//
//#define kUDLongBreakDelayKey @"kUDLongBreakDelayKey"
//#define kUDLongBreakDelay 4
//
//#define kUDTargetPomodorosKey @"kUDTargetPomodorosKey"
//#define kUDTargetPomodoros 11
//
//#define kUDAlarmSoundKey @"kUDAlarmSoundKey"
//
//#define kUDTickingSoundKey @"kUDTickingSoundKey"
//#define kUDTickingSound YES
//
//#define kUDPreventScreenLockKey @"kUDPreventScreenLockKey"
//#define kUDPreventScreenLock NO
//
//#define kUDClearAtMidnightKey @"kUDClearAtMidnightKey"
//#define kUDClearAtMidnight YES

@implementation GISettingsHelper

+ (GISettingsHelper *)sharedInstance {
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedSettingsHelper = [[self alloc] init];
    });
    
    return _sharedSettingsHelper;
}

- (id)init {
    self = [super init];
    
    if (self) {
        [[NSUserDefaults standardUserDefaults] registerDefaults: @{
                                             kUDBudgetKey : @(kUDBudget),
                                             kUDChangeoverDayKey : kUDChangeoverDay,
                                             kUDRolloverBehaviorKey : kUDRolloverBehavior}];
//                                          kUDPomodoroLengthKey : @(kUDPomodoroLength),
//                                             kUDBreakLengthKey : @(kUDBreakLength),
//                                         kUDLongBreakLengthKey : @(kUDLongBreakLength),
//                                          kUDLongBreakDelayKey : @(kUDLongBreakDelay),
//                                         kUDTargetPomodorosKey : @(kUDTargetPomodoros),
//                                            kUDTickingSoundKey : @(kUDTickingSound),
//                                       kUDPreventScreenLockKey : @(kUDPreventScreenLock),
//                                              kUDAlarmSoundKey : kUDAlarmSoundRing,
//                                         kUDClearAtMidnightKey : @(kUDClearAtMidnight)}];
    }
    
    return self;
}

- (CBChangeover *)defaultChangeoverDay {
    CBChangeover *changeover = [[CBChangeover alloc] init];
    changeover.changeoverType = changeoverTypeWeekly;
    changeover.weeklyChangeoverValue = weeklyChangeoverTypeMonday;
    changeover.lastResetDate = [NSDate date];
    return changeover;
}

- (CGFloat)budget {
    return [[NSUserDefaults standardUserDefaults] floatForKey:kUDBudgetKey];
}

- (void)setBudget:(CGFloat)budget {
    [[NSUserDefaults standardUserDefaults] setFloat:budget forKey:kUDBudgetKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (CBChangeover *)changeoverDay {
    return [[[CBChangeover alloc] init] setupWithDictionary:[[NSUserDefaults standardUserDefaults] objectForKey:kUDChangeoverDayKey]] ;
}

- (void)setChangeoverDay:(CBChangeover *)changeoverDay {
    [[NSUserDefaults standardUserDefaults] setObject:changeoverDay forKey:kUDChangeoverDayKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *)rolloverBehavior {
    return [[NSUserDefaults standardUserDefaults] stringForKey:kUDRolloverBehaviorKey];
}

- (void)setRolloverBehavior:(NSString *)rolloverBehavior {
    [[NSUserDefaults standardUserDefaults] setObject:rolloverBehavior forKey:kUDRolloverBehaviorKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


@end
