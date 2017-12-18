//
//  BlockView.m
//  Assignment
//
//  Created by Jaeho on 2017. 12. 19..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import "BlockView.h"

@interface BlockView ()

@property (strong, nonatomic) UILabel *label;

@property (strong, nonatomic) UITapGestureRecognizer *tapGestureRecognizer;

@end

@implementation BlockView

#pragma mark - Initialization

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        _label = [[UILabel alloc] initWithFrame:CGRectZero];
        
        [self addSubview:self.label];
        [self setUpConstraints];
        
        self.tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                            action:@selector(tapDelegationView:)];
        [self addGestureRecognizer:self.tapGestureRecognizer];
    }
    
    return self;
}

#pragma mark - Object Life Cycle

- (void)dealloc {
    [self removeGestureRecognizer:self.tapGestureRecognizer];
}

#pragma mark - Accessor Methods

- (void)setLabelString:(NSString *)labelString {
    _labelString = labelString;
    
    if (self.label) {
        [self.label setText:self.labelString];
    }
}

#pragma mark - Actions

- (void)tapDelegationView:(id)sender {
    NSString *fixedLabelString = self.sendingString;
    
    self.fixLabelWithBlock(fixedLabelString);
}

#pragma mark - Private Methods

- (void)setUpConstraints {
    [self.label setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    NSLayoutConstraint *labelCenterXConstraint = [self.label.centerXAnchor constraintEqualToAnchor:self.centerXAnchor];
    NSLayoutConstraint *labelCenterYConstraint = [self.label.centerYAnchor constraintEqualToAnchor:self.centerYAnchor];
    
    [NSLayoutConstraint activateConstraints:@[labelCenterXConstraint,
                                              labelCenterYConstraint]];
}

@end
