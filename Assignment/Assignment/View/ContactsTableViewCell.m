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
