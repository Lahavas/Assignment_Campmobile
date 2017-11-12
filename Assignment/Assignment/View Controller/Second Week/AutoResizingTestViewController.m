//
//  AutoResizingTestViewController.m
//  Assignment
//
//  Created by USER on 2017. 11. 9..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import "AutoResizingTestViewController.h"

@interface AutoResizingTestViewController ()

@end

#pragma mark -

@implementation AutoResizingTestViewController

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:UIColor.whiteColor];
    
    UIView *firstView = [[UIView alloc] init];
    UIView *secondView = [[UIView alloc] init];
    
    [firstView setBackgroundColor:UIColor.blueColor];
    [secondView setBackgroundColor:UIColor.greenColor];
    
    [firstView setFrame:CGRectMake(0, 0, 100, 100)];
    [secondView setFrame:CGRectMake(10, 110, 100, 100)];
    
    [firstView setBounds:CGRectMake(0, 0, 50, 50)];
    [secondView setCenter:CGPointMake(55, 200)];
    
    [firstView setAutoresizingMask:
     UIViewAutoresizingFlexibleTopMargin |
     UIViewAutoresizingFlexibleLeftMargin |
     UIViewAutoresizingFlexibleRightMargin |
     UIViewAutoresizingFlexibleBottomMargin |
     UIViewAutoresizingFlexibleWidth |
     UIViewAutoresizingFlexibleHeight
     ];
    
    [secondView setAutoresizingMask:
     UIViewAutoresizingFlexibleTopMargin |
     UIViewAutoresizingFlexibleLeftMargin |
     UIViewAutoresizingFlexibleRightMargin |
     UIViewAutoresizingFlexibleBottomMargin |
     UIViewAutoresizingFlexibleWidth |
     UIViewAutoresizingFlexibleHeight
     ];
    
    [self.view addSubview:firstView];
    [self.view addSubview:secondView];
}

#pragma mark - Memory Management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
