//
//  AssignmentViewController.m
//  Assignment
//
//  Created by Jaeho on 2017. 11. 7..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import "AssignmentViewController.h"

#import "Assignment.h"
#import "AssignmentManager.h"

#import "ContactsViewController.h"
#import "PageViewController.h"

#import "CustomViewController.h"
#import "SimpleAnimationViewController.h"
#import "SpringAnimationViewController.h"

@interface AssignmentViewController () <UITableViewDelegate, UITableViewDataSource>

#pragma mark - Properties

@property (strong, nonatomic) UITableView *assignmentTableView;
@property (strong, nonatomic) NSArray *assignmentList;

@end

#pragma mark -

@implementation AssignmentViewController

#pragma mark - Initialization

- (instancetype)initWithWeekNumber:(NSInteger)weekNumber {
    self = [super init];
    
    if (self) {
        switch (weekNumber) {
            case 1:
                _assignmentList = [AssignmentManager firstWeekAssignment];
                break;
            case 2:
                _assignmentList = [AssignmentManager secondWeekAssignment];
                break;
            case 3:
                _assignmentList = [AssignmentManager thirdWeekAssignment];
                break;
            case 4:
                _assignmentList = [AssignmentManager fourthWeekAssignment];
                break;
            default:
                break;
        }
    }
    
    return self;
}

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.assignmentTableView = [[UITableView alloc] init];
    
    [self.assignmentTableView setDelegate:self];
    [self.assignmentTableView setDataSource:self];
    
    [self.assignmentTableView reloadData];
    
    self.view = self.assignmentTableView;
}

#pragma mark - Memory Management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Private Methods

- (void)executeAssignment:(AssignmentType)type {
    if (type == AssignmentContacts) {
        ContactsViewController *contactsViewController = [[ContactsViewController alloc] init];
        
        [self.navigationController pushViewController:contactsViewController animated:YES];
    } else if (type == AssignmentPages) {
        PageViewController *pageViewController = [[PageViewController alloc] init];
        
        [self.navigationController pushViewController:pageViewController animated:YES];
    } else if (type == AssignmentView) {
        CustomViewController *customViewController = [[CustomViewController alloc] init];
        
        [self.navigationController pushViewController:customViewController animated:YES];
    } else if (type == AssignmentSimpleAnimation) {
        SimpleAnimationViewController *simpleAnimationViewController = [[SimpleAnimationViewController alloc] init];
        
        [self.navigationController pushViewController:simpleAnimationViewController animated:YES];
    } else if (type == AssignmentSpringAnimation) {
        SpringAnimationViewController *springAnimationViewController = [[SpringAnimationViewController alloc] init];
        
        [self.navigationController pushViewController:springAnimationViewController animated:YES];
    }
}

#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.assignmentList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *assignmentCellIdentifier = @"AssignmentTableViewCell";
    UITableViewCell *assignmentTableViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:assignmentCellIdentifier];
    
    Assignment *assignment = [self.assignmentList objectAtIndex:indexPath.row];
    
    [assignmentTableViewCell.textLabel setText:assignment.title];
    
    return assignmentTableViewCell;
}

#pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Assignment *assignment = [self.assignmentList objectAtIndex:indexPath.row];
    
    [self executeAssignment:assignment.type];
}

@end
