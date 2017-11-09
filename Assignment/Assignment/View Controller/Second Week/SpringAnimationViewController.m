//
//  SpringAnimationViewController.m
//  Assignment
//
//  Created by USER on 2017. 11. 8..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import "SpringAnimationViewController.h"

@interface SpringAnimationViewController ()

@property (assign, nonatomic) CGRect originalFrame;

@property (weak, nonatomic) IBOutlet UIView *targetView;

@end

@implementation SpringAnimationViewController

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.originalFrame = self.targetView.frame;
}

#pragma mark - Memory Management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)tapRootView:(id)sender {
    
    CGFloat floorDy = self.view.frame.size.height - self.targetView.frame.origin.y - self.targetView.frame.size.height - self.tabBarController.tabBar.frame.size.height;
    
    if (CGRectEqualToRect(self.targetView.frame, self.originalFrame)) {
        [UIView animateWithDuration:3.0
                              delay:0.0
             usingSpringWithDamping:0.1
              initialSpringVelocity:0.9
                            options:0
                         animations:^{
                             [self.targetView setFrame:CGRectOffset(self.targetView.frame, 0.0, floorDy)];
                         }
                         completion:nil];
    } else {
        [UIView animateWithDuration:3.0
                              delay:0.0
             usingSpringWithDamping:0.1
              initialSpringVelocity:0.9
                            options:0
                         animations:^{
                             [self.targetView setFrame:self.originalFrame];
                         }
                         completion:nil];
    }
}

- (IBAction)tapTargetView:(id)sender {
    [UIView animateWithDuration:3.0
                          delay:0.0
         usingSpringWithDamping:0.2
          initialSpringVelocity:0.5
                        options:0
                     animations:^{
                         [self.targetView setTransform:CGAffineTransformMakeScale(0.5, 0.5)];
                     }
                     completion:^(BOOL finished) {
                         
                     }];
}

@end
