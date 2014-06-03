//
//  CBHistoryTableViewCell.m
//  cashstrapped
//
//  Created by Maximiliano Gomez Vidal on 6/3/14.
//  Copyright (c) 2014 Cannonball HQ. All rights reserved.
//

#import "CBHistoryTableViewCell.h"

@implementation CBHistoryTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
