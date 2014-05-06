//
//  CBFlipsideViewController.h
//  cashstrapped
//
//  Created by Maximiliano Gomez Vidal on 5/6/14.
//  Copyright (c) 2014 Cannonball HQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CBFlipsideViewController;

@protocol CBFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(CBFlipsideViewController *)controller;
@end

@interface CBFlipsideViewController : UIViewController

@property (weak, nonatomic) id <CBFlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end
