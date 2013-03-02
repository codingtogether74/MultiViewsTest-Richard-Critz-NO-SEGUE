//
//  SecondDetailViewController.h
//  MultiViewsTest
//
//  Created by Richard Critz on 2/27/13.
//  Copyright (c) 2013 Richard Critz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewManager.h"

@interface SecondDetailViewController : UIViewController <SubstituteableDetailViewController>

@property (weak, nonatomic) UIBarButtonItem *masterViewControllerBarButtonItem;

@end
