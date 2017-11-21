//
//  NotificationThirdViewController.m
//  Assignment
//
//  Created by USER on 2017. 11. 21..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import "NotificationThirdViewController.h"

@interface NotificationThirdViewController ()

@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation NotificationThirdViewController

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
    NSLog(@"Third Theme Change");
    [self.textLabel setText:@"Changed"];
}

#pragma mark - Actions

- (IBAction)postNotification:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"TESTNOTIFICATIONCHANGE" object:nil];
}

@end
