//
//  CBFlipsideViewController.h
//  cashstrapped
//
//  Created by Maximiliano Gomez Vidal on 5/6/14.
//  Copyright (c) 2014 Cannonball HQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CBAddExpenseViewController;

@protocol CBFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(CBAddExpenseViewController *)controller;
@end

@interface CBAddExpenseViewController : UIViewController

@property (weak, nonatomic) id <CBFlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end