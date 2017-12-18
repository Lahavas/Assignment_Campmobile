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

#pragma mark - Actions

- (IBAction)tapRedView:(id)sender {
    NSDictionary *redViewInfo = @{@"labelText": @"Red View Tapped"};
    
    [NSNotificationCenter.defaultCenter postNotificationName:@"FixLabelNotification"
                                                      object:self
                                                    userInfo:redViewInfo];
}

- (IBAction)tapBlueView:(id)sender {
    NSDictionary *blueViewInfo = @{@"labelText": @"Blue View Tapped"};
    
    [NSNotificationCenter.defaultCenter postNotificationName:@"FixLabelNotification"
                                                      object:self
                                                    userInfo:blueViewInfo];
}

- (IBAction)tapGreenView:(id)sender {
    NSDictionary *greenViewInfo = @{@"labelText": @"Green View Tapped"};
    
    [NSNotificationCenter.defaultCenter postNotificationName:@"FixLabelNotification"
                                                      object:self
                                                    userInfo:greenViewInfo];
}

- (IBAction)tapYellowView:(id)sender {
    NSDictionary *yellowViewInfo = @{@"labelText": @"Yellow View Tapped"};
    
    [NSNotificationCenter.defaultCenter postNotificationName:@"FixLabelNotification"
                                                      object:self
                                                    userInfo:yellowViewInfo];
}

@end
