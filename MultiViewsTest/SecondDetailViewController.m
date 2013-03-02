//
//  SecondDetailViewController.m
//  MultiViewsTest
//
//  Created by Richard Critz on 2/27/13.
//  Copyright (c) 2013 Richard Critz. All rights reserved.
//

#import "SecondDetailViewController.h"

@interface SecondDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;
@end

@implementation SecondDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = self.title;
    self.navigationBar.topItem.title = self.title;
    [self.navigationBar.topItem setLeftBarButtonItem:self.masterViewControllerBarButtonItem];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.view.backgroundColor == [UIColor purpleColor]) {
        self.label.textColor = [UIColor whiteColor];
    }
}

- (void)setTitle:(NSString *)title
{
    super.title = title;
    self.navigationItem.title = title;
    self.navigationBar.topItem.title = title;
}


#pragma mark - SubstitutableDetailViewController

- (void)setMasterViewControllerBarButtonItem:(UIBarButtonItem *)masterViewControllerBarButtonItem
{
    _masterViewControllerBarButtonItem = masterViewControllerBarButtonItem;
    [self.navigationBar.topItem  setLeftBarButtonItem:masterViewControllerBarButtonItem];
}

@end
