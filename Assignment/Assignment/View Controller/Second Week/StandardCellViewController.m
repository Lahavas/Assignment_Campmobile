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
@property (strong, nonatomic) UIBarButtonItem *tableStyleToggleButton;

@property (strong, nonatomic) NSArray *dataSectionArray;
@property (strong, nonatomic) NSMutableDictionary *dataDictionary;

@end

#pragma mark -

@implementation StandardCellViewController

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    
    [self initTableViewWithStyle:UITableViewStylePlain];
    
    self.tableStyleToggleButton = [[UIBarButtonItem alloc] initWithTitle:@"reloadToGroup" style:UIBarButtonItemStylePlain target:self action:@selector(toggleTableType)];
    [self.navigationItem setRightBarButtonItem:self.tableStyleToggleButton];
}

#pragma mark - Memory Management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (void)toggleTableType {
    if ([self.tableStyleToggleButton.title isEqualToString:@"reloadToGroup"]) {
        [self.tableStyleToggleButton setTitle:@"reloadToPlain"];
        
        [self initTableViewWithStyle:UITableViewStyleGrouped];
    } else if ([self.tableStyleToggleButton.title isEqualToString:@"reloadToPlain"]) {
        [self.tableStyleToggleButton setTitle:@"reloadToGroup"];
        
        [self initTableViewWithStyle:UITableViewStylePlain];
    }
}

#pragma mark - Private Methods

- (void)initData {
    [self setDataSectionArray:@[@"default", @"value1", @"value2", @"subtitle"]];
    self.dataDictionary = [[NSMutableDictionary alloc] init];
    
    for (NSString *dataSection in self.dataSectionArray) {
        NSMutableArray *dataArrayInSection = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < 5; i++) {
            [dataArrayInSection addObject:[NSString stringWithFormat:@"%@#%d", dataSection, i]];
        }
        
        [self.dataDictionary setObject:dataArrayInSection forKey:dataSection];
    }
}

- (void)initTableViewWithStyle:(UITableViewStyle)style {
    if (self.tableView != nil) {
        [self.tableView removeFromSuperview];
    }
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:style];
    [self.tableView setAutoresizingMask:UIViewAutoresizingFlexibleWidth |
                                        UIViewAutoresizingFlexibleHeight];
    
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    
    [self.view addSubview:self.tableView];
}

#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSectionArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *dataSectionTitle = self.dataSectionArray[section];
    NSArray *dataArrayInSection = [self.dataDictionary objectForKey:dataSectionTitle];
    
    return dataArrayInSection.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.dataSectionArray[section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *dataSectionTitle = self.dataSectionArray[indexPath.section];
    
    UITableViewCell *cell = nil;
    
    if ([dataSectionTitle isEqualToString:@"default"]) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:dataSectionTitle];
    } else if ([dataSectionTitle isEqualToString:@"value1"]) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:dataSectionTitle];
    } else if ([dataSectionTitle isEqualToString:@"value2"]) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:dataSectionTitle];
    } else if ([dataSectionTitle isEqualToString:@"subtitle"]) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:dataSectionTitle];
    }
    
    NSArray *dataArrayInSection = [self.dataDictionary objectForKey:dataSectionTitle];
    NSString *dataTitle = dataArrayInSection[indexPath.row];
    
    [cell.textLabel setText:dataTitle];
    [cell.detailTextLabel setText:[NSString stringWithFormat:@"%@ called", dataTitle]];
    [cell.imageView setImage:[UIImage imageNamed:@"defaultImage"]];
    
    return cell;
}

@end
