//
//  SimpleAnimationViewController.m
//  Assignment
//
//  Created by USER on 2017. 11. 8..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import "SimpleAnimationViewController.h"

@interface SimpleAnimationViewController () {
    CGRect _originalFrame;
}

#pragma mark - Private Properties

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
    
    
}

#pragma mark - Memory Management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)touchFirstButton:(id)sender {
    _originalFrame = self.firstView.frame;
    
    [UIView beginAnimations:@"MoveView" context:nil];
    [UIView setAnimationDuration:3.0];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDelegate:self];
    
//    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
//    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
//    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    [self.firstView setFrame:self.secondView.frame];
    
    [UIView setAnimationDidStopSelector:@selector(setOriginalFrame:finished:context:)];
    
    [UIView commitAnimations];
}

- (IBAction)touchSecondButton:(id)sender {
    _originalFrame = self.firstView.frame;
    
    [UIView animateWithDuration:3.0 animations:^{
        [UIView setAnimationBeginsFromCurrentState:YES];
        [UIView setAnimationDelegate:self];
        
        [self.firstView setFrame:self.secondView.frame];
        
        [UIView setAnimationDidStopSelector:@selector(setOriginalFrame:finished:context:)];
    }];
    
}

- (IBAction)touchThirdButton:(id)sender {
    _originalFrame = self.firstView.frame;
    
    [UIView animateWithDuration:3.0
                          delay:0.0
                        options:UIViewAnimationOptionAutoreverse |
                                UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         [self.firstView setFrame:self.secondView.frame];
                     } 
                     completion:^(BOOL finished) {
                         [self.firstView setFrame:_originalFrame];
                     }];
}

- (IBAction)touchFourthButton:(id)sender {
    [UIView animateWithDuration:3.0
                          delay:0.0
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         [self.firstView setTransform:CGAffineTransformMakeRotation(M_PI)];
                     }
                     completion:nil
     ];
}

#pragma mark - Private Methods

- (void)setOriginalFrame:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
{
    [UIView beginAnimations:@"MoveView2" context:nil];
    [UIView setAnimationDuration:3.0];
    [UIView setAnimationDelay:0.0];
    
    [self.firstView setFrame:_originalFrame];
    
    [UIView commitAnimations];
}


@end
