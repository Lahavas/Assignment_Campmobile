//
//  ContactsTableViewCell.m
//  Assignment
//
//  Created by Jaeho on 2017. 11. 8..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import "ContactsTableViewCell.h"

@implementation ContactsTableViewCell

#pragma mark - Initializer

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self setProfileImage];
        
        [self setFirstName];
        [self setLastName];
        
        [self setPhoneType];
        [self setPhoneNumber];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat marginValue = 15.0;
    
    CGFloat firstNameOriginX = self.profileImageView.frame.origin.x + self.profileImageView.frame.size.width + marginValue;
    CGFloat firstNameOriginY = marginValue;
    CGFloat firstNameSizeWidth = self.contentView.frame.size.width - firstNameOriginX - marginValue;
    CGFloat firstNameSizeHeight = marginValue;

    CGFloat lastNameOriginX = self.profileImageView.frame.origin.x + self.profileImageView.frame.size.width + marginValue;
    CGFloat lastNameOriginY = firstNameOriginY + firstNameSizeHeight + marginValue;
    CGFloat lastNameSizeWidth = self.contentView.frame.size.width - lastNameOriginX - marginValue;
    CGFloat lastNameSizeHeight = marginValue;

    CGFloat phoneTypeOriginX = marginValue;
    CGFloat phoneTypeOriginY = self.profileImageView.frame.origin.y + self.profileImageView.frame.size.height + marginValue;
    CGFloat phoneTypeSizeWidth = [self.phoneTypeLabel.text sizeWithAttributes:@{NSFontAttributeName:self.phoneTypeLabel.font}].width;
    CGFloat phoneTypeSizeHeight = [self.phoneTypeLabel.text sizeWithAttributes:@{NSFontAttributeName:self.phoneTypeLabel.font}].height;

    CGFloat phoneNumberOriginX = phoneTypeOriginX + phoneTypeSizeWidth + 15.0;
    CGFloat phoneNumberOriginY = self.profileImageView.frame.origin.y + self.profileImageView.frame.size.height + 15.0;
    CGFloat phoneNumberSizeWidth = self.contentView.frame.size.width - phoneNumberOriginX - 15.0;
    CGFloat phoneNumberSizeHeight = [self.phoneNumberLabel.text sizeWithAttributes:@{NSFontAttributeName:self.phoneNumberLabel.font}].height;
    
    [self.firstNameLabel setFrame:CGRectMake(firstNameOriginX, firstNameOriginY, firstNameSizeWidth, firstNameSizeHeight)];
    [self.lastNameLabel setFrame:CGRectMake(lastNameOriginX, lastNameOriginY, lastNameSizeWidth, lastNameSizeHeight)];
    [self.phoneTypeLabel setFrame:CGRectMake(phoneTypeOriginX, phoneTypeOriginY, phoneTypeSizeWidth, phoneTypeSizeHeight)];
    [self.phoneNumberLabel setFrame:CGRectMake(phoneNumberOriginX, phoneNumberOriginY, phoneNumberSizeWidth, phoneNumberSizeHeight)];
    
    [self.profileImageView setAutoresizingMask:UIViewAutoresizingFlexibleWidth |
                                               UIViewAutoresizingFlexibleHeight |
                                               UIViewAutoresizingFlexibleRightMargin];
}

#pragma mark - Private Methods

- (void)setProfileImage {
    UIImage *profileDefaultImage = [UIImage imageNamed:@"defaultImage"];
    
    self.profileImageView = [[UIImageView alloc] init];
    
    [self.profileImageView setImage:profileDefaultImage];
    [self.profileImageView setFrame:CGRectMake(15, 15, 75, 75)];
    
    [self.contentView addSubview:self.profileImageView];
}

- (void)setFirstName {
    self.firstNameLabel = [[UILabel alloc] init];
    
    [self.firstNameLabel setNumberOfLines:1];
    [self.firstNameLabel setTextColor:UIColor.blackColor];
    [self.firstNameLabel setTextAlignment:NSTextAlignmentLeft];
    [self.firstNameLabel setFont:[UIFont systemFontOfSize:15.0]];
    
    [self.contentView addSubview:self.firstNameLabel];
}

- (void)setLastName {
    self.lastNameLabel = [[UILabel alloc] init];
    
    [self.lastNameLabel setNumberOfLines:1];
    [self.lastNameLabel setTextColor:UIColor.blackColor];
    [self.lastNameLabel setTextAlignment:NSTextAlignmentLeft];
    [self.lastNameLabel setFont:[UIFont systemFontOfSize:15.0]];
    
    [self.contentView addSubview:self.lastNameLabel];
}

- (void)setPhoneType {
    self.phoneTypeLabel = [[UILabel alloc] init];
    
    [self.phoneTypeLabel setNumberOfLines:1];
    [self.phoneTypeLabel setTextColor:UIColor.blackColor];
    [self.phoneTypeLabel setTextAlignment:NSTextAlignmentLeft];
    [self.phoneTypeLabel setFont:[UIFont systemFontOfSize:15.0]];
    
    [self.contentView addSubview:self.phoneTypeLabel];
}

- (void)setPhoneNumber {
    self.phoneNumberLabel = [[UILabel alloc] init];
    
    [self.phoneNumberLabel setNumberOfLines:1];
    [self.phoneNumberLabel setTextColor:UIColor.blackColor];
    [self.phoneNumberLabel setTextAlignment:NSTextAlignmentLeft];
    [self.phoneNumberLabel setFont:[UIFont systemFontOfSize:15.0]];
    
    [self.contentView addSubview:self.phoneNumberLabel];
}

@end
