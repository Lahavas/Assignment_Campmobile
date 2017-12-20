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
    
    void (^changeLabelBlock)(NSString *) = ^(NSString *string) {
        [weakSelf.redView.viewNamelabel setText:string];
        [weakSelf.blueView.viewNamelabel setText:string];
        [weakSelf.greenView.viewNamelabel setText:string];
        [weakSelf.yellowView.viewNamelabel setText:string];
    };
    
    [self.redView setChangeLabelWithBlock:changeLabelBlock];
    [self.blueView setChangeLabelWithBlock:changeLabelBlock];
    [self.greenView setChangeLabelWithBlock:changeLabelBlock];
    [self.yellowView setChangeLabelWithBlock:changeLabelBlock];
}

@end
