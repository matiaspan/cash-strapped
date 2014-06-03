//
//  CBHistoryTableViewController.m
//  cashstrapped
//
//  Created by Maximiliano Gomez Vidal on 5/30/14.
//  Copyright (c) 2014 Cannonball HQ. All rights reserved.
//

#import "CBHistoryTableViewController.h"

// DAO
#import "CBMonthlySummaryDAO.h"
#import "CBDailySummaryDAO.h"

// Model
#import "MonthlySummary.h"
#import "DailySummary.h"

// Custom Views
#import "CBHistoryTableViewCell.h"

@interface CBHistoryTableViewController () {
    NSArray *monthlySummaries;
    NSMutableDictionary *orderedSummaries;
}

@end

@implementation CBHistoryTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateContents:)
                                                 name:kUDAddExpenseNotification
                                               object:nil];
    
    [self updateContents:nil];
}

- (void)updateContents:(id)sender {
    monthlySummaries = [[CBMonthlySummaryDAO sharedInstance] allMonthlySummaries];
    
    orderedSummaries = [NSMutableDictionary dictionary];
    
    for (MonthlySummary *summary in monthlySummaries) {
        [orderedSummaries setObject:[summary.dailySummaries sortedArrayUsingDescriptors:
                                     @[[[NSSortDescriptor alloc] initWithKey:@"date" ascending:NO]]]
                             forKey:[summary date]];
    }
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [monthlySummaries count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [((MonthlySummary *)monthlySummaries[section]).dailySummaries count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CBHistoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"historyCellIdentifier" forIndexPath:indexPath];
    
    MonthlySummary *monthlySummary = monthlySummaries[indexPath.section];
    DailySummary *dailySummary = orderedSummaries[monthlySummary.date][indexPath.row];
    
    [cell configureWithDailySummary:dailySummary];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return ((MonthlySummary *)monthlySummaries[section]).monthName;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
