//
//  Contact.h
//  Assignment
//
//  Created by Jaeho on 2017. 11. 8..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject

#pragma mark - Public Properties

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;

@property (strong, nonatomic) NSString *phoneType;
@property (strong, nonatomic) NSString *phoneNumber;

#pragma mark - Initializer

- (instancetype)init;
- (instancetype)initWithFirstName:(NSString *)firstName andPhoneNumber:(NSString *)phoneNumber;
- (instancetype)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName andPhoneType:(NSString *)phoneType andPhoneNumber:(NSString *)phoneNumber;

@end
