//
//  ContactDetailViewController.h
//  Assignment
//
//  Created by Jaeho on 2017. 11. 13..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <Contacts/Contacts.h>

@interface ContactDetailViewController : UIViewController

#pragma mark - Public Properties

@property (strong, nonatomic) CNContact *contact;

@end
