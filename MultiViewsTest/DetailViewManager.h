//
//  DetailViewManager.h
//  MultiViewsTest
//
//  Created by Richard Critz on 2/27/13.
//  Copyright (c) 2013 Richard Critz. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SubstituteableDetailViewController

@property (nonatomic, weak) UIBarButtonItem *masterViewControllerBarButtonItem;

@end

@interface DetailViewManager : NSObject <UISplitViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIViewController<SubstituteableDetailViewController> *detailViewController;

@end
