//
//  Contact.m
//  Assignment
//
//  Created by Jaeho on 2017. 11. 8..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import "Contact.h"

@implementation Contact

#pragma mark - Initializer

- (instancetype)init {
    return [self initWithFirstName:@"firstName" andLastName:@"lastName" andPhoneType:@"phoneType" andPhoneNumber:@"phoneNumber"];
}

- (instancetype)initWithFirstName:(NSString *)firstName andPhoneNumber:(NSString *)phoneNumber {
    return [self initWithFirstName:firstName andLastName:@"lastName" andPhoneType:@"phoneType" andPhoneNumber:phoneNumber];
}

- (instancetype)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName andPhoneType:(NSString *)phoneType andPhoneNumber:(NSString *)phoneNumber {
    self = [super init];
    
    if (self) {
        _firstName = firstName;
        _lastName = lastName;
        _phoneType = phoneType;
        _phoneNumber = phoneNumber;
    }
    
    return self;
}

@end
