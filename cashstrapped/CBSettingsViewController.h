//
//  CBSettingsViewController.h
//  cashstrapped
//
//  Created by Matias Pan on 5/19/14.
//  Copyright (c) 2014 Cannonball HQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FXBlurView;

@interface CBSettingsViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UIImageView *backgroundImageView;
@property (strong, nonatomic) IBOutlet FXBlurView *blurView;

@end
