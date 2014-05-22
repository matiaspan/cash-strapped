//
//  CBDashboardView.h
//  cashstrapped
//
//  Created by Matias Pan on 5/22/14.
//  Copyright (c) 2014 Cannonball HQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CBLabel;

@interface CBDashboardView : UIView

@property (strong, nonatomic) IBOutlet UILabel *budgetLabel;
@property (strong, nonatomic) IBOutlet CBLabel *amountLabel;

- (void)setAmountValue:(NSNumber *)number;

@end
