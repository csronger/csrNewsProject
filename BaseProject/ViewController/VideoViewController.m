//
//  VideoViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoViewController.h"
#import "VideoViewModel.h"
#import "VideoCell.h"

@interface VideoViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic)UITableView *tableView;

@property (nonatomic, strong)VideoViewModel *videoVM;

@end

@implementation VideoViewController

+ (UINavigationController *)defaultNavi
{
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        VideoViewController *vc = [VideoViewController new];
        navi = [[UINavigationController alloc]initWithRootViewController:vc];
    });
    return navi;
}
- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        [_tableView registerClass:[VideoCell class] forCellReuseIdentifier:@"Cell"];
        _tableView.tableFooterView = [UIView new];
        
        _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.videoVM refreshDataCompletionHandle:^(NSError *error) {
                [_tableView reloadData];
                [_tableView.header endRefreshing];
            }];
        }];
        _tableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            [self.videoVM getMoreDataCompletionHandle:^(NSError *error) {
                [_tableView reloadData];
                [_tableView.footer endRefreshing];
            }];
        }];
    }
    return _tableView;
}
- (VideoViewModel *)videoVM
{
    if (!_videoVM)
    {
        _videoVM = [VideoViewModel new];
    }
    return _videoVM;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [Factory addMenuItemToVC:self];
    self.title = @"视频新闻";
    [self.tableView.header beginRefreshing];
}

#pragma mark - UITableViewDelegate 注意是Group形式，以section区分
//设置section头部高度1像素，高度最小为1
//设置section脚部高度9像素
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 9;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.videoVM.rowNumber;
}
//row的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = kWindowW * 540.0 / 720;
    return height;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  1;
}
- (VideoCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    VideoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.titleLabel.text = [self.videoVM titleForRow:indexPath.section];
    cell.descLabel.text = [self.videoVM descForRow:indexPath.section];
    [cell.iconButton setBackgroundImageForState:0 withURL:[self.videoVM iconURLForRow:indexPath.section]];
    
    cell.videoURL = [self.videoVM videoURLForRow:indexPath.section];
    return cell;
}

@end
