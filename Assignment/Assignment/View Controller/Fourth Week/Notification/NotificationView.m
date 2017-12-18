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

@property (strong, nonatomic) UITapGestureRecognizer *tapGestureRecognizer;

@end

@implementation NotificationView

#pragma mark - Initialization

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        _label = [[UILabel alloc] initWithFrame:CGRectZero];
        
        [self addSubview:self.label];
        [self setUpConstraints];
        
        self.tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                            action:@selector(tapNotificationView:)];
        [self addGestureRecognizer:self.tapGestureRecognizer];
        
        [NSNotificationCenter.defaultCenter addObserver:self
                                               selector:@selector(fixLabel:)
                                                   name:notificationName
                                                 object:nil];
    }
    
    return self;
}

#pragma mark - Object Life Cycle

- (void)dealloc {
    [self removeGestureRecognizer:self.tapGestureRecognizer];
    
    [NSNotificationCenter.defaultCenter removeObserver:self];
}

#pragma mark - Accessor Methods

- (void)setLabelString:(NSString *)labelString {
    _labelString = labelString;
    
    if (self.label) {
        [self.label setText:self.labelString];
    }
}

#pragma mark - Actions

- (void)tapNotificationView:(id)sender {
    NSDictionary *notificationInfo = @{userInfoKey: self.sendingString};
    
    [NSNotificationCenter.defaultCenter postNotificationName:notificationName
                                                      object:self
                                                    userInfo:notificationInfo];
}

- (void)fixLabel:(NSNotification *)notification {
    NSDictionary *userInfo = notification.userInfo;
    NSString *labelText = userInfo[userInfoKey];
    
    [self setLabelString:labelText];
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