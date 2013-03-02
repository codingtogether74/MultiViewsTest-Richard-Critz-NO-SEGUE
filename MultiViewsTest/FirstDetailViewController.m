//
//  FirstDetailViewController.m
//  MultiViewsTest
//
//  Created by Richard Critz on 2/27/13.
//  Copyright (c) 2013 Richard Critz. All rights reserved.
//

#import "FirstDetailViewController.h"

@interface FirstDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;
@end

@implementation FirstDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.titleLabel.text = self.title;
    self.navigationItem.title = nil;            // this one does the trick when running inside a UINavigationController (e.g. on an iPhone)
    self.navigationBar.topItem.title = nil;     // this one does the trick when the navigation bar was added in IB and this view is NOT in a UINavigationController (e.g. on an iPad)
    [self.navigationBar.topItem setLeftBarButtonItem:self.masterViewControllerBarButtonItem];
}

- (void)setTitle:(NSString *)title
{
    super.title = title;
    self.titleLabel.text = title;
    self.navigationItem.title = nil;            // see the comments above
    self.navigationBar.topItem.title = nil;     // see the comments above
}


#pragma mark - SubstitutableDetailViewController

- (void)setMasterViewControllerBarButtonItem:(UIBarButtonItem *)masterViewControllerBarButtonItem
{
    _masterViewControllerBarButtonItem = masterViewControllerBarButtonItem;
    [self.navigationBar.topItem  setLeftBarButtonItem:masterViewControllerBarButtonItem];
}

@end
