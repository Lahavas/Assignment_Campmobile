//
//  AssignmentManager.h
//  Assignment
//
//  Created by Jaeho on 2017. 11. 7..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, AssignmentType) {
    AssignmentDefault,
    AssignmentContacts,
    AssignmentPages,
    AssignmentView
};

@interface AssignmentManager : NSObject

+ (NSArray *)firstWeekAssignment;
+ (NSArray *)secondWeekAssignment;
+ (NSArray *)thirdWeekAssignment;
+ (NSArray *)fourthWeekAssignment;

@end
