//
//  SpringAnimationViewController.m
//  Assignment
//
//  Created by USER on 2017. 11. 8..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import "SpringAnimationViewController.h"

@interface SpringAnimationViewController ()

@property (weak, nonatomic) IBOutlet UIView *targetView;

@end

@implementation SpringAnimationViewController

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark - Memory Management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)tapRootView:(id)sender {
    
    [UIView animateWithDuration:2.0
                          delay:0.0
         usingSpringWithDamping:0.5
          initialSpringVelocity:0.5
                        options:0
                     animations:^{
                         [self.targetView setCenter:CGPointMake(self.view.center.x, self.view.center.y + 300.0)];
                     }
                     completion:nil];
}

@end
