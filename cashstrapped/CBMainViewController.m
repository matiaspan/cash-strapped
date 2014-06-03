//
//  CBMainViewController.m
//  cashstrapped
//
//  Created by Maximiliano Gomez Vidal on 5/6/14.
//  Copyright (c) 2014 Cannonball HQ. All rights reserved.
//

#import "CBMainViewController.h"
#import <NGAParallaxMotion/NGAParallaxMotion.h>
#import <FXBlurView/FXBlurView.h>
#import "DailySummary.h"
#import "CBDailySummaryDAO.h"
#import "CBDashboardView.h"

@interface CBMainViewController () {
    BOOL animatedHeader;
}

@end

@implementation CBMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.delegate = self;
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    
    self.addExpenseHeaderView.alpha = 0.f;
    
    self.backgroundImageView.parallaxIntensity = -48;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    self.scrollView.contentOffset = CGPointZero;
    
    self.scrollView.contentSize = CGSizeMake(self.scrollView.bounds.size.width, self.scrollView.bounds.size.height * 2);
    
    self.addExpenseHeaderView.center = CGPointMake(self.addExpenseHeaderView.frame.size.width/2, self.addExpenseHeaderView.frame.size.height/2);
    
    CGRect embeddedHistoryFrame = self.scrollView.bounds;
    embeddedHistoryFrame.origin.y = embeddedHistoryFrame.size.height;
    self.embeddedHistoryView.frame = embeddedHistoryFrame;
    
    [self updateDashboard];
}

- (void)updateDashboard {
    NSDecimalNumber *amountLeft = [[CBDailySummaryDAO sharedInstance] summaryForToday].amount;
    NSDecimalNumber *budget = [[CBDailySummaryDAO sharedInstance] summaryForToday].dailyBudget;
    
    [self.dashboardView setAmountValue:amountLeft];
    self.dashboardView.budgetLabel.text = [NSString stringWithFormat:@"BUDGET\n%@", budget];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    if (scrollView.contentOffset.y >= 0) {
        self.addExpenseHeaderView.alpha = 0.f;
    } else {
        CGFloat offset = scrollView.contentOffset.y * -.75f;
        self.addExpenseHeaderView.alpha = offset/self.addExpenseHeaderView.frame.size.height;
        
        if (self.addExpenseHeaderView.alpha >= 1.f && !animatedHeader) {
            [UIView animateWithDuration:.1f animations:^{
                self.addExpenseHeaderView.transform = CGAffineTransformMakeScale(1.1f, 1.1f);
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:.1f animations:^{
                    self.addExpenseHeaderView.transform = CGAffineTransformMakeScale(1.f, 1.f);
                } completion:^(BOOL finished) {

                }];
            }];
            
            animatedHeader = YES;
        }
    }

}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    animatedHeader = NO;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (self.addExpenseHeaderView.alpha >= 1) {
        [self performSegueWithIdentifier:@"Add Expense" sender:self];
    }
}

#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(CBAddExpenseViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIViewController *destinationViewController = [segue destinationViewController];
    destinationViewController.modalPresentationStyle = UIModalPresentationCurrentContext;
    
    destinationViewController.view.transform = CGAffineTransformMakeTranslation(0, destinationViewController.view.frame.size.height);
    
    [UIView animateWithDuration:.3f delay:.0f options:UIViewAnimationOptionCurveEaseOut animations:^{
        destinationViewController.view.transform = CGAffineTransformIdentity;
    } completion:nil];
}

@end
