//
//  ContactsTableViewCell.h
//  Assignment
//
//  Created by Jaeho on 2017. 11. 13..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactsTableViewCell : UITableViewCell

#pragma mark - Public Properties

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

#pragma mark - Public Methods

+ (NSString *)reuseIdentifier;

@end
