//
//  NotificationMainViewController.m
//  Assignment
//
//  Created by USER on 2017. 11. 21..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import "NotificationMainViewController.h"

#import "NotificationView.h"

@interface NotificationMainViewController ()

@property (weak, nonatomic) IBOutlet NotificationView *redView;
@property (weak, nonatomic) IBOutlet NotificationView *blueView;
@property (weak, nonatomic) IBOutlet NotificationView *greenView;
@property (weak, nonatomic) IBOutlet NotificationView *yellowView;

@end

@implementation NotificationMainViewController

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)dealloc {
    
}

#pragma mark - Actions

- (IBAction)tabRedView:(id)sender {
    NSLog(@"Tab Red View");
}

- (IBAction)tabBlueView:(id)sender {
    NSLog(@"Tab Blue View");
}

- (IBAction)tabGreenView:(id)sender {
    NSLog(@"Tab Green View");
}

- (IBAction)tabYellowView:(id)sender {
    NSLog(@"Tab Yellow View");
}

@end
