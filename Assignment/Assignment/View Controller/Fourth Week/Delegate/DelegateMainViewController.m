//
//  DelegateMainViewController.m
//  Assignment
//
//  Created by USER on 2017. 11. 21..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import "DelegateMainViewController.h"

#import "DelegateSecondViewController.h"
#import "DelegateThirdViewController.h"

@interface DelegateMainViewController ()

@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation DelegateMainViewController

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - Memory Management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)goSecond:(id)sender {
    DelegateSecondViewController *secondViewController = [[DelegateSecondViewController alloc] initWithNibName:@"DelegateSecondViewController" bundle:nil];
    
    [self.navigationController pushViewController:secondViewController animated:YES];
}

- (IBAction)changeSecondVCTheme:(id)sender {
    DelegateSecondViewController *secondViewController = [[DelegateSecondViewController alloc] initWithNibName:@"DelegateSecondViewController" bundle:nil];
    [secondViewController setDelegate:self];
    
    if ([secondViewController conformsToProtocol:@protocol(ThemeChangeDelegate)]) {
        [secondViewController changeTheme];
    }
}

- (IBAction)changeThirdVCTheme:(id)sender {
    DelegateThirdViewController *thirdViewController = [[DelegateThirdViewController alloc] initWithNibName:@"DelegateThirdViewController" bundle:nil];
    [thirdViewController setDelegate:self];
    
    if ([thirdViewController conformsToProtocol:@protocol(ThemeChangeDelegate)]) {
        [thirdViewController changeTheme];
    }
}

#pragma mark - Theme Change Delegate

- (void)changeTheme {
    NSLog(@"Main Theme Change");
    [self.textLabel setText:@"Changed"];
}

@end
