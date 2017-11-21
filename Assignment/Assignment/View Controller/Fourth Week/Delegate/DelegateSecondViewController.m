//
//  DelegateSecondViewController.m
//  Assignment
//
//  Created by USER on 2017. 11. 21..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import "DelegateSecondViewController.h"

#import "DelegateMainViewController.h"
#import "DelegateThirdViewController.h"

@interface DelegateSecondViewController ()

@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation DelegateSecondViewController

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

- (IBAction)goThrid:(id)sender {
    DelegateThirdViewController *secondViewController = [[DelegateThirdViewController alloc] initWithNibName:@"DelegateThirdViewController" bundle:nil];
    
    [self.navigationController pushViewController:secondViewController animated:YES];
}

- (IBAction)changeMainVCTheme:(id)sender {
    DelegateMainViewController *mainViewController = [[DelegateMainViewController alloc] initWithNibName:@"DelegateMainViewController" bundle:nil];
    
    if ([mainViewController conformsToProtocol:@protocol(ThemeChangeDelegate)]) {
        [mainViewController changeTheme];
    }
}

- (IBAction)changeThirdVCTheme:(id)sender {
    DelegateThirdViewController *thirdViewController = [[DelegateThirdViewController alloc] initWithNibName:@"DelegateThirdViewController" bundle:nil];
    
    if ([thirdViewController conformsToProtocol:@protocol(ThemeChangeDelegate)]) {
        [thirdViewController changeTheme];
    }
}

#pragma mark - Theme Change Delegate

- (void)changeTheme {
    NSLog(@"Second Theme Change");
    [self.textLabel setText:@"Changed"];
}

@end
