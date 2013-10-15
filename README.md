MSCollapsibleTableViewController
================================

<h2>Overview</h2>

This is a basic subclass of UITableViewController to allow the collapsing of sections in a table view.

The main class is the MSCollapsibleTableViewController class. The rest of this repo is just the sample project using it.

Take a look at the "Example" folder to see a sample implementation of the MSCollapsibleTableViewController.m class.
Basically you need to give it a block for your standard "numberOfRowsInSection" delegate method and then call the
super version of that method. This will allow the toggling to take place when needed (it returns 0 rows for a collapsed
section).

There is a "toggleCollapseSection" method exposed on the header to actually collapse/expand a specific section.


<h2>Implementation</h2>

It is very easy to implement:

1) Copy the "MSCollapsibleTableViewController.m" and ".h" to your project.

2) Make your existing (or new) TableViewController inherit from the "MSCollapsibleTableViewController" class.

3) Implement the "numberOfRowsInSection" delegate method for your table view as per usual, except you will need to write
it in a block and set the "numberOfRowsInSectionBlock" property on the super class. Then call the super's version of
"numberOfRowsInSection".

Example:


        - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
        {
            self.numberOfRowsInSectionBlock = ^(NSInteger section) {
                if (section == 0 || section == 1)
                {
                    return 1;
                }
                
                return 2;
            };
        
            return [super tableView:tableView numberOfRowsInSection:section];
        }

4) Now just call "toggleCollapseSection:" with the section number you want to toggle the collapse / expand method on.

Example:

        [self toggleCollapseSection:1];
        
