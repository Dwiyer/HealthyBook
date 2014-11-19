//
//  DWBaseTableViewController.m
//  HealthyBook
//
//  Created by Mac mini on 14-10-30.
//  Copyright (c) 2014年 Efun. All rights reserved.
//

#import "DWBaseTableViewController.h"
#import "DWTableViewCell.h"

@interface DWBaseTableViewController ()

@end

@implementation DWBaseTableViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    _allGroup = [NSMutableArray array];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _allGroup.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *items = _allGroup[section];
    return items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DWTableViewCell *cell = [DWTableViewCell cellWithTableView:tableView];
    // Configure the cell...
    cell.cellModel = _allGroup[indexPath.section][indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CellModel *cellModel = _allGroup[indexPath.section][indexPath.row];
    if (cellModel.operation) {
        cellModel.operation();
        return;
    }
    if (cellModel.toPresentedController) {
        DWBaseTableViewController *viewController = [[cellModel.toPresentedController alloc] init];
        [self presentViewController:viewController animated:YES completion:nil];
    }
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
@end
