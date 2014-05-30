//
//  GITextSettingCell.h
//  pomodoro
//
//  Created by Matias Santiago Pan on 7/22/13.
//  Copyright (c) 2013 Green Stick Ideas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GITextSettingCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *valueLabel;

- (void)configureWithSettingsItem:(NSDictionary *)item;

@end
