//
//  NotificationView.h
//  Assignment
//
//  Created by USER on 2017. 12. 18..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *changeLabelTextNotificationName = @"changeLabelTextNotification";
static NSString *changeLabelTextNotificationKey = @"labelText";

@interface NotificationView : UIView

@property (copy, nonatomic) IBInspectable NSString *viewNameString;

@end
