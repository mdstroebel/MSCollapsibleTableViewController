//
//  MSCollapsibleTableViewController.m
//  MSCollapsibleTableViewController
//
//  Created by Marc Stroebel on 2013/10/12.
//  Copyright (c) 2013 StroebelSoftware. All rights reserved.
//

#import "MSCollapsibleTableViewController.h"

@interface MSCollapsibleTableViewController ()

@end

@implementation MSCollapsibleTableViewController

@synthesize collapsedSections = _collapsedSections;

- (void)viewDidLoad
{
    [super viewDidLoad];
    _collapsedSections = [NSArray array];
}

#pragma mark - Table View delegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSNumber* sectionNumber = [NSNumber numberWithInteger:section];
    if ([_collapsedSections containsObject:sectionNumber])
    {
        return 0;
    }
    
    return self.numberOfRowsInSectionBlock(section);
}

#pragma mark - Collapsible Section Methods

-(void)toggleCollapseSection:(NSInteger)section
{
    NSNumber* sectionNumber = [NSNumber numberWithInteger:section];
    NSMutableArray* mutableCopy = [_collapsedSections mutableCopy];
    
    if ([_collapsedSections containsObject:sectionNumber])
    {
         [mutableCopy removeObject:sectionNumber];
    }
    else
    {
        [mutableCopy addObject:sectionNumber];
    }
    
    _collapsedSections = [NSArray arrayWithArray:mutableCopy];
    
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:[sectionNumber integerValue]] withRowAnimation:UITableViewRowAnimationAutomatic];
}

@end
