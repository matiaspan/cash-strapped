//
//  CBFlipsideViewController.m
//  cashstrapped
//
//  Created by Maximiliano Gomez Vidal on 5/6/14.
//  Copyright (c) 2014 Cannonball HQ. All rights reserved.
//

#import "CBAddExpenseViewController.h"

#import "Entry.h"
#import "CBDailySummaryDAO.h"
#import "UIImage+Colors.h"

#import <FXBlurView/FXBlurView.h>
#import <TSCurrencyTextField/TSCurrencyTextField.h>
#import "BackgroundImage.h"

@interface CBAddExpenseViewController ()

@end

@implementation CBAddExpenseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    BackgroundImage *backgroundImage = [BackgroundImage imageForToday];
    if (backgroundImage.imageData) {
        self.backgroundImageView.image = [UIImage imageWithData:backgroundImage.imageData];
    } else {
        self.backgroundImageView.image = [UIImage imageNamed:@"mock_baground"];
    }
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    
    self.amountTextField.currencyNumberFormatter.currencySymbol = @"";
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.3f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.amountTextField becomeFirstResponder];
    });
}

#pragma mark - Actions

- (IBAction)done:(id)sender {
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:^(BOOL success, NSError *error) {
        [[NSNotificationCenter defaultCenter] postNotificationName:kUDAddExpenseNotification object:nil];
    }];
    [self.presentingViewController dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)addExpenseAction:(id)sender {
    NSDecimalNumber *decimalAmount = [NSDecimalNumber decimalNumberWithDecimal:self.amountTextField.amount.decimalValue];
    decimalAmount = [decimalAmount decimalNumberByMultiplyingBy:[NSDecimalNumber decimalNumberWithString:@"-1"]];
    
    Entry *entry = [Entry MR_createEntity];
    entry.amount = decimalAmount;
    entry.createdAt = [NSDate date];
    
    [[CBDailySummaryDAO sharedInstance] updateTodaySummaryWithAmount:decimalAmount];
    
    [self done:sender];
}

- (IBAction)addIncomeAction:(id)sender {
    NSDecimalNumber *decimalAmount = [NSDecimalNumber decimalNumberWithDecimal:self.amountTextField.amount.decimalValue];

    Entry *entry = [Entry MR_createEntity];
    entry.amount = decimalAmount;
    entry.createdAt = [NSDate date];
    
    [[CBDailySummaryDAO sharedInstance] updateTodaySummaryWithAmount:decimalAmount];
    
    [self done:sender];
}

@end
