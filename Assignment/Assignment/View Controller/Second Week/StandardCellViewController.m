//
//  StandardCellViewController.m
//  Assignment
//
//  Created by Jaeho on 2017. 11. 10..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import "StandardCellViewController.h"

@interface StandardCellViewController () <UITableViewDelegate, UITableViewDataSource>

#pragma mark - Private Properties

@property (strong, nonatomic) UITableView *tableView;

@end

#pragma mark -

@implementation StandardCellViewController

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    
    [self.view addSubview:self.tableView];
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
    return 1;
}

#pragma mark - Table View Delegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier"];
    
    return cell;
}

@end
