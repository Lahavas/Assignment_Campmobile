//
//  ContactProfileView.m
//  Assignment
//
//  Created by Jaeho on 2017. 11. 13..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import "ContactProfileView.h"

@implementation ContactProfileView

#pragma mark - View Life Cycle

- (void)awakeFromNib {
    [super awakeFromNib];
    
    UIImage *defaultImage = [UIImage imageNamed:@"defaultImage"];
    self.profileImageView = [[UIImageView alloc] initWithImage:defaultImage];
    
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    
    [self.nameLabel setNumberOfLines:1];
    [self.nameLabel setTextColor:UIColor.blackColor];
    [self.nameLabel setTextAlignment:NSTextAlignmentCenter];
    [self.nameLabel setFont:[UIFont systemFontOfSize:15.0]];
    
    self.organizationLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    
    [self.organizationLabel setNumberOfLines:1];
    [self.organizationLabel setTextColor:UIColor.grayColor];
    [self.organizationLabel setTextAlignment:NSTextAlignmentCenter];
    [self.organizationLabel setFont:[UIFont systemFontOfSize:12.0]];
    
    [self.profileImageView setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin];
    [self.nameLabel setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
    [self.organizationLabel setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
    
    [self addSubview:self.profileImageView];
    [self addSubview:self.nameLabel];
    [self addSubview:self.organizationLabel];
}

#pragma mark - Lay Out Methods

- (void)layoutSubviews {
    
    CGFloat marginValue = 8.0;
    
    CGFloat profileImageWidth = 80.0;
    CGFloat profileImageHeight = 80.0;
    CGFloat profileImageOriginX = CGRectGetMidX(self.frame) - profileImageWidth / 2;
    CGFloat profileImageOriginY = marginValue;
    
    [self.profileImageView setFrame:CGRectMake(profileImageOriginX, profileImageOriginY, profileImageWidth, profileImageHeight)];
    
    [self.nameLabel setFrame:CGRectMake(60, 60, 200, 50)];
    [self.organizationLabel setFrame:CGRectMake(60, 80, 200, 50)];
}

@end
