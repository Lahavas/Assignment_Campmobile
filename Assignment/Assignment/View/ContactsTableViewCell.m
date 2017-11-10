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
        
        [self.contentView addSubview:self.profileImageView];
        [self.contentView addSubview:self.firstNameLabel];
        [self.contentView addSubview:self.lastNameLabel];
        [self.contentView addSubview:self.phoneTypeLabel];
        [self.contentView addSubview:self.phoneNumberLabel];
    }
    
    return self;
}

#pragma mark - Layout Methods

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

    CGFloat phoneNumberOriginX = phoneTypeOriginX + phoneTypeSizeWidth + marginValue;
    CGFloat phoneNumberOriginY = self.profileImageView.frame.origin.y + self.profileImageView.frame.size.height + marginValue;
    CGFloat phoneNumberSizeWidth = self.contentView.frame.size.width - phoneNumberOriginX - marginValue;
    CGFloat phoneNumberSizeHeight = [self.phoneNumberLabel.text sizeWithAttributes:@{NSFontAttributeName:self.phoneNumberLabel.font}].height;
    
    [self.profileImageView setFrame:CGRectMake(15, 15, 75, 75)];
    [self.firstNameLabel setFrame:CGRectMake(firstNameOriginX, firstNameOriginY, firstNameSizeWidth, firstNameSizeHeight)];
    [self.lastNameLabel setFrame:CGRectMake(lastNameOriginX, lastNameOriginY, lastNameSizeWidth, lastNameSizeHeight)];
    [self.phoneTypeLabel setFrame:CGRectMake(phoneTypeOriginX, phoneTypeOriginY, phoneTypeSizeWidth, phoneTypeSizeHeight)];
    [self.phoneNumberLabel setFrame:CGRectMake(phoneNumberOriginX, phoneNumberOriginY, phoneNumberSizeWidth, phoneNumberSizeHeight)];
    
    [self.profileImageView setAutoresizingMask:UIViewAutoresizingFlexibleWidth |
                                               UIViewAutoresizingFlexibleHeight |
                                               UIViewAutoresizingFlexibleRightMargin];
}

@end
