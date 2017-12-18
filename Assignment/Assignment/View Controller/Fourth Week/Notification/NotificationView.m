//
//  NotificationView.m
//  Assignment
//
//  Created by USER on 2017. 12. 18..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import "NotificationView.h"

@interface NotificationView ()

@property (strong, nonatomic) UILabel *label;

@end

@implementation NotificationView

#pragma mark - Initialization

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        _label = [[UILabel alloc] initWithFrame:CGRectZero];
        
        [self addSubview:self.label];
        [self setUpConstraints];
    }
    
    return self;
}

#pragma mark - Accessor Methods

- (void)setLabelString:(NSString *)labelString {
    _labelString = labelString;
    
    if (self.label) {
        [self.label setText:self.labelString];
    }
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
