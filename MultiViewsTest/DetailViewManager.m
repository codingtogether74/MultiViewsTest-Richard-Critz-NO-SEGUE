//
//  DetailViewManager.m
//  MultiViewsTest
//
//  Created by Richard Critz on 2/27/13.
//  Copyright (c) 2013 Richard Critz. All rights reserved.
//

#import "DetailViewManager.h"

@interface DetailViewManager ()
@property (strong, nonatomic) UIBarButtonItem *barButtonItem;
@property (strong, nonatomic) UIPopoverController *popoverController;
@end

@implementation DetailViewManager

#pragma mark - property management


// I have not yet found a way to connect this property as an outlet in the Interface Builder. As a result, it
// has to be connected initially in the AppDelegate's didFinishLaunchingWithOptions: method. Both the code there,
// and the code in the master view controllers' that causes segues only invoke this setter when running on an
// iPad (because they require that the app be running inside a UISplitViewController.
- (void)setDetailViewController:(UIViewController<SubstituteableDetailViewController> *)detailViewController
{
    if (_detailViewController) {
        [_detailViewController setMasterViewControllerBarButtonItem:nil];
    }
    _detailViewController = detailViewController;
    [detailViewController setMasterViewControllerBarButtonItem:self.barButtonItem];
    
    if (self.popoverController) {
        [self.popoverController dismissPopoverAnimated:YES];
    }
}

// update the delegate's local copy and update the detail view controller's copy. The detail view controller
// is responsible for figuring out how to display the button within its scene.
- (void)setBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    _barButtonItem = barButtonItem;
    if (self.detailViewController) {
        [self.detailViewController setMasterViewControllerBarButtonItem:barButtonItem];
    }
}


#pragma mark - UISplitViewControllerDelegate

- (void)splitViewController:(UISplitViewController *)svc
     willHideViewController:(UIViewController *)aViewController
          withBarButtonItem:(UIBarButtonItem *)barButtonItem
       forPopoverController:(UIPopoverController *)pc
{
    // The button provided by UISplitViewController has no title and no image. As a result, it will NOT be
    // displayed, regardless of its presence.  It is therefore mandatory that we set either a title or an
    // image here, or in the detail view controller, as appropriate for the application or the button will
    // not appear (an hour plus wasted on figuring this out!)
    barButtonItem.title = @"Navigation";
    self.barButtonItem = barButtonItem;
    self.popoverController = pc;
}

- (void)splitViewController:(UISplitViewController *)svc
     willShowViewController:(UIViewController *)aViewController
  invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    self.barButtonItem = nil;
    self.popoverController = nil;
}

@end
