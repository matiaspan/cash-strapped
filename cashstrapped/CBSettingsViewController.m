//
//  CBSettingsViewController.m
//  cashstrapped
//
//  Created by Matias Pan on 5/19/14.
//  Copyright (c) 2014 Cannonball HQ. All rights reserved.
//

#import "CBSettingsViewController.h"
#import "UIImage+Colors.h"
#import <FXBlurView/FXBlurView.h>

@interface CBSettingsViewController ()

@end

@implementation CBSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.blurView setBlurEnabled:YES];
    [self.blurView setDynamic:NO];
    [self.blurView setBlurRadius:40];
    [self.blurView setBackgroundColor:[UIColor whiteColor]];
    [self.blurView setTintColor:[UIColor clearColor]];
    
    [self.navigationController.navigationBar setBarTintColor:self.backgroundImageView.image.averageColorForTop];
}

- (IBAction)doneAction:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
@end
