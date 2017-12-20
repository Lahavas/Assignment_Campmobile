//
//  NotificationView.m
//  Assignment
//
//  Created by USER on 2017. 12. 18..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import "NotificationView.h"

@interface NotificationView ()

@property (strong, nonatomic) UILabel *viewNamelabel;

@property (strong, nonatomic) UITapGestureRecognizer *tapGestureRecognizer;

@end

@implementation NotificationView

#pragma mark - Initialization

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        self.viewNamelabel = [[UILabel alloc] initWithFrame:CGRectZero];
        
        [self addSubview:self.viewNamelabel];
        [self setUpConstraints];
        
        self.tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                            action:@selector(tapNotificationView:)];
        [self addGestureRecognizer:self.tapGestureRecognizer];
        
        [NSNotificationCenter.defaultCenter addObserver:self
                                               selector:@selector(changeLabel:)
                                                   name:changeLabelTextNotificationName
                                                 object:nil];
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.viewNamelabel setText:self.viewNameString];
}

#pragma mark - Object Life Cycle

- (void)dealloc {
    [self removeGestureRecognizer:self.tapGestureRecognizer];
    
    [NSNotificationCenter.defaultCenter removeObserver:self];
}

#pragma mark - Actions

- (void)tapNotificationView:(id)sender {
    NSString *sendingString = [NSString stringWithFormat:@"%@ tapped", self.viewNameString];
    NSDictionary *changeLabelTextNotificationInfo = @{changeLabelTextNotificationKey: sendingString};
    
    [NSNotificationCenter.defaultCenter postNotificationName:changeLabelTextNotificationName
                                                      object:self
                                                    userInfo:changeLabelTextNotificationInfo];
}

- (void)changeLabel:(NSNotification *)notification {
    NSDictionary *changeLabelTextNotificationInfo = notification.userInfo;
    NSString *labelString = changeLabelTextNotificationInfo[changeLabelTextNotificationKey];
    
    [self.viewNamelabel setText:labelString];
}

#pragma mark - Private Methods

- (void)setUpConstraints {
    [self.viewNamelabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    NSLayoutConstraint *labelCenterXConstraint = [self.viewNamelabel.centerXAnchor constraintEqualToAnchor:self.centerXAnchor];
    NSLayoutConstraint *labelCenterYConstraint = [self.viewNamelabel.centerYAnchor constraintEqualToAnchor:self.centerYAnchor];
    
    [NSLayoutConstraint activateConstraints:@[labelCenterXConstraint,
                                              labelCenterYConstraint]];
}

@end
