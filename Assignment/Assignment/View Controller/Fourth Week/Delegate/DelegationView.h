//
//  DelegationView.h
//  Assignment
//
//  Created by Jaeho on 2017. 12. 19..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LabelChangeDelegate <NSObject>

@required
- (void)delegationViewTap:(NSString *)string;

@end

@interface DelegationView : UIView

@property (copy, nonatomic) IBInspectable NSString *labelString;
@property (copy, nonatomic) IBInspectable NSString *sendingString;

@property (weak, nonatomic) id<LabelChangeDelegate> delegate;

@end
