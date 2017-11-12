//
//  ContactsEditingViewController.m
//  Assignment
//
//  Created by Jaeho on 2017. 11. 13..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import "ContactsEditingViewController.h"

#import "Contact.h"

@interface ContactsEditingViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray *contactList;

@property (strong, nonatomic) UITableView *contactTableView;

@end

@implementation ContactsEditingViewController

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initContactList];

    self.contactTableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    
    UIBarButtonItem *batchButton = [[UIBarButtonItem alloc] initWithTitle:@"일괄 처리" style:UIBarButtonItemStylePlain target:self action:@selector(insertAndDeletePersonList)];
    
    [self.contactTableView setDelegate:self];
    [self.contactTableView setDataSource:self];
    
    [self.contactTableView setAutoresizingMask: UIViewAutoresizingFlexibleWidth];
    
    [self.view addSubview:self.contactTableView];
    
    [self.navigationItem setRightBarButtonItems:@[self.editButtonItem, batchButton]];
    
    NSLog(@"viewDidLoad called");
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSLog(@"viewWillAppear: called");
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSLog(@"viewDidAppear: called");
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    NSLog(@"viewWillDisappear: called");
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    NSLog(@"viewDidDisappear: called");
}

#pragma mark - Memory Management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - View Controller Methods

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    [self.contactTableView setEditing:editing animated:YES];
    
    NSLog(@"setEditing:animated: called");
}

#pragma mark - Actions

- (void)insertAndDeletePersonList {
    
    [self.contactList removeObjectAtIndex:2];
    [self.contactList removeObjectAtIndex:4];
    
    NSArray *deleteIndexPaths = @[[NSIndexPath indexPathForRow:2 inSection:0],
                                  [NSIndexPath indexPathForRow:4 inSection:0]];
    
    Contact *batchedContact = [[Contact alloc] initWithFirstName:@"batched contact" andPhoneNumber:@"123-4567"];
    [self.contactList insertObject:batchedContact atIndex:1];
    [self.contactList insertObject:batchedContact atIndex:3];
    [self.contactList insertObject:batchedContact atIndex:5];
    
    NSArray *insertIndexPaths = @[[NSIndexPath indexPathForRow:1 inSection:0],
                                  [NSIndexPath indexPathForRow:3 inSection:0],
                                  [NSIndexPath indexPathForRow:5 inSection:0]];
    
    [self.contactTableView beginUpdates];
    
    [self.contactTableView insertRowsAtIndexPaths:insertIndexPaths withRowAnimation:UITableViewRowAnimationFade];
    [self.contactTableView deleteRowsAtIndexPaths:deleteIndexPaths withRowAnimation:UITableViewRowAnimationRight];
    
    [self.contactTableView endUpdates];
}

#pragma mark - Private Methods

- (void)initContactList {
    self.contactList = [NSMutableArray arrayWithArray:@[[[Contact alloc] initWithFirstName:@"zero" andPhoneNumber:@"000-0000"],
                                                       [[Contact alloc] initWithFirstName:@"one" andPhoneNumber:@"111-1111"],
                                                       [[Contact alloc] initWithFirstName:@"two" andPhoneNumber:@"222-2222"],
                                                       [[Contact alloc] initWithFirstName:@"three" andPhoneNumber:@"333-3333"],
                                                       [[Contact alloc] initWithFirstName:@"four" andPhoneNumber:@"444-4444"],
                                                       [[Contact alloc] initWithFirstName:@"five" andPhoneNumber:@"555-5555"],
                                                       [[Contact alloc] initWithFirstName:@"six" andPhoneNumber:@"666-6666"],
                                                       [[Contact alloc] initWithFirstName:@"seven" andPhoneNumber:@"777-7777"],
                                                       [[Contact alloc] initWithFirstName:@"eight" andPhoneNumber:@"888-8888"],
                                                       [[Contact alloc] initWithFirstName:@"nine" andPhoneNumber:@"999-9999"]]];
}

#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSLog(@"numberOfSectionsInTableView: called");
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"tableView:numberOfRowsInSection: called");
    
    return self.contactList.count + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"tableView:cellForRowAtIndexPath: called");
    
    static NSString *cellIdentifier = @"contactCell";
    UITableViewCell *contactCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    
    if (indexPath.row < self.contactList.count) {
        Contact *contact = self.contactList[indexPath.row];
        
        [contactCell.textLabel setText:contact.firstName];
        [contactCell.detailTextLabel setText:contact.phoneNumber];
    }
    
    return contactCell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"tableView:canEditRowAtIndexPath: called");
    
    if (indexPath.row == 1) {
        return NO;
    }
    
    return YES;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"tableView:canMoveRowAtIndexPath: called");
    
    if (indexPath.row == self.contactList.count) {
        return NO;
    }
    
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"tableView:commitEditingStyle:forRowAtIndexPath: called");
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.contactList removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        Contact *insertedContact = [[Contact alloc] initWithFirstName:@"new Contact" andPhoneNumber:@"987-6543"];
        
        [self.contactList insertObject:insertedContact atIndex:indexPath.row];
        [tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    NSLog(@"tableView:moveRowAtIndexPath:toIndexPath: called");
    
    Contact *reorderedContact = self.contactList[sourceIndexPath.row];
    
    [self.contactList removeObjectAtIndex:sourceIndexPath.row];
    [self.contactList insertObject:reorderedContact atIndex:destinationIndexPath.row];
}

#pragma mark - Table View Delegate

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"tableView:editingStyleForRowAtIndexPath: called");
    
    if (indexPath.row < self.contactList.count) {
        return UITableViewCellEditingStyleDelete;
    } else {
        return UITableViewCellEditingStyleInsert;
    }
}

- (NSIndexPath *)tableView:(UITableView *)tableView
targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath
       toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath {
    NSLog(@"tableView:targetIndexPathForMoveFromRowAtIndexPath:toProposedIndexPath: called");
    
    if (proposedDestinationIndexPath.row == self.contactList.count) {
        return sourceIndexPath;
    }
    
    return proposedDestinationIndexPath;
}

@end
