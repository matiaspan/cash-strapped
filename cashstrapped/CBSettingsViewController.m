//
//  CBSettingsViewController.m
//  cashstrapped
//
//  Created by Matias Pan on 5/19/14.
//  Copyright (c) 2014 Cannonball HQ. All rights reserved.
//

#import "CBSettingsViewController.h"

@interface CBSettingsViewController ()

@end

@implementation CBSettingsViewController

- (IBAction)doneAction:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
@end
