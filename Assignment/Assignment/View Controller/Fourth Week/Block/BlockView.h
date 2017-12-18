//
//  BlockView.h
//  Assignment
//
//  Created by Jaeho on 2017. 12. 19..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlockView : UIView

@property (copy, nonatomic) IBInspectable NSString *labelString;
@property (copy, nonatomic) IBInspectable NSString *sendingString;

@property (copy, nonatomic) void (^fixLabelWithBlock)(NSString *);

@end
