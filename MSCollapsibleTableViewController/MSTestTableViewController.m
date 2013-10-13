//
//  MSTestTableViewController.m
//  MSCollapsibleTableViewController
//
//  Created by Marc Stroebel on 2013/10/13.
//  Copyright (c) 2013 StroebelSoftware. All rights reserved.
//

#import "MSTestTableViewController.h"

@interface MSTestTableViewController ()

@property (strong, nonatomic) NSMutableArray* tableDatasource;

@end

@implementation MSTestTableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSMutableArray* testDatasource = [NSMutableArray array];
    [testDatasource addObject:@"Row 1"];
    [testDatasource addObject:@"Row 2"];
    [testDatasource addObject:@"Row 3"];
    [testDatasource addObject:@"Row 4"];
    self.tableDatasource = testDatasource;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"Section %d", section + 1];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    /*************************************************************************
     
     IMPORTANT: You must create a block for your normal "numberOfRowsInSection" 
                implementation. This block will be called if the section must
                not be collapsed
     
     *************************************************************************/
    
    self.numberOfRowsInSectionBlock = ^(NSInteger section) {
        if (section == 0 || section == 1)
        {
            return 1;
        }
        
        return 2;
    };
    
    /*************************************************************************
     
     IMPORTANT: You need to make sure you call the super classes implementation of
                "numberOfRowsInSection"
     
     *************************************************************************/

    return [super tableView:tableView numberOfRowsInSection:section];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
    headerView.backgroundColor = [UIColor redColor];
    
    UILabel* headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
    headerLabel.backgroundColor = [UIColor redColor];
    headerLabel.textColor = [UIColor whiteColor];
    headerLabel.text = [self tableView:tableView titleForHeaderInSection:section];
    
    /**************************************************************************
        Start of sample toggling code:
     
        This sets up the tap gesture recognizer for the header view to organise the collapsing 
     
     **************************************************************************/
    
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedHeaderView:)];
    
    // TODO: Find a better way to do this... we need to send information to the action "tappedHeaderView"
    tap.accessibilityValue = [NSString stringWithFormat:@"%d", section];

    [headerView addGestureRecognizer:tap];
    
    /**************************************************************************
     End of sample toggling code 
     
     **************************************************************************/
    
    [headerView addSubview:headerLabel];
    
    return headerView;
}

- (void)tappedHeaderView:(UITapGestureRecognizer*)tap
{
    [self toggleCollapseSection:[tap.accessibilityValue integerValue]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"testCell"];
    NSString* cellData = [self.tableDatasource objectAtIndex:indexPath.row];
    cell.textLabel.text = cellData;
    cell.detailTextLabel.text = @"";
    
    return cell;
}

@end
