//
//  BlockView.h
//  Assignment
//
//  Created by Jaeho on 2017. 12. 19..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlockView : UIView

@property (strong, nonatomic) UILabel *viewNamelabel;
@property (copy, nonatomic) IBInspectable NSString *viewNameString;

@property (copy, nonatomic) void (^changeLabelWithBlock)(NSString *);

@end
