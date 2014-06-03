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
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    monthlySummaries = [[CBMonthlySummaryDAO sharedInstance] allMonthlySummaries];
    
    orderedSummaries = [NSMutableDictionary dictionary];
    
    for (MonthlySummary *summary in monthlySummaries) {
        [orderedSummaries setObject:[summary.dailySummaries sortedArrayUsingDescriptors:
                                    @[[[NSSortDescriptor alloc] initWithKey:@"date" ascending:NO]]]
                             forKey:[summary date]];
    }
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

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
