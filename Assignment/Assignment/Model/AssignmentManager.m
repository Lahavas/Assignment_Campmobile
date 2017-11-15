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
    Assignment *assignmentContactsResizing = [[Assignment alloc] initWithTitle:@"Contacts Resizing" andType:AssignmentContactsResizing];
    
    return @[assignmentContacts, assignmentPages, assignmentContactsResizing];
}

+ (NSArray *)secondWeekAssignment {
    Assignment *assignmentAutoResizing = [[Assignment alloc] initWithTitle:@"Auto Resizing Test" andType:AssignmentAutoResizing];
    Assignment *assignmentSimpleAnimation = [[Assignment alloc] initWithTitle:@"Simple Animation" andType:AssignmentSimpleAnimation];
    Assignment *assignmentSpringAnimation = [[Assignment alloc] initWithTitle:@"Spring Animation" andType:AssignmentSpringAnimation];
    Assignment *assignmentStandardCell = [[Assignment alloc] initWithTitle:@"Standard Cell" andType:AssignmentStandardCell];
    Assignment *assignmentContactsEditing = [[Assignment alloc] initWithTitle:@"Contacts Editing" andType:AssignmentContactsEditing];
    Assignment *assignmentSetBoundsTest = [[Assignment alloc] initWithTitle:@"setBounds Test" andType:AssignmentSetBoundsTest];
    
    return @[assignmentAutoResizing, assignmentSimpleAnimation, assignmentSpringAnimation, assignmentStandardCell, assignmentContactsEditing, assignmentSetBoundsTest];
}

+ (NSArray *)thirdWeekAssignment {
    Assignment *assignmentImageZoom = [[Assignment alloc] initWithTitle:@"Image Zoom" andType:AssignmentImageZoom];
    Assignment *assignmentNotificationContainer = [[Assignment alloc] initWithTitle:@"Notification Container" andType:AssignmentNotificationContainer];
    
    return @[assignmentImageZoom, assignmentNotificationContainer];
}

+ (NSArray *)fourthWeekAssignment {
    
    return @[];
}

@end
