//
//  ContactDetailViewController.m
//  Assignment
//
//  Created by Jaeho on 2017. 11. 13..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import "ContactDetailViewController.h"

#import "ContactProfileView.h"

@interface ContactDetailViewController ()

@property (weak, nonatomic) IBOutlet ContactProfileView *contactProfileView;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;

@end

@implementation ContactDetailViewController

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.contactProfileView.nameLabel setText:[NSString stringWithFormat:@"%@%@", self.contact.familyName, self.contact.givenName]];
    [self.contactProfileView.organizationLabel setText:self.contact.organizationName];
    
    [self.phoneLabel setText:[NSString stringWithFormat:@"전화번호: %@", self.contact.phoneNumbers[0].value.stringValue]];
}

#pragma mark - Memory Management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
