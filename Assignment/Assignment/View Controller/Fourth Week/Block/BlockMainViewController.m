//
//  BlockMainViewController.m
//  Assignment
//
//  Created by USER on 2017. 11. 21..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import "BlockMainViewController.h"

#import "BlockView.h"

@interface BlockMainViewController ()

@property (weak, nonatomic) IBOutlet BlockView *blockView;

@property (weak, nonatomic) IBOutlet BlockView *redView;
@property (weak, nonatomic) IBOutlet BlockView *blueView;
@property (weak, nonatomic) IBOutlet BlockView *greenView;
@property (weak, nonatomic) IBOutlet BlockView *yellowView;

@end

@implementation BlockMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak typeof(self) weakSelf = self;
    
    void (^block)(NSString *) = ^(NSString *string) {
        [weakSelf.redView setLabelString:string];
        [weakSelf.blueView setLabelString:string];
        [weakSelf.greenView setLabelString:string];
        [weakSelf.yellowView setLabelString:string];
    };
    
    [self.redView setFixLabelWithBlock:block];
    [self.blueView setFixLabelWithBlock:block];
    [self.greenView setFixLabelWithBlock:block];
    [self.yellowView setFixLabelWithBlock:block];
}

@end
