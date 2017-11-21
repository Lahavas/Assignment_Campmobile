//
//  DelegateThirdViewController.m
//  Assignment
//
//  Created by USER on 2017. 11. 21..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import "DelegateThirdViewController.h"

#import "DelegateMainViewController.h"
#import "DelegateSecondViewController.h"

@interface DelegateThirdViewController ()

@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation DelegateThirdViewController

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

- (IBAction)changeMainVCTheme:(id)sender {
    DelegateMainViewController *mainViewController = [[DelegateMainViewController alloc] initWithNibName:@"DelegateMainViewController" bundle:nil];
    
    if ([mainViewController conformsToProtocol:@protocol(ThemeChangeDelegate)]) {
        [mainViewController changeTheme];
    }
}

- (IBAction)changeSecondVCTheme:(id)sender {
    DelegateSecondViewController *secondViewController = [[DelegateSecondViewController alloc] initWithNibName:@"DelegateSecondViewController" bundle:nil];
    
    if ([secondViewController conformsToProtocol:@protocol(ThemeChangeDelegate)]) {
        [secondViewController changeTheme];
    }
}

#pragma mark - Theme Change Delegate

- (void)changeTheme {
    NSLog(@"Third Theme Change");
    [self.textLabel setText:@"Changed"];
}

@end
