//
//  KeyboardTestViewController.m
//  Assignment
//
//  Created by USER on 2017. 11. 17..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import "KeyboardTestViewController.h"

@interface KeyboardTestViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *keyboardStateLabel;

@end

@implementation KeyboardTestViewController

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidChanged:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
}

#pragma mark - Memory Management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Methods

- (void)keyboardDidChanged:(NSNotification *)notification {
    NSDictionary *info = [notification userInfo];
    CGSize keyboardSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    
    [self.keyboardStateLabel setText:[NSString stringWithFormat:@"Width : %lf, height : %lf", keyboardSize.width, keyboardSize.height]];
}

#pragma mark - Actions

- (IBAction)displayKeyboard:(id)sender {
    [self.textField becomeFirstResponder];
}

- (IBAction)dismissKeyboard:(id)sender {
    [self.textField resignFirstResponder];
}


@end
