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

@interface CBAddExpenseViewController ()

@end

@implementation CBAddExpenseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.blurView setBlurEnabled:YES];
    [self.blurView setDynamic:NO];
    [self.blurView setBlurRadius:40];
    [self.blurView setBackgroundColor:[UIColor whiteColor]];
    [self.blurView setTintColor:[UIColor clearColor]];

    [self.navigationController.navigationBar setBarTintColor:self.backgroundImageView.image.averageColorForTop];

    [self.amountTextField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)done:(id)sender {
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:nil];
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
