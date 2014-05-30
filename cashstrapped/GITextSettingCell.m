//
//  GITextSettingCell.m
//  pomodoro
//
//  Created by Matias Santiago Pan on 7/22/13.
//  Copyright (c) 2013 Green Stick Ideas. All rights reserved.
//

#import "GITextSettingCell.h"
//#import "GISettingsHelper.h"

@implementation GITextSettingCell

- (void)awakeFromNib {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)configureWithSettingsItem:(NSDictionary *)item {
    self.titleLabel.text = item[itemTitle];
    
//    if ([item[itemKey] isEqual:itemKeyPomodoroLength]) {
//        self.valueLabel.text = [NSString stringWithFormat:@"%.0f %@",
//                                [GISettingsHelper sharedInstance].pomodoroLength / 60, NSLocalizedString(@"minutes", "")];
//    } else if ([item[itemKey] isEqual:itemKeyShortBreakLength]) {
//        self.valueLabel.text = [NSString stringWithFormat:@"%.0f %@",
//                                [GISettingsHelper sharedInstance].breakLength / 60, NSLocalizedString(@"minutes", "")];
//    } else if ([item[itemKey] isEqual:itemKeyLongBreakLength]) {
//        self.valueLabel.text = [NSString stringWithFormat:@"%.0f %@",
//                                [GISettingsHelper sharedInstance].longBreakLength / 60, NSLocalizedString(@"minutes", "")];
//    } else if ([item[itemKey] isEqual:itemKeyLongBreakDelayLength]) {
//        self.valueLabel.text = [NSString stringWithFormat:@"%d %@",
//                                [GISettingsHelper sharedInstance].longBreakDelay, NSLocalizedString(@"pomodoros", "")];
//    } else if ([item[itemKey] isEqual:itemKeyTargetPomodoros]) {
//        self.valueLabel.text = [NSString stringWithFormat:@"%d",
//                                [GISettingsHelper sharedInstance].targetPomodoros];
//    } else if ([item[itemKey] isEqual:itemKeyAlarmSound]) {
//        self.valueLabel.text = NSLocalizedString([GISettingsHelper sharedInstance].alarmSound, "");
//        
//    } else {
        self.valueLabel.text = @"";
//    }
}

@end
