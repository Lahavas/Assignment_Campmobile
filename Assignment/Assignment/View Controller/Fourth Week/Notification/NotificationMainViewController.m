//
//  NotificationMainViewController.m
//  Assignment
//
//  Created by USER on 2017. 11. 21..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import "NotificationMainViewController.h"

#import "NotificationSecondViewController.h"

@interface NotificationMainViewController ()

@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation NotificationMainViewController

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(changeTheme)
                                                 name:@"TESTNOTIFICATIONCHANGE"
                                               object:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Memory Management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Method

- (void)changeTheme {
    NSLog(@"Main Theme Change");
    [self.textLabel setText:@"Changed"];
}

#pragma mark - Actions

- (IBAction)goSecond:(id)sender {
    NotificationSecondViewController *secondViewController = [[NotificationSecondViewController alloc] initWithNibName:@"NotificationSecondViewController" bundle:nil];
    
    [self.navigationController pushViewController:secondViewController animated:YES];
}

- (IBAction)postNotification:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"TESTNOTIFICATIONCHANGE" object:nil];
}

@end
