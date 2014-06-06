//
//  CBBudgetSettingViewController.m
//  cashstrapped
//
//  Created by Matias Pan on 6/6/14.
//  Copyright (c) 2014 Cannonball HQ. All rights reserved.
//

#import "CBBudgetSettingViewController.h"
#import "BackgroundImage.h"
#import "UIImage+Colors.h"
#import <TSCurrencyTextField/TSCurrencyTextField.h>

@interface CBBudgetSettingViewController ()

@end

@implementation CBBudgetSettingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    BackgroundImage *backgroundImage = [BackgroundImage imageForToday];
    if (backgroundImage.imageData) {
        self.view.backgroundColor = [[UIImage imageWithData:backgroundImage.imageData] averageColor];
    } else {
        self.view.backgroundColor = [[UIImage imageNamed:@"mock_baground"] averageColor];
    }
    
    [self.budgetTextField becomeFirstResponder];
    self.budgetTextField.currencyNumberFormatter.currencySymbol = @"";
    self.budgetTextField.amount = @([GISettingsHelper sharedInstance].budget);
}

- (IBAction)saveAction:(id)sender {
    NSNumber *newBudget = self.budgetTextField.amount;
    CGFloat newBudgetFloat = newBudget.floatValue;
    
    if (newBudgetFloat <= 0.f) {
        [[[UIAlertView alloc] initWithTitle:@"Don't be like that" message:@"Please enter a valid budget" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        return;
    }
    
    [[GISettingsHelper sharedInstance] setBudget:newBudget.floatValue];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
