//
//  Assignment.h
//  Assignment
//
//  Created by Jaeho on 2017. 11. 7..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AssignmentManager.h"

@interface Assignment : NSObject

@property (assign, nonatomic) AssignmentType type;
@property (strong, nonatomic) NSString *title;

- (instancetype)init;
- (instancetype)initWithTitle:(NSString *)title andType:(AssignmentType)type;

@end
