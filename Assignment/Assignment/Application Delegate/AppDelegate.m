//
//  AppDelegate.m
//  Assignment
//
//  Created by Jaeho on 2017. 11. 7..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import "AppDelegate.h"

#import "AssignmentViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSLog(@"application:didFinishLaunchingWithOptions: called");
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];

    AssignmentViewController *firstWeekViewController = [[AssignmentViewController alloc] initWithWeekNumber:1];
    AssignmentViewController *secondWeekViewController = [[AssignmentViewController alloc] initWithWeekNumber:2];
    AssignmentViewController *thirdWeekViewController = [[AssignmentViewController alloc] initWithWeekNumber:3];
    AssignmentViewController *fourthWeekViewController = [[AssignmentViewController alloc] initWithWeekNumber:4];

    UINavigationController *firstWeekNavigationController = [[UINavigationController alloc] initWithRootViewController:firstWeekViewController];
    UINavigationController *secondWeekNavigationController = [[UINavigationController alloc] initWithRootViewController:secondWeekViewController];
    UINavigationController *thirdWeekNavigationController = [[UINavigationController alloc] initWithRootViewController:thirdWeekViewController];
    UINavigationController *fourthWeekNavigationController = [[UINavigationController alloc] initWithRootViewController:fourthWeekViewController];

    [firstWeekViewController setTitle:@"First Week"];
    [secondWeekViewController setTitle:@"Second Week"];
    [thirdWeekViewController setTitle:@"Third Week"];
    [fourthWeekViewController setTitle:@"Fourth Week"];

    [firstWeekNavigationController setTabBarItem:[[UITabBarItem alloc] initWithTitle:@"1주차" image:nil tag:0]];
    [secondWeekNavigationController setTabBarItem:[[UITabBarItem alloc] initWithTitle:@"2주차" image:nil tag:1]];
    [thirdWeekNavigationController setTabBarItem:[[UITabBarItem alloc] initWithTitle:@"3주차" image:nil tag:2]];
    [fourthWeekNavigationController setTabBarItem:[[UITabBarItem alloc] initWithTitle:@"4주차" image:nil tag:3]];

    NSArray *tabBarRootViewControllers = @[firstWeekNavigationController,
                                           secondWeekNavigationController,
                                           thirdWeekNavigationController,
                                           fourthWeekNavigationController];

    [tabBarController setViewControllers:tabBarRootViewControllers];

    [self.window setRootViewController:tabBarController];
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    NSLog(@"applicationWillResignActive: called");
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    NSLog(@"applicationDidEnterBackground: called");
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    NSLog(@"applicationWillEnterForeground: called");
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    NSLog(@"applicagionDidBecomdActive: called");
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    NSLog(@"applicagionWillTerminate: called");
}


@end
