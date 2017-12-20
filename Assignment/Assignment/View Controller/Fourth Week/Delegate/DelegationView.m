//
//  DelegationView.m
//  Assignment
//
//  Created by Jaeho on 2017. 12. 19..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import "DelegationView.h"

@interface DelegationView ()

@property (strong, nonatomic) UITapGestureRecognizer *tapGestureRecognizer;

@end

@implementation DelegationView

#pragma mark - Initialization

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        self.viewNamelabel = [[UILabel alloc] initWithFrame:CGRectZero];
        
        [self addSubview:self.viewNamelabel];
        [self setUpConstraints];
        
        self.tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                            action:@selector(tapDelegationView:)];
        [self addGestureRecognizer:self.tapGestureRecognizer];
    }
    
    return self;
}

#pragma mark - Object Life Cycle

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.viewNamelabel setText:self.viewNameString];
}

- (void)dealloc {
    [self removeGestureRecognizer:self.tapGestureRecognizer];
}

#pragma mark - Actions

- (void)tapDelegationView:(id)sender {
    NSString *sendingString = [NSString stringWithFormat:@"%@ tapped", self.viewNameString];
    
    [self.delegate delegationViewLabelChangedString:sendingString];
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
