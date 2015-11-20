//
//  DZViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/20.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "DZViewController.h"
#import "DZViewModel.h"
#import "DZCell.h"
#import "DZContentCell.h"
#import "CSRNewsHtmlViewController.h"

@interface DZViewController ()
@property (nonatomic, strong)DZViewModel *dzVM;
@end

@implementation DZViewController
+ (UINavigationController *)defaultNavi{
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DZViewController *vc = [DZViewController new];
        navi = [[UINavigationController alloc] initWithRootViewController:vc];
    });
    return navi;
}
- (DZViewModel *)dzVM
{
    if (!_dzVM)
    {
        _dzVM = [[DZViewModel alloc]init];
    }
    return _dzVM;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self.tableView registerClass:[DZCell class] forCellReuseIdentifier:@"dzCell"];
    [self.tableView registerClass:[DZContentCell class] forCellReuseIdentifier:@"contentCell"];
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.dzVM refreshDataCompletionHandle:^(NSError *error) {
            [self.tableView.header endRefreshing];
            [self.tableView reloadData];
        }];
    }];
    self.tableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.dzVM getMoreDataCompletionHandle:^(NSError *error) {
            [self.tableView.footer endRefreshing];
            [self.tableView reloadData];
      }];
    }];
    [self.tableView.header beginRefreshing];
    [Factory addMenuItemToVC:self];
    self.title = @"搞笑段子";
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dzVM.rowNumber;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.dzVM hasImageForRow:indexPath.row])
    {
        DZCell *cell = [tableView dequeueReusableCellWithIdentifier:@"dzCell"];
        [cell.iconIV.imageView setImageWithURL:[self.dzVM thumbNailForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
        cell.commentLb.text = [self.dzVM commentsAllForRow:indexPath.row];
        cell.likeLb.text = [self.dzVM likesForRow:indexPath.row];
        return cell;
    }
    
        DZContentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"contentCell"];
        cell.contentLb.text = [self.dzVM contentForRow:indexPath.row];
        cell.commentLb.text = [self.dzVM commentsAllForRow:indexPath.row];
        cell.likeLb.text = [self.dzVM likesForRow:indexPath.row];
        return cell;
}

//自适应高度
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    CSRNewsHtmlViewController *vc = [[CSRNewsHtmlViewController alloc]initWithUrl:[self.dzVM commentsUrlForRow:indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
