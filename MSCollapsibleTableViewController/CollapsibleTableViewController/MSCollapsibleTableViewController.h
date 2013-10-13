//
//  MSCollapsibleTableViewController.h
//  MSCollapsibleTableViewController
//
//  Created by Marc Stroebel on 2013/10/12.
//  Copyright (c) 2013 StroebelSoftware. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NSInteger(^numberOfRowsInSectionBlock)(NSInteger);

@interface MSCollapsibleTableViewController : UITableViewController

@property (nonatomic, readonly) NSArray* collapsedSections;
@property (nonatomic, strong) numberOfRowsInSectionBlock numberOfRowsInSectionBlock;

-(void)toggleCollapseSection:(NSInteger)section;

@end
