//
//  CBHistoryTableViewCell.m
//  cashstrapped
//
//  Created by Maximiliano Gomez Vidal on 6/3/14.
//  Copyright (c) 2014 Cannonball HQ. All rights reserved.
//

#import "CBHistoryTableViewCell.h"
#import "DailySummary.h"

@interface CBHistoryTableViewCell () {
    CGFloat maxWidth;
}

@end

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
    maxWidth = _progressView.frame.size.width;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (NSString *)getDayOfTheWeek:(NSDate *)date{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"E"];
    NSString *formattedDateString = [dateFormatter stringFromDate:date];
    return formattedDateString;
}

- (void)configureWithDailySummary:(DailySummary *)dailySummary {
    _dayNameLabel.text = [self getDayOfTheWeek:dailySummary.date];
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay
                                                                   fromDate:dailySummary.date];
    _dayNumberLabel.text = [NSString stringWithFormat:@"%d", [components day]];
    _amountLabel.text = [NSString stringWithFormat:@"%.2f", [dailySummary.amount doubleValue]];
    
    CGFloat min = MIN(dailySummary.amount.doubleValue, dailySummary.dailyBudget.doubleValue);
    CGFloat max = MAX(dailySummary.amount.doubleValue, dailySummary.dailyBudget.doubleValue);
    CGFloat partial = (int)min/max * maxWidth;

    _progressView.frame = CGRectMake(_progressView.frame.origin.x, _progressView.frame.origin.y,
                                     0, _progressView.frame.size.height);
    [UIView animateWithDuration:0.3 animations:^{
        _progressView.frame = CGRectMake(_progressView.frame.origin.x,
                                         _progressView.frame.origin.y,
                                         partial > 0 ? partial : 0,
                                         _progressView.frame.size.height);
    }];
}

@end
