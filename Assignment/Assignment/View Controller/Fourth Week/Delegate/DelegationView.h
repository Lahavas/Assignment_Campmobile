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
- (void)delegationViewLabelChangedString:(NSString *)string;

@end

@interface DelegationView : UIView

@property (strong, nonatomic) UILabel *viewNamelabel;
@property (copy, nonatomic) IBInspectable NSString *viewNameString;

@property (weak, nonatomic) id<LabelChangeDelegate> delegate;

@end
