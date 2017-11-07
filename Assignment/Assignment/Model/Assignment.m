//
//  Assignment.m
//  Assignment
//
//  Created by Jaeho on 2017. 11. 7..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import "Assignment.h"

@implementation Assignment

- (instancetype)init {
    return [self initWithTitle:@"Default" andType:AssignmentDefault];
}

- (instancetype)initWithTitle:(NSString *)title andType:(AssignmentType)type {
    self = [super init];
    
    if (self) {
        _title = title;
        _type = type;
    }
    
    return self;
}

@end
