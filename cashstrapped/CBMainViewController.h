//
//  CBMainViewController.h
//  cashstrapped
//
//  Created by Maximiliano Gomez Vidal on 5/6/14.
//  Copyright (c) 2014 Cannonball HQ. All rights reserved.
//

#import "CBAddExpenseViewController.h"

@class CBDashboardView;

@interface CBMainViewController : UIViewController <UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *addExpenseHeaderView;
@property (strong, nonatomic) IBOutlet UIView *expensesView;
@property (strong, nonatomic) IBOutlet UIView *dashboardContainerView;

@property (strong, nonatomic) IBOutlet UIView *embeddedHistoryView;

@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (strong, nonatomic) IBOutlet CBDashboardView *dashboardView;

@end
