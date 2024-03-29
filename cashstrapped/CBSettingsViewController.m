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
#import "BackgroundImage.h"

#define sectionTitle @"sectionTitle"
#define sectionItems @"sectionItems"

#define itemTypeText @"itemTypeText"
#define itemTypeSwitch @"itemTypeSwitch"

@interface CBSettingsViewController () {
    NSArray *sections;
}

@end

@implementation CBSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    BackgroundImage *backgroundImage = [BackgroundImage imageForToday];
    if (backgroundImage.imageData) {
        self.backgroundImageView.image = nil;
        self.backgroundImageView.backgroundColor = [[UIImage imageWithData:backgroundImage.imageData] averageColor];
    } else {
        self.backgroundImageView.image = nil;
        self.backgroundImageView.backgroundColor = [[UIImage imageNamed:@"mock_baground"] averageColor];
    }
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    
    sections = @[
                 @{sectionTitle: NSLocalizedString(@"Budget Settings", ""),
                   sectionItems: @[
                           @{itemTitle: NSLocalizedString(@"Budget", ""), itemType: itemTypeText, itemKey: kUDBudgetKey},
                           @{itemTitle: NSLocalizedString(@"Changeover Day", ""), itemType: itemTypeText, itemKey: kUDChangeoverDayKey},
                           @{itemTitle: NSLocalizedString(@"Rollover Behavior", ""), itemType: itemTypeText, itemKey: kUDRolloverBehaviorKey}]}];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
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
    return 35;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return sections[section][sectionTitle];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *item = sections[indexPath.section][sectionItems][indexPath.row];
    
    if ([item[itemKey] isEqualToString:kUDBudgetKey]) {
        [self performSegueWithIdentifier:@"Budget Segue" sender:nil];
    } else if ([item[itemKey] isEqualToString:kUDRolloverBehaviorKey]) {
        [self performSegueWithIdentifier:@"Rollover Segue" sender:nil];
    } else if ([item[itemKey] isEqualToString:kUDChangeoverDayKey]) {
        [self performSegueWithIdentifier:@"Changeover Segue" sender:nil];
    }
}
@end
