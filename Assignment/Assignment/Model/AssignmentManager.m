//
//  AssignmentManager.m
//  Assignment
//
//  Created by Jaeho on 2017. 11. 7..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import "AssignmentManager.h"
#import "Assignment.h"

@implementation AssignmentManager

+ (NSArray *)firstWeekAssignment {
    Assignment *assignmentContacts = [[Assignment alloc] initWithTitle:@"Contacts" andType:AssignmentContacts];
    Assignment *assignmentPages = [[Assignment alloc] initWithTitle:@"Pages" andType:AssignmentPages];
    
    return @[assignmentContacts, assignmentPages];
}

+ (NSArray *)secondWeekAssignment {
    Assignment *assignmentView = [[Assignment alloc] initWithTitle:@"UIView" andType:AssignmentView];
    Assignment *assignmentSimpleAnimation = [[Assignment alloc] initWithTitle:@"Simple Animation" andType:AssignmentSimpleAnimation];
    Assignment *assignmentSpringAnimation = [[Assignment alloc] initWithTitle:@"Spring Animation" andType:AssignmentSpringAnimation];
    
    return @[assignmentView, assignmentSimpleAnimation, assignmentSpringAnimation];
}

+ (NSArray *)thirdWeekAssignment {
    
    return @[];
}

+ (NSArray *)fourthWeekAssignment {
    
    return @[];
}

@end
