//
//  CBAppDelegate.m
//  cashstrapped
//
//  Created by Maximiliano Gomez Vidal on 5/6/14.
//  Copyright (c) 2014 Cannonball HQ. All rights reserved.
//

#import "CBAppDelegate.h"
#import "MagicalRecord+Setup.h"

#import "Entry.h"
#import "CBDailySummaryDAO.h"

@implementation CBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [MagicalRecord setupCoreDataStackWithAutoMigratingSqliteStoreNamed:@"CashStrapped"];
    
    self.window.rootViewController.modalPresentationStyle = UIModalPresentationCurrentContext;
    
    // TODO: REMOVE ME BEFORE SHIPPING.
    if (! [[NSUserDefaults standardUserDefaults] boolForKey:@"kUDInitialImport"]) {
        
        for (int i = 0; i < 200; i++) {
            Entry *entry = [Entry MR_createEntity];
            entry.amount = [[NSDecimalNumber alloc] initWithFloat:1.0f * (arc4random() % 500) / 500 * (arc4random() % 500)];
            entry.createdAt = [NSDate dateWithTimeIntervalSinceNow:- i * 8*3600];
            
            [[CBDailySummaryDAO sharedInstance] updateSummaryForDate:entry.createdAt withAmount:entry.amount];
            
            NSLog(@"Adding income with amount %@ and date %@.", entry.amount, entry.createdAt);
        }
        
        for (int i = 0; i < 100; i++) {
            Entry *entry = [Entry MR_createEntity];
            entry.amount = [[NSDecimalNumber alloc] initWithFloat:- 1.0f * (arc4random() % 500) / 500 * (arc4random() % 500)];
            entry.createdAt = [NSDate dateWithTimeIntervalSinceNow:- i * 16*3600];
            
            [[CBDailySummaryDAO sharedInstance] updateSummaryForDate:entry.createdAt withAmount:entry.amount];
            
            NSLog(@"Adding expense with amount %@ and date %@.", entry.amount, entry.createdAt);
        }
        
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"kUDInitialImport"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
