//
//  CBFlipsideViewController.h
//  cashstrapped
//
//  Created by Maximiliano Gomez Vidal on 5/6/14.
//  Copyright (c) 2014 Cannonball HQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TSCurrencyTextField;
@class CBAddExpenseViewController;
@class FXBlurView;

@protocol CBFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(CBAddExpenseViewController *)controller;
@end

@interface CBAddExpenseViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (strong, nonatomic) IBOutlet FXBlurView *blurView;
@property (strong, nonatomic) IBOutlet TSCurrencyTextField *amountTextField;
@property (weak, nonatomic) id <CBFlipsideViewControllerDelegate> delegate;


- (IBAction)done:(id)sender;

@end
