//
//  DelegateThirdViewController.h
//  Assignment
//
//  Created by USER on 2017. 11. 21..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ThemeChangeDelegate.h"

@interface DelegateThirdViewController : UIViewController <ThemeChangeDelegate>

@property (weak, nonatomic) id<ThemeChangeDelegate> delegate;

- (void)changeTheme;

@end
