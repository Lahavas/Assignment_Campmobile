//
//  PageChildViewController.m
//  Assignment
//
//  Created by Jaeho on 2017. 11. 7..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import "PageChildViewController.h"

@interface PageChildViewController ()

#pragma mark - Private Properties

@property (strong, nonatomic) UIPageControl *pageControl;
@property (strong, nonatomic) UILabel *indexLabel;

@end

#pragma mark -

@implementation PageChildViewController

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:UIColor.blackColor];
    
    [self setIndexLabel];
}

#pragma mark - Memory Management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Methods

- (void)setIndexLabel {
    self.indexLabel = [[UILabel alloc] init];
    
    [self.indexLabel setTextAlignment:NSTextAlignmentCenter];
    [self.indexLabel setFont:[UIFont boldSystemFontOfSize:24.0]];
    [self.indexLabel setTextColor:UIColor.whiteColor];
    [self.indexLabel setText:[NSString stringWithFormat:@"Screen #%ld", self.index]];
    
    [self.indexLabel sizeToFit];
    [self.indexLabel setCenter:self.view.center];
    
    [self.indexLabel setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin |
                                         UIViewAutoresizingFlexibleLeftMargin |
                                         UIViewAutoresizingFlexibleRightMargin |
                                         UIViewAutoresizingFlexibleBottomMargin];
    
    [self.view addSubview:self.indexLabel];
}

@end
