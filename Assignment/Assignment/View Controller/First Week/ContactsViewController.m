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
    
    self.contactsTableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.contactsTableView setAutoresizingMask:UIViewAutoresizingFlexibleWidth |
                                                UIViewAutoresizingFlexibleHeight];
    
    [self.contactsTableView setDelegate:self];
    [self.contactsTableView setDataSource:self];
    
    [self.contactsTableView registerClass:ContactsTableViewCell.self forCellReuseIdentifier:@"ContactsTableViewCell"];
    
    self.contactArray = @[[[Contact alloc] initWithFirstName:@"One" andLastName:@"Firstasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasasdfasdfasdfasdfasdfasdfasdfasdf" andPhoneType:@"집" andPhoneNumber:@"010-1111-1111"],
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
    ContactsTableViewCell *contactsTableViewCell = [tableView dequeueReusableCellWithIdentifier:@"ContactsTableViewCell" forIndexPath:indexPath];
    
    Contact *contact = [self.contactArray objectAtIndex:indexPath.row];
    
    [contactsTableViewCell.firstNameLabel setText:contact.firstName];
    [contactsTableViewCell.lastNameLabel setText:contact.lastName];
    [contactsTableViewCell.phoneTypeLabel setText:contact.phoneType];
    [contactsTableViewCell.phoneNumberLabel setText:contact.phoneNumber];
    
    return contactsTableViewCell;
}

#pragma mark - Table View Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 140.0;
}

@end
