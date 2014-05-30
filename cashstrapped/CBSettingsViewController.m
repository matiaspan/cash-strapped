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
#import "GITextSettingCell.h"
#import "GISwitchSettingCell.h"

#define sectionTitle @"sectionTitle"
#define sectionItems @"sectionItems"

#define itemTypeText @"itemTypeText"
#define itemTypeSwitch @"itemTypeSwitch"

#define itemKeyBudget @"itemKeyBudget"
#define itemKeyChangeoverDay @"itemKeyChangeoverDay"
#define itemKeyRolloverBehavior @"itemKeyRolloverBehavior"

@interface CBSettingsViewController () {
    NSArray *sections;
}

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
    
    sections = @[
                 @{sectionTitle: NSLocalizedString(@"Budget Settings", ""),
                   sectionItems: @[
                           @{itemTitle: NSLocalizedString(@"Budget", ""), itemType: itemTypeText, itemKey: itemKeyBudget},
                           @{itemTitle: NSLocalizedString(@"Changeover Day", ""), itemType: itemTypeText, itemKey: itemKeyChangeoverDay},
                           @{itemTitle: NSLocalizedString(@"Rollover Behavior", ""), itemType: itemTypeText, itemKey: itemKeyRolloverBehavior}]}];
    
}

- (IBAction)doneAction:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [sections[section][sectionItems] count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [sections count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *item = sections[indexPath.section][sectionItems][indexPath.row];
    
    GITextSettingCell *cell = nil;
    
    if ([item[itemType] isEqual:itemTypeSwitch]) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"switchCell" forIndexPath:indexPath];
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"textCell" forIndexPath:indexPath];
    }
    
    [cell configureWithSettingsItem:item];
    
    return cell;
}

- (NSString *)titleFromString:(NSString *)title {
    return title;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return section == 0 ? 12.0f : 5.0f;
}
@end
