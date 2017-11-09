//
//  SimpleAnimationViewController.m
//  Assignment
//
//  Created by USER on 2017. 11. 8..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import "SimpleAnimationViewController.h"

@interface SimpleAnimationViewController ()

#pragma mark - Private Properties

@property (assign, nonatomic) CGRect originalFrame;

@property (weak, nonatomic) IBOutlet UIView *firstView;
@property (weak, nonatomic) IBOutlet UIView *secondView;

@property (weak, nonatomic) IBOutlet UIButton *firstButton;
@property (weak, nonatomic) IBOutlet UIButton *secondButton;
@property (weak, nonatomic) IBOutlet UIButton *thirdButton;
@property (weak, nonatomic) IBOutlet UIButton *fourthButton;

@end

#pragma mark -

@implementation SimpleAnimationViewController

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.originalFrame = self.firstView.frame;
}

#pragma mark - Memory Management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)touchFirstButton:(id)sender {
    [self.firstView.layer removeAllAnimations];
    
    [UIView beginAnimations:@"MoveView" context:nil];
    [UIView setAnimationDuration:3.0];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationRepeatAutoreverses:YES];
    
    [self.firstView setFrame:self.secondView.frame];
    
    [UIView setAnimationDidStopSelector:@selector(setOriginalFrame)];
    
    [UIView commitAnimations];
}

- (IBAction)touchSecondButton:(id)sender {
    [self.firstView.layer removeAllAnimations];
    
    [UIView animateWithDuration:3.0 animations:^{
        [UIView setAnimationBeginsFromCurrentState:YES];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationRepeatAutoreverses:YES];
        
        [self.firstView setFrame:self.secondView.frame];
        
        [UIView setAnimationDidStopSelector:@selector(setOriginalFrame)];
    }];
    
}

- (IBAction)touchThirdButton:(id)sender {
    [self.firstView.layer removeAllAnimations];
    
    [UIView animateWithDuration:3.0
                          delay:0.0
                        options:UIViewAnimationOptionAutoreverse
                     animations:^{
                         [self.firstView setFrame:self.secondView.frame];
                     } 
                     completion:^(BOOL finished) {
                         [self.firstView setFrame:self.originalFrame];
                     }];
}

- (IBAction)touchFourthButton:(id)sender {
    [self.firstView.layer removeAllAnimations];
    
    [UIView animateWithDuration:1.5
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         [self.firstView setTransform:CGAffineTransformMakeRotation(M_PI)];
                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:1.5
                                               delay:0.0
                                             options:UIViewAnimationOptionCurveEaseOut
                                          animations:^{
                                              [self.firstView setTransform:CGAffineTransformMakeRotation(M_PI * 2)];
                                          }
                                          completion:nil];
                     }];
}

#pragma mark - Private Methods

- (void)setOriginalFrame {
    [self.firstView setFrame:self.originalFrame];
}

@end
