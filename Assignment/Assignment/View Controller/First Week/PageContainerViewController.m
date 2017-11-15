//
//  PageContainerViewController.m
//  Assignment
//
//  Created by Jaeho on 2017. 11. 13..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import "PageContainerViewController.h"
#import "PageChildViewController.h"

#define PAGE_COUNT 5
#define PAGE_INIT_INDEX 0

@interface PageContainerViewController () <UIPageViewControllerDelegate, UIPageViewControllerDataSource>

@property (strong, nonatomic) UIPageViewController *pageViewController;

@end

@implementation PageContainerViewController

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll
                                                              navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                                                                            options:nil];
    
    [self.pageViewController setDelegate:self];
    [self.pageViewController setDataSource:self];
    
    PageChildViewController *pageInitialViewController = [[PageChildViewController alloc] init];
    [self.pageViewController setViewControllers:@[pageInitialViewController]
                                      direction:UIPageViewControllerNavigationDirectionForward
                                       animated:YES
                                     completion:nil];
    
    CGRect rootViewFrame = self.view.frame;
    CGRect navigationBarFrame = self.navigationController.navigationBar.frame;
    CGRect tabBarFrame = self.tabBarController.tabBar.frame;
    
    CGFloat pageViewOriginX = CGRectGetMinX(rootViewFrame);
    CGFloat pageViewOriginY = CGRectGetHeight(navigationBarFrame);
    CGFloat pageViewSizeWidth = CGRectGetWidth(rootViewFrame);
    CGFloat pageViewSizeHeight = CGRectGetHeight(rootViewFrame) - pageViewOriginY - CGRectGetHeight(tabBarFrame);
    
    [self.pageViewController.view setFrame:CGRectMake(pageViewOriginX, pageViewOriginY, pageViewSizeWidth, pageViewSizeHeight)];
    
    [self.pageViewController.view setAutoresizingMask:
     UIViewAutoresizingFlexibleWidth |
     UIViewAutoresizingFlexibleHeight |
     UIViewAutoresizingFlexibleTopMargin |
     UIViewAutoresizingFlexibleBottomMargin
     ];
    
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
}

#pragma mark - Memory Management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSInteger index = ((PageChildViewController *)viewController).index;
    
    if (index == PAGE_INIT_INDEX) {
        return nil;
    }
    
    index--;
    
    return [[PageChildViewController alloc] initWithIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSInteger index = ((PageChildViewController *)viewController).index;
    
    index++;
    
    if (index == PAGE_COUNT) {
        return nil;
    }
    
    return [[PageChildViewController alloc] initWithIndex:index];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return PAGE_COUNT;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    return PAGE_INIT_INDEX;
}

@end
