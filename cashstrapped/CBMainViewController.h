//
//  CBMainViewController.h
//  cashstrapped
//
//  Created by Maximiliano Gomez Vidal on 5/6/14.
//  Copyright (c) 2014 Cannonball HQ. All rights reserved.
//

#import "CBFlipsideViewController.h"

@interface CBMainViewController : UIViewController <CBFlipsideViewControllerDelegate, UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *addExpenseHeaderView;
@property (strong, nonatomic) IBOutlet UIView *expensesView;

@property (strong, nonatomic) IBOutlet UIView *embeddedHistoryView;

@end
