//
//  FirstTableViewController.m
//  MultiViewsTest
//
//  Created by Richard Critz on 2/27/13.
//  Copyright (c) 2013 Richard Critz. All rights reserved.
//

#import "FirstTableViewController.h"
#import "DetailViewManager.h"
#import "FirstDetailViewController.h"
#import "SecondDetailViewController.h"

@interface FirstTableViewController ()
@end

@implementation FirstTableViewController

#pragma mark - table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FirstTableCell"];
    
    switch (indexPath.row) {
         case 0:
            cell.textLabel.text = @"First Detail View";
            break;
            
        case 1:
            cell.textLabel.text = @"Second Detail View";
            break;
            
        default:
            break;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
            //@"First Detail View";
            
            if (self.splitViewController) {
                
                UISplitViewController  *splitVC =self.splitViewController;
                UIStoryboard *sb =[UIStoryboard storyboardWithName:@"iPad" bundle:nil];
                FirstDetailViewController *dvc = [sb instantiateViewControllerWithIdentifier:@"first"];
                
                NSArray *newViews =@[splitVC.viewControllers[0], dvc];
                self.splitViewController.viewControllers =newViews;
                
                DetailViewManager *detailManager = (DetailViewManager *)self.splitViewController.delegate;
                detailManager.detailViewController = dvc;
                [detailManager.detailViewController setTitle:@"This is really First"];
            }
            
            break;
            
        case 1:
            // @"Second Detail View";
            if (self.splitViewController) {
                
                UISplitViewController  *splitVC =self.splitViewController;
                UIStoryboard *sb =[UIStoryboard storyboardWithName:@"iPad" bundle:nil];
                SecondDetailViewController *dvc = [sb instantiateViewControllerWithIdentifier:@"second"];
                
                NSArray *newViews =@[splitVC.viewControllers[0], dvc];
                self.splitViewController.viewControllers =newViews;
                
                DetailViewManager *detailManager = (DetailViewManager *)self.splitViewController.delegate;
                detailManager.detailViewController = dvc;
                [detailManager.detailViewController setTitle:@"This is really Second"];
                
            }
            break;
            
        default:
            break;
    }
}
@end
