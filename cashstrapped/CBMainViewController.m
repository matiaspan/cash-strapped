//
//  CBMainViewController.m
//  cashstrapped
//
//  Created by Maximiliano Gomez Vidal on 5/6/14.
//  Copyright (c) 2014 Cannonball HQ. All rights reserved.
//

#import "CBMainViewController.h"

@interface CBMainViewController ()

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
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    self.scrollView.contentOffset = CGPointZero;
    
    self.scrollView.contentSize = CGSizeMake(self.scrollView.bounds.size.width, self.scrollView.bounds.size.height * 2);
    
    self.addExpenseHeaderView.center = CGPointMake(self.addExpenseHeaderView.frame.size.width/2, self.addExpenseHeaderView.frame.size.height/2);
    
    CGRect embeddedHistoryFrame = self.scrollView.bounds;
    embeddedHistoryFrame.origin.y = embeddedHistoryFrame.size.height;
    self.embeddedHistoryView.frame = embeddedHistoryFrame;
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
        CGFloat offset = scrollView.contentOffset.y * -1.f;
        self.addExpenseHeaderView.alpha = offset/self.addExpenseHeaderView.frame.size.height;
    }

}

#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(CBAddExpenseViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
    }
}

@end
