//
//  ContactsResizingTableViewCell.m
//  Assignment
//
//  Created by Jaeho on 2017. 11. 13..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import "ContactsResizingTableViewCell.h"

@implementation ContactsResizingTableViewCell

#pragma mark - Class Methods

+ (NSString *)reuseIdentifier {
    return NSStringFromClass([self class]);
}

#pragma mark - Initializer

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        UIImage *profileDefaultImage = [UIImage imageNamed:@"defaultImage"];
        
        self.profileImageView = [[UIImageView alloc] initWithImage:profileDefaultImage];
        self.firstNameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.lastNameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.phoneTypeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.phoneNumberLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        
        [self.firstNameLabel setNumberOfLines:1];
        [self.firstNameLabel setTextColor:UIColor.blackColor];
        [self.firstNameLabel setTextAlignment:NSTextAlignmentLeft];
        [self.firstNameLabel setFont:[UIFont systemFontOfSize:15.0]];
        
        [self.lastNameLabel setNumberOfLines:1];
        [self.lastNameLabel setTextColor:UIColor.blackColor];
        [self.lastNameLabel setTextAlignment:NSTextAlignmentLeft];
        [self.lastNameLabel setFont:[UIFont systemFontOfSize:15.0]];
        
        [self.phoneTypeLabel setNumberOfLines:1];
        [self.phoneTypeLabel setTextColor:UIColor.blackColor];
        [self.phoneTypeLabel setTextAlignment:NSTextAlignmentLeft];
        [self.phoneTypeLabel setFont:[UIFont systemFontOfSize:15.0]];
        
        [self.phoneNumberLabel setNumberOfLines:1];
        [self.phoneNumberLabel setTextColor:UIColor.blackColor];
        [self.phoneNumberLabel setTextAlignment:NSTextAlignmentLeft];
        [self.phoneNumberLabel setFont:[UIFont systemFontOfSize:15.0]];
        
        CGFloat marginValue = 15.0;
        
        CGFloat profileImageSize = 75.0;
        
        CGFloat profileImageOriginX = marginValue;
        CGFloat profileImageOriginY = marginValue;
        CGFloat profileImageSizeWidth = profileImageSize;
        CGFloat profileImageSizeHeight = profileImageSize;
        
        [self.profileImageView setFrame:CGRectMake(profileImageOriginX, profileImageOriginY, profileImageSizeWidth, profileImageSizeHeight)];
        
        CGFloat nameOriginX = CGRectGetMaxX(self.profileImageView.frame) + marginValue;
        CGFloat nameSizeWidth = CGRectGetWidth(self.contentView.frame) - nameOriginX - marginValue;
        
        CGFloat firstNameOriginX = nameOriginX;
        CGFloat firstNameOriginY = marginValue;
        CGFloat firstNameSizeWidth = nameSizeWidth;
        CGFloat firstNameSizeHeight = marginValue;
        
        [self.firstNameLabel setFrame:CGRectMake(firstNameOriginX, firstNameOriginY, firstNameSizeWidth, firstNameSizeHeight)];

        CGFloat lastNameOriginX = nameOriginX;
        CGFloat lastNameOriginY = CGRectGetMaxY(self.firstNameLabel.frame) + marginValue;
        CGFloat lastNameSizeWidth = nameSizeWidth;
        CGFloat lastNameSizeHeight = marginValue;
        
        [self.lastNameLabel setFrame:CGRectMake(lastNameOriginX, lastNameOriginY, lastNameSizeWidth, lastNameSizeHeight)];
        
        CGFloat phoneValueOriginY = CGRectGetMaxY(self.profileImageView.frame) + marginValue;

        CGFloat phoneTypeOriginX = marginValue;
        CGFloat phoneTypeOriginY = phoneValueOriginY;
        CGFloat phoneTypeSizeWidth = 60.0;
        CGFloat phoneTypeSizeHeight = marginValue;
        
        [self.phoneTypeLabel setFrame:CGRectMake(phoneTypeOriginX, phoneTypeOriginY, phoneTypeSizeWidth, phoneTypeSizeHeight)];

        CGFloat phoneNumberOriginX = CGRectGetMaxX(self.phoneTypeLabel.frame) + marginValue;
        CGFloat phoneNumberOriginY = phoneValueOriginY;
        CGFloat phoneNumberSizeWidth = CGRectGetWidth(self.contentView.frame) - phoneNumberOriginX - marginValue;
        CGFloat phoneNumberSizeHeight = marginValue;
        
        [self.phoneNumberLabel setFrame:CGRectMake(phoneNumberOriginX, phoneNumberOriginY, phoneNumberSizeWidth, phoneNumberSizeHeight)];
        
        [self.firstNameLabel setAutoresizingMask:UIViewAutoresizingFlexibleWidth];        
        [self.lastNameLabel setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
        [self.phoneNumberLabel setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
        
        [self.contentView addSubview:self.profileImageView];
        [self.contentView addSubview:self.firstNameLabel];
        [self.contentView addSubview:self.lastNameLabel];
        [self.contentView addSubview:self.phoneTypeLabel];
        [self.contentView addSubview:self.phoneNumberLabel];
    }
    
    return self;
}

@end
