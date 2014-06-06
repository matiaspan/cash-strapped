//
//  GITextSettingCell.m
//  pomodoro
//
//  Created by Matias Santiago Pan on 7/22/13.
//  Copyright (c) 2013 Green Stick Ideas. All rights reserved.
//

#import "GITextSettingCell.h"
#import "CBChangeover.h"


@interface GITextSettingCell () {
    NSNumberFormatter *numberFormatter;
}

@end
@implementation GITextSettingCell

- (void)awakeFromNib {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)configureWithSettingsItem:(NSDictionary *)item {
    self.titleLabel.text = item[itemTitle];
    
    if (!numberFormatter) {
        numberFormatter = [[NSNumberFormatter alloc] init];
        [numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
        [numberFormatter setMaximumFractionDigits:2];
        [numberFormatter setNilSymbol:@"—"];
        [numberFormatter setLenient:YES];
        [numberFormatter setCurrencySymbol:@""];
        [numberFormatter setInternationalCurrencySymbol:@""];
    }
    
    if ([item[itemKey] isEqual:kUDBudgetKey]) {
        self.valueLabel.text = [numberFormatter stringFromNumber:@([GISettingsHelper sharedInstance].budget)];
    } else if ([item[itemKey] isEqual:kUDChangeoverDayKey]) {
        self.valueLabel.text = [[GISettingsHelper sharedInstance].changeoverDay description];
    } else if ([item[itemKey] isEqual:kUDRolloverBehaviorKey]) {
        self.valueLabel.text = [GISettingsHelper sharedInstance].rolloverBehavior;
    } else {
        self.valueLabel.text = @"";
    }
}


@end
