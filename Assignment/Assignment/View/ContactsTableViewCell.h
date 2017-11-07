//
//  ContactsTableViewCell.h
//  Assignment
//
//  Created by Jaeho on 2017. 11. 8..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactsTableViewCell : UITableViewCell

#pragma mark - Public Properties

@property (strong, nonatomic) UIImageView *profileImageView;

@property (strong, nonatomic) UILabel *firstNameLabel;
@property (strong, nonatomic) UILabel *lastNameLabel;

@property (strong, nonatomic) UILabel *phoneTypeLabel;
@property (strong, nonatomic) UILabel *phoneNumberLabel;

@end
