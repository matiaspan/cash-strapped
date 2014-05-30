//
//  GISwitchSettingCell.m
//  pomodoro
//
//  Created by Matias Santiago Pan on 7/22/13.
//  Copyright (c) 2013 Green Stick Ideas. All rights reserved.
//

#import "GISwitchSettingCell.h"
//#import "SevenSwitch.h"

@interface GISwitchSettingCell () {
    BOOL hasShownSwitchValue;
    NSDictionary *configuredItem;
}

@end
@implementation GISwitchSettingCell

- (void)awakeFromNib {
    [self.valueSwitch addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (IBAction)switchChanged:(id)sender {
//    if ([configuredItem[itemKey] isEqual:itemKeyTickingSound]) {
//        [[GISettingsHelper sharedInstance] setTickingSoundEnabled:[(UISwitch *)self.valueSwitch isOn]];
//    } else if ([configuredItem[itemKey] isEqual:itemKeyClear]) {
//        [[GISettingsHelper sharedInstance] setClearAtMidnightEnabled:[(UISwitch *)self.valueSwitch isOn]];
//    } else if ([configuredItem[itemKey] isEqual:itemKeyPreventScreenLock]) {
//        [[GISettingsHelper sharedInstance] setPreventScreenLock:[(UISwitch *)self.valueSwitch isOn]];
//        [[UIApplication sharedApplication] setIdleTimerDisabled:[GISettingsHelper sharedInstance].preventScreenLock];
//    }
}

- (void)configureWithSettingsItem:(NSDictionary *)item {
    configuredItem = item;
    self.titleLabel.text = item[itemTitle];
    
//    if ([item[itemKey] isEqual:itemKeyTickingSound]) {
//        [(UISwitch *)self.valueSwitch setOn:[GISettingsHelper sharedInstance].tickingSoundEnabled animated:hasShownSwitchValue];
//    } else if ([item[itemKey] isEqual:itemKeyClear]) {
//        [(UISwitch *)self.valueSwitch setOn:[GISettingsHelper sharedInstance].clearAtMidnightEnabled animated:hasShownSwitchValue];
//    } else if ([item[itemKey] isEqual:itemKeyPreventScreenLock]) {
//        [(UISwitch *)self.valueSwitch setOn:[GISettingsHelper sharedInstance].preventScreenLock animated:hasShownSwitchValue];
//    }
    
    hasShownSwitchValue = YES;
}

@end
