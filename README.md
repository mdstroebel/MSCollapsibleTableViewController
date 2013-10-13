MSCollapsibleTableViewController
================================

This is a basic subclass of UITableViewController to allow the collapsing of sections in a table view.

Take a look at the "Example" folder to see a sample implementation of the MSCollapsibleTableViewController.m class.
Basically you need to give it a block for your standard "numberOfRowsInSection" delegate method and then call the
super version of that method. This will allow the toggling to take place when needed (it returns 0 rows for a collapsed
section).

There is a "toggleCollapseSection" method exposed on the header to actually collapse/expand a specific section.
