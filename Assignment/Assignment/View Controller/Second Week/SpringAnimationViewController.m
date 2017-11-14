//
//  SpringAnimationViewController.m
//  Assignment
//
//  Created by USER on 2017. 11. 8..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import "SpringAnimationViewController.h"

#import "CustomView.h"

@interface SpringAnimationViewController ()

@property (assign, nonatomic) CGRect originalFrame;

@property (weak, nonatomic) IBOutlet CustomView *targetView;

@end

@implementation SpringAnimationViewController

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.targetView.textLabel setText:@"Target"];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
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
    
    __weak typeof(self) weakSelf = self;
    
    if (CGRectEqualToRect(self.targetView.frame, self.originalFrame)) {
        [UIView animateWithDuration:3.0
                              delay:0.0
             usingSpringWithDamping:0.1
              initialSpringVelocity:0.9
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             [weakSelf.targetView setFrame:CGRectOffset(weakSelf.targetView.frame, 0.0, floorDy)];
                         }
                         completion:nil];
    } else {
        [UIView animateWithDuration:3.0
                              delay:0.0
             usingSpringWithDamping:0.1
              initialSpringVelocity:0.9
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             [weakSelf.targetView setFrame:weakSelf.originalFrame];
                         }
                         completion:nil];
    }
}

- (IBAction)tapTargetView:(id)sender {
    __weak typeof(self) weakSelf = self;
    
    [UIView animateWithDuration:1.5
                          delay:0.0
         usingSpringWithDamping:0.2
          initialSpringVelocity:0.5
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [weakSelf.targetView setTransform:CGAffineTransformMakeScale(0.5, 0.5)];
                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:1.5
                                               delay:0.0
                              usingSpringWithDamping:0.2
                               initialSpringVelocity:0.5
                                             options:UIViewAnimationOptionCurveEaseInOut
                                          animations:^{
                                              [weakSelf.targetView setTransform:CGAffineTransformMakeScale(1.0, 1.0)];
                                          } completion:nil];
                     }];
}

@end
