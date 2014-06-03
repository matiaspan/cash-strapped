//
//  CBHistoryTableViewCell.h
//  cashstrapped
//
//  Created by Maximiliano Gomez Vidal on 6/3/14.
//  Copyright (c) 2014 Cannonball HQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CBHistoryTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *dayNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dayNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *amountLabel;

@end
