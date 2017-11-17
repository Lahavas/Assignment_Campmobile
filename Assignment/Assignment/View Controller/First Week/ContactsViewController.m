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

@interface ContactsViewController () <UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

@property (strong, nonatomic) UITableView *contactsTableView;
@property (strong, nonatomic) UIButton *floatingButton;

@property (strong, nonatomic) NSMutableArray *contactList;

@end

@implementation ContactsViewController

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fetchContactStore];
    
    self.contactsTableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    
    [self.contactsTableView setDelegate:self];
    [self.contactsTableView setDataSource:self];
    
    [self.contactsTableView registerNib:[UINib nibWithNibName:@"ContactsTableViewCell" bundle:nil] forCellReuseIdentifier:[ContactsTableViewCell reuseIdentifier]];
    
    [self.contactsTableView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    
    [self.view addSubview:self.contactsTableView];
    
    self.floatingButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.floatingButton addTarget:self
                       action:@selector(addContacts)
             forControlEvents:UIControlEventTouchUpInside];
    [self.floatingButton setTitle:@"Add" forState:UIControlStateNormal];
    
    CGFloat floatingButtonMarginRate = 0.8;
    CGFloat floatingButtonSize = 65.0;
    
    CGFloat floatingButtonOriginX = CGRectGetMaxX(self.view.frame) * floatingButtonMarginRate;
    CGFloat floatingButtonOriginY = CGRectGetMaxY(self.view.frame) * floatingButtonMarginRate;
    CGFloat floatingButtonWidth = floatingButtonSize;
    CGFloat floatingButtonHeight = floatingButtonSize;
    
    [self.floatingButton setFrame:CGRectMake(floatingButtonOriginX, floatingButtonOriginY, floatingButtonWidth, floatingButtonHeight)];
    
    [self.floatingButton setAutoresizingMask:
     UIViewAutoresizingFlexibleTopMargin |
     UIViewAutoresizingFlexibleBottomMargin |
     UIViewAutoresizingFlexibleRightMargin | 
     UIViewAutoresizingFlexibleLeftMargin];
    
    [self.view addSubview:self.floatingButton];
}

#pragma mark - Memory Management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Methods

- (void)fetchContactStore {
    self.contactList = [[NSMutableArray alloc] init];
    
    CNContactStore *contactStore = [[CNContactStore alloc] init];
    
    NSArray *keyForFetch = @[CNContactGivenNameKey,
                             CNContactFamilyNameKey,
                             CNContactPhoneNumbersKey,
                             CNContactOrganizationNameKey];
    NSPredicate *predicate = [CNContact predicateForContactsInContainerWithIdentifier:[contactStore defaultContainerIdentifier]];
    
    CNContactFetchRequest *fetchRequest = [[CNContactFetchRequest alloc] initWithKeysToFetch:keyForFetch];
    [fetchRequest setPredicate:predicate];
    [fetchRequest setSortOrder:CNContactSortOrderFamilyName];
    
    __weak typeof(self) weakSelf = self;
    
    [contactStore enumerateContactsWithFetchRequest:fetchRequest
                                              error:nil
                                         usingBlock:^(CNContact * _Nonnull contact, BOOL * _Nonnull stop) {
        [weakSelf.contactList addObject:contact];
    }];
}

- (void)addContacts {
    
}

#pragma mark - Scroll View Delegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if ([scrollView isEqual:self.contactsTableView]) {
        [self.floatingButton setHidden:YES];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if ([scrollView isEqual:self.contactsTableView]) {
        [self.floatingButton setHidden:NO];
    }
}

#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contactList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ContactsTableViewCell *contactsTableViewCell = [tableView dequeueReusableCellWithIdentifier:[ContactsTableViewCell reuseIdentifier] forIndexPath:indexPath];
    
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
