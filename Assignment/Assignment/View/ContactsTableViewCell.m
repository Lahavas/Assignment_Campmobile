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
    }
    
    return self;
}

#pragma mark - View Life Cycle

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
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
    CGFloat firstNameOriginX = self.profileImageView.frame.origin.x + self.profileImageView.frame.size.width + 15.0;
    CGFloat firstNameOriginY = 10.0;
    CGFloat firstNameSizeWidth = self.contentView.frame.size.width - firstNameOriginX - 15.0;
    CGFloat firstNameSizeHeight = 15.0;
    
    self.firstNameLabel = [[UILabel alloc] init];
    
    [self.firstNameLabel setNumberOfLines:1];
    [self.firstNameLabel setTextColor:UIColor.blackColor];
    [self.firstNameLabel setTextAlignment:NSTextAlignmentLeft];
    [self.firstNameLabel setFont:[UIFont systemFontOfSize:15.0]];
    
    [self.firstNameLabel sizeToFit];
    [self.firstNameLabel setFrame:CGRectMake(firstNameOriginX, firstNameOriginY, firstNameSizeWidth, firstNameSizeHeight)];
    
    [self.contentView addSubview:self.firstNameLabel];
}

- (void)setLastName {
    CGFloat lastNameOriginX = self.profileImageView.frame.origin.x + self.profileImageView.frame.size.width + 15.0;
    CGFloat lastNameOriginY = self.firstNameLabel.frame.origin.y + self.firstNameLabel.frame.size.height + 15.0;
    CGFloat lastNameSizeWidth = self.contentView.frame.size.width - lastNameOriginX - 15.0;
    CGFloat lastNameSizeHeight = 15.0;
    
    self.lastNameLabel = [[UILabel alloc] init];
    
    [self.lastNameLabel setNumberOfLines:1];
    [self.lastNameLabel setTextColor:UIColor.blackColor];
    [self.lastNameLabel setTextAlignment:NSTextAlignmentLeft];
    [self.lastNameLabel setFont:[UIFont systemFontOfSize:15.0]];
    
    [self.lastNameLabel sizeToFit];
    [self.lastNameLabel setFrame:CGRectMake(lastNameOriginX, lastNameOriginY, lastNameSizeWidth, lastNameSizeHeight)];
    
    [self.contentView addSubview:self.lastNameLabel];
}

- (void)setPhoneType {
    CGFloat phoneTypeOriginX = 15.0;
    CGFloat phoneTypeOriginY = self.profileImageView.frame.origin.y + self.profileImageView.frame.size.height + 15.0;
    CGFloat phoneTypeSizeWidth = 15.0;
    CGFloat phoneTypeSizeHeight = 15.0;
    
    self.phoneTypeLabel = [[UILabel alloc] init];
    
    [self.phoneTypeLabel setNumberOfLines:1];
    [self.phoneTypeLabel setTextColor:UIColor.blackColor];
    [self.phoneTypeLabel setTextAlignment:NSTextAlignmentLeft];
    [self.phoneTypeLabel setFont:[UIFont systemFontOfSize:15.0]];
    
    [self.phoneTypeLabel sizeToFit];
    [self.phoneTypeLabel setFrame:CGRectMake(phoneTypeOriginX, phoneTypeOriginY, phoneTypeSizeWidth, phoneTypeSizeHeight)];
    
    [self.contentView addSubview:self.phoneTypeLabel];
}

@end
