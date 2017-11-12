//
//  ContactsViewController.m
//  Assignment
//
//  Created by Jaeho on 2017. 11. 13..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import "ContactsViewController.h"

#import "ContactsTableViewCell.h"
#import "ContactDetailViewController.h"

@interface ContactsViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *contactsTableView;

@property (strong, nonatomic) NSArray *contactList;

@end

@implementation ContactsViewController

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fetchContactStore];
    
    self.contactsTableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    
    [self.contactsTableView setDelegate:self];
    [self.contactsTableView setDataSource:self];
    
    [self.contactsTableView registerNib:[UINib nibWithNibName:@"ContactsTableViewCell" bundle:nil] forCellReuseIdentifier:contactsCellIdentifier];
    
    [self.contactsTableView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    
    [self.view addSubview:self.contactsTableView];
}

#pragma mark - Memory Management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Methods

- (void)fetchContactStore {
    CNContactStore *contactStore = [[CNContactStore alloc] init];
    
    NSArray *keyForFetch = @[CNContactGivenNameKey,
                             CNContactFamilyNameKey,
                             CNContactPhoneNumbersKey,
                             CNContactOrganizationNameKey];
    
    NSPredicate *predicate = [CNContact predicateForContactsInContainerWithIdentifier:[contactStore defaultContainerIdentifier]];
    
    self.contactList = [contactStore unifiedContactsMatchingPredicate:predicate keysToFetch:keyForFetch error:nil];
}

#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contactList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ContactsTableViewCell *contactsTableViewCell = [tableView dequeueReusableCellWithIdentifier:contactsCellIdentifier forIndexPath:indexPath];
    
    CNContact *contact = self.contactList[indexPath.row];
    
    [contactsTableViewCell.nameLabel setText:[NSString stringWithFormat:@"%@%@", contact.familyName, contact.givenName]];
    
    return contactsTableViewCell;
}

#pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ContactDetailViewController *contactDetailViewController = [[ContactDetailViewController alloc] initWithNibName:@"ContactDetailViewController" bundle:nil];
    
    CNContact *selectedContact = self.contactList[indexPath.row];
    [contactDetailViewController setContact:selectedContact];
    
    [self.navigationController pushViewController:contactDetailViewController animated:YES];
}

@end
