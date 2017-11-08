//
//  ContactsViewController.m
//  Assignment
//
//  Created by Jaeho on 2017. 11. 7..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import "ContactsViewController.h"

#import "Contact.h"
#import "ContactsTableViewCell.h"

@interface ContactsViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *contactsTableView;

@property (strong, nonatomic) NSArray *contactArray;

@end

@implementation ContactsViewController

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.contactsTableView = [[UITableView alloc] init];
    
    [self.contactsTableView setDelegate:self];
    [self.contactsTableView setDataSource:self];
    
    [self.contactsTableView registerClass:ContactsTableViewCell.self forCellReuseIdentifier:@"ContactsTableViewCell"];
    
    self.contactArray = @[[[Contact alloc] initWithFirstName:@"One" andLastName:@"Firstasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasasdfasdfasdfasdfasdfasdfasdfasdf" andPhoneType:@"집" andPhoneNumber:@"010-1111-1111"],
                          [[Contact alloc] initWithFirstName:@"Two" andLastName:@"Second" andPhoneType:@"휴대전화" andPhoneNumber:@"010-2222-2222"],
                          [[Contact alloc] initWithFirstName:@"Three" andLastName:@"Third" andPhoneType:@"휴대전화" andPhoneNumber:@"010-3333-3333"]];
    
    [self.contactsTableView setRowHeight:140.0];
    
    self.view = self.contactsTableView;
}

#pragma mark - Memory Management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contactArray.count;
}

#pragma mark - Table View Delegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ContactsTableViewCell *contactsTableViewCell = [tableView dequeueReusableCellWithIdentifier:@"ContactsTableViewCell" forIndexPath:indexPath];
    
    Contact *contact = [self.contactArray objectAtIndex:indexPath.row];
    
    [contactsTableViewCell.firstNameLabel setText:contact.firstName];
    [contactsTableViewCell.lastNameLabel setText:contact.lastName];
    [contactsTableViewCell.phoneTypeLabel setText:contact.phoneType];
    [contactsTableViewCell.phoneNumberLabel setText:contact.phoneNumber];
    
    [contactsTableViewCell.firstNameLabel sizeToFit];
    [contactsTableViewCell.lastNameLabel sizeToFit];
    [contactsTableViewCell.phoneTypeLabel sizeToFit];
    [contactsTableViewCell.phoneNumberLabel sizeToFit];
    
    CGFloat firstNameOriginX = contactsTableViewCell.profileImageView.frame.origin.x + contactsTableViewCell.profileImageView.frame.size.width + 15.0;
    CGFloat firstNameOriginY = 10.0;
    CGFloat firstNameSizeWidth = contactsTableViewCell.contentView.frame.size.width - firstNameOriginX - 15.0;
    CGFloat firstNameSizeHeight = 15.0;
    
    CGFloat lastNameOriginX = contactsTableViewCell.profileImageView.frame.origin.x + contactsTableViewCell.profileImageView.frame.size.width + 15.0;
    CGFloat lastNameOriginY = firstNameOriginY + firstNameSizeHeight + 15.0;
    CGFloat lastNameSizeWidth = contactsTableViewCell.contentView.frame.size.width - lastNameOriginX - 15.0;
    CGFloat lastNameSizeHeight = 15.0;
    
    CGFloat phoneTypeOriginX = 15.0;
    CGFloat phoneTypeOriginY = contactsTableViewCell.profileImageView.frame.origin.y + contactsTableViewCell.profileImageView.frame.size.height + 15.0;
    CGSize phoneTypeSize = [contactsTableViewCell.phoneTypeLabel.text sizeWithAttributes:@{NSFontAttributeName:contactsTableViewCell.phoneTypeLabel.font}];
    
    CGFloat phoneNumberOriginX = phoneTypeOriginX + phoneTypeSize.width + 15.0;
    CGFloat phoneNumberOriginY = contactsTableViewCell.profileImageView.frame.origin.y + contactsTableViewCell.profileImageView.frame.size.height + 15.0;
    CGFloat phoneNumberSizeWidth = contactsTableViewCell.contentView.frame.size.width - phoneNumberOriginX - 15.0;
    CGFloat phoneNumberSizeHeight = [contactsTableViewCell.phoneNumberLabel.text sizeWithAttributes:@{NSFontAttributeName:contactsTableViewCell.phoneNumberLabel.font}].height;
    
    [contactsTableViewCell.firstNameLabel setFrame:CGRectMake(firstNameOriginX, firstNameOriginY, firstNameSizeWidth, firstNameSizeHeight)];
    [contactsTableViewCell.lastNameLabel setFrame:CGRectMake(lastNameOriginX, lastNameOriginY, lastNameSizeWidth, lastNameSizeHeight)];
    [contactsTableViewCell.phoneTypeLabel setFrame:CGRectMake(phoneTypeOriginX, phoneTypeOriginY, phoneTypeSize.width, phoneTypeSize.height)];
    [contactsTableViewCell.phoneNumberLabel setFrame:CGRectMake(phoneNumberOriginX, phoneNumberOriginY, phoneNumberSizeWidth, phoneNumberSizeHeight)];
    
    return contactsTableViewCell;
}

@end
