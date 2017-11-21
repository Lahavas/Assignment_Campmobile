//
//  NotificationSecondViewController.m
//  Assignment
//
//  Created by USER on 2017. 11. 21..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import "NotificationSecondViewController.h"

#import "NotificationThirdViewController.h"

@interface NotificationSecondViewController ()

@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation NotificationSecondViewController

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
    NSLog(@"Second Theme Change");
    [self.textLabel setText:@"Changed"];
}

#pragma mark - Actions

- (IBAction)goThird:(id)sender {
    NotificationThirdViewController *thirdViewController = [[NotificationThirdViewController alloc] initWithNibName:@"NotificationThirdViewController" bundle:nil];
    
    [self.navigationController pushViewController:thirdViewController animated:YES];
}

- (IBAction)postNotification:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"TESTNOTIFICATIONCHANGE" object:nil];
}

@end
