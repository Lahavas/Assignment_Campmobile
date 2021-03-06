//
//  DelegateMainViewController.m
//  Assignment
//
//  Created by USER on 2017. 11. 21..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import "DelegateMainViewController.h"

#import "DelegationView.h"

@interface DelegateMainViewController () <LabelChangeDelegate>

@property (weak, nonatomic) IBOutlet DelegationView *redView;
@property (weak, nonatomic) IBOutlet DelegationView *blueView;
@property (weak, nonatomic) IBOutlet DelegationView *greenView;
@property (weak, nonatomic) IBOutlet DelegationView *yellowView;

@end

@implementation DelegateMainViewController

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.redView setDelegate:self];
    [self.blueView setDelegate:self];
    [self.greenView setDelegate:self];
    [self.yellowView setDelegate:self];
}

#pragma mark - Label Change Delegation

- (void)delegationViewLabelChangedString:(NSString *)string {
    [self.redView.viewNamelabel setText:string];
    [self.blueView.viewNamelabel setText:string];
    [self.greenView.viewNamelabel setText:string];
    [self.yellowView.viewNamelabel setText:string];
}

@end
