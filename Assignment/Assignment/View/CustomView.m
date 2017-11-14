//
//  CustomView.m
//  Assignment
//
//  Created by USER on 2017. 11. 14..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        NSLog(@"initWithFrame: called");
        [self initNibFile];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        NSLog(@"initWithCoder: called");
        [self initNibFile];
    }
    
    return self;
}

- (void)initNibFile {
    NSArray *temp = [[NSBundle mainBundle] loadNibNamed:@"CustomView" owner:self options:nil];
    NSLog(@"%@", temp);
    [self addSubview:self.contentView];
    [self.contentView setFrame:self.bounds];
    [self.contentView setBackgroundColor:UIColor.blueColor];
    [self.contentView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
}

@end
