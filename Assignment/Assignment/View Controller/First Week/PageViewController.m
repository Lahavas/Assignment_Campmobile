//
//  PageViewController.m
//  Assignment
//
//  Created by Jaeho on 2017. 11. 7..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import "PageViewController.h"
#import "PageChildViewController.h"

@interface PageViewController () <UIPageViewControllerDelegate, UIPageViewControllerDataSource>

#pragma mark - Properties

@property (strong, nonatomic) UIPageViewController *pageViewController;

@end

#pragma mark -

@implementation PageViewController

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll
                                                              navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                                                                            options:nil];
    
    [self.pageViewController setDelegate:self];
    [self.pageViewController setDataSource:self];
    
    PageChildViewController *initialViewController = [self viewControllerAtIndex:1];
    NSArray *viewControllers = [NSArray arrayWithObject:initialViewController];
    [self.pageViewController setViewControllers:viewControllers
                                      direction:UIPageViewControllerNavigationDirectionForward
                                       animated:YES
                                     completion:nil];
    
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.view setBackgroundColor:UIColor.whiteColor];
    
    [self.pageViewController.view setFrame:self.view.frame];
}

#pragma mark - Memory Management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Methods

- (PageChildViewController *)viewControllerAtIndex:(NSInteger)index {
    
    PageChildViewController *pageChildViewController = [[PageChildViewController alloc] init];
    [pageChildViewController setIndex:index];
    
    return pageChildViewController;
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSInteger index = [(PageChildViewController *)viewController index];
    
    if (index == 1) {
        return nil;
    }
    
    index--;
    
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSInteger index = [(PageChildViewController *)viewController index];
    
    index++;
    
    if (index == 6) {
        return nil;
    }
    
    return [self viewControllerAtIndex:index];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return 5;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    return 1;
}

@end
