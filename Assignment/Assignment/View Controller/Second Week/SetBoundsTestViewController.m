//
//  SetBoundsTestViewController.m
//  Assignment
//
//  Created by USER on 2017. 11. 14..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import "SetBoundsTestViewController.h"

@interface SetBoundsTestViewController ()

@property (strong, nonatomic) UIView *firstView;

@end

@implementation SetBoundsTestViewController

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:UIColor.whiteColor];
    
    self.firstView = [[UIView alloc] initWithFrame:CGRectMake(20, 80, 400, 400)];
    [self.firstView setBackgroundColor:UIColor.blueColor];
    
    NSLog(@"before OriginX : %lf", self.firstView.frame.origin.x);
    NSLog(@"before CenterX : %lf", self.firstView.center.x);
    
    [self.view addSubview:self.firstView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    __weak typeof(self) weakSelf = self;
    
    [UIView animateWithDuration:5.0
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [weakSelf.firstView setBounds:CGRectMake(200, 200, 200, 200)];
                     }
                     completion:^(BOOL finished) {
                         NSLog(@"after OriginX : %lf", weakSelf.firstView.frame.origin.x);
                         NSLog(@"after CenterX : %lf", weakSelf.firstView.center.x);
                     }];
}

#pragma mark - Memory Management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
