//
//  ContactsResizingViewController.m
//  Assignment
//
//  Created by Jaeho on 2017. 11. 13..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import "ContactsResizingViewController.h"

#import "Contact.h"
#import "ContactsResizingTableViewCell.h"

@interface ContactsResizingViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *contactsTableView;

@property (strong, nonatomic) NSArray *contactArray;

@end

@implementation ContactsResizingViewController

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.contactsTableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.contactsTableView setAutoresizingMask:UIViewAutoresizingFlexibleWidth |
     UIViewAutoresizingFlexibleHeight];
    
    [self.contactsTableView setDelegate:self];
    [self.contactsTableView setDataSource:self];
    
    [self.contactsTableView registerClass:ContactsResizingTableViewCell.self forCellReuseIdentifier:contactResizingCellIdentifier];
    
    self.contactArray = @[[[Contact alloc] initWithFirstName:@"One" andLastName:@"Firstasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasasdfasdfasdfasdfasdfasdfasdfasdf" andPhoneType:@"집" andPhoneNumber:@"010-1111-1111"],
                          [[Contact alloc] initWithFirstName:@"Two" andLastName:@"Second" andPhoneType:@"휴대전화" andPhoneNumber:@"010-2222-2222"],
                          [[Contact alloc] initWithFirstName:@"Three" andLastName:@"Third" andPhoneType:@"휴대전화" andPhoneNumber:@"010-3333-3333"],
                          [[Contact alloc] initWithFirstName:@"Two" andLastName:@"Second" andPhoneType:@"휴대전화" andPhoneNumber:@"010-2222-2222"],
                          [[Contact alloc] initWithFirstName:@"Three" andLastName:@"Third" andPhoneType:@"휴대전화" andPhoneNumber:@"010-3333-3333"],
                          [[Contact alloc] initWithFirstName:@"Two" andLastName:@"Second" andPhoneType:@"휴대전화" andPhoneNumber:@"010-2222-2222"],
                          [[Contact alloc] initWithFirstName:@"Three" andLastName:@"Third" andPhoneType:@"휴대전화" andPhoneNumber:@"010-3333-3333"],
                          [[Contact alloc] initWithFirstName:@"Two" andLastName:@"Second" andPhoneType:@"휴대전화" andPhoneNumber:@"010-2222-2222"],
                          [[Contact alloc] initWithFirstName:@"Three" andLastName:@"Third" andPhoneType:@"휴대전화" andPhoneNumber:@"010-3333-3333"],
                          [[Contact alloc] initWithFirstName:@"Two" andLastName:@"Second" andPhoneType:@"휴대전화" andPhoneNumber:@"010-2222-2222"],
                          [[Contact alloc] initWithFirstName:@"Three" andLastName:@"Third" andPhoneType:@"휴대전화" andPhoneNumber:@"010-3333-3333"],
                          [[Contact alloc] initWithFirstName:@"Two" andLastName:@"Second" andPhoneType:@"휴대전화" andPhoneNumber:@"010-2222-2222"],
                          [[Contact alloc] initWithFirstName:@"Three" andLastName:@"Third" andPhoneType:@"휴대전화" andPhoneNumber:@"010-3333-3333"],
                          [[Contact alloc] initWithFirstName:@"Two" andLastName:@"Second" andPhoneType:@"휴대전화" andPhoneNumber:@"010-2222-2222"],
                          [[Contact alloc] initWithFirstName:@"Three" andLastName:@"Third" andPhoneType:@"휴대전화" andPhoneNumber:@"010-3333-3333"],
                          [[Contact alloc] initWithFirstName:@"Two" andLastName:@"Second" andPhoneType:@"휴대전화" andPhoneNumber:@"010-2222-2222"],
                          [[Contact alloc] initWithFirstName:@"Three" andLastName:@"Third" andPhoneType:@"휴대전화" andPhoneNumber:@"010-3333-3333"],
                          [[Contact alloc] initWithFirstName:@"Two" andLastName:@"Second" andPhoneType:@"휴대전화" andPhoneNumber:@"010-2222-2222"],
                          [[Contact alloc] initWithFirstName:@"Three" andLastName:@"Third" andPhoneType:@"휴대전화" andPhoneNumber:@"010-3333-3333"],
                          [[Contact alloc] initWithFirstName:@"Two" andLastName:@"Second" andPhoneType:@"휴대전화" andPhoneNumber:@"010-2222-2222"],
                          [[Contact alloc] initWithFirstName:@"Three" andLastName:@"Third" andPhoneType:@"휴대전화" andPhoneNumber:@"010-3333-3333"],
                          [[Contact alloc] initWithFirstName:@"Two" andLastName:@"Second" andPhoneType:@"휴대전화" andPhoneNumber:@"010-2222-2222"],
                          [[Contact alloc] initWithFirstName:@"Three" andLastName:@"Third" andPhoneType:@"휴대전화" andPhoneNumber:@"010-3333-3333"],
                          [[Contact alloc] initWithFirstName:@"Two" andLastName:@"Second" andPhoneType:@"휴대전화" andPhoneNumber:@"010-2222-2222"],
                          [[Contact alloc] initWithFirstName:@"Three" andLastName:@"Third" andPhoneType:@"휴대전화" andPhoneNumber:@"010-3333-3333"]];
    
    [self.view addSubview:self.contactsTableView];
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    ContactsResizingTableViewCell *contactsResizingTableViewCell = [tableView dequeueReusableCellWithIdentifier:contactResizingCellIdentifier forIndexPath:indexPath];
    
    Contact *contact = [self.contactArray objectAtIndex:indexPath.row];
    
    [contactsResizingTableViewCell.firstNameLabel setText:contact.firstName];
    [contactsResizingTableViewCell.lastNameLabel setText:contact.lastName];
    [contactsResizingTableViewCell.phoneTypeLabel setText:contact.phoneType];
    [contactsResizingTableViewCell.phoneNumberLabel setText:contact.phoneNumber];
    
    return contactsResizingTableViewCell;
}

#pragma mark - Table View Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 140.0;
}

@end
