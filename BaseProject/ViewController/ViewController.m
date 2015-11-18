
//
//  ViewController.m
//  BaseProject
//
//  Created by tarena on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ViewController.h"
#import "PSCollectionView.h"
#import "BeautifulViewModel.h"

@interface ViewController ()<UIScrollViewDelegate, PSCollectionViewDelegate, PSCollectionViewDataSource>

@property (nonatomic, strong)PSCollectionView *collectionView;
@property (nonatomic, strong)BeautifulViewModel *vm;

@end

@implementation ViewController
+ (UINavigationController *)defaultNavi{
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ViewController *vc = [ViewController new];
        navi = [[UINavigationController alloc] initWithRootViewController:vc];
    });
    return navi;
}
-(BeautifulViewModel *)vm
{
    if (!_vm)
    {
        _vm = [BeautifulViewModel new];
    }
    return _vm;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.collectionView = [[PSCollectionView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, kWindowH)];
    self.collectionView.delegate = self;
    self.collectionView.collectionViewDelegate = self;
    self.collectionView.collectionViewDataSource = self;
    
    [self.view addSubview:self.collectionView];
    //设置竖向 两行
    self.collectionView.numColsPortrait = 2;
    
    //头部刷新
    self.collectionView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.vm refreshDataCompleteHandle:^(NSError *error) {
           
            //AF的回调 是在主线程中
            [self.collectionView reloadData];
            if (error)
            {
                [self showErrorMsg:error.description];
            }
            [self.collectionView.header endRefreshing];
        }];
    }];
    
    [self.collectionView.header beginRefreshing];
    
    self.collectionView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.vm getMoreDataCompleteHandle:^(NSError *error) {
            [self.collectionView reloadData];
            if (error)
            {
                [self showErrorMsg:error.description];
            }
            [self.collectionView.footer endRefreshing];
        }];
    }];
    
    self.title = @"COSPlay";
    [Factory addMenuItemToVC:self];
}

- (NSInteger)numberOfRowsInCollectionView:(PSCollectionView *)collectionView
{
    return self.vm.rowNumber;
}
- (CGFloat)collectionView:(PSCollectionView *)collectionView heightForRowAtIndex:(NSInteger)index
{
    AlbumDataModel *data = [self.vm.dataArr objectAtIndex:index];
    CGFloat width = data.coverWidth.floatValue;
    CGFloat height = data.coverHeight.floatValue;
    
    return (kWindowW/2 - 12) * height/width;
}

- (PSCollectionViewCell *)collectionView:(PSCollectionView *)collectionView cellForRowAtIndex:(NSInteger)index
{
    PSCollectionViewCell *cell = [collectionView dequeueReusableViewForClass:nil];
    if (!cell)
    {
        cell = [[PSCollectionViewCell alloc]initWithFrame:CGRectZero];
        UIImageView *imageView = [UIImageView new];
        [cell addSubview:imageView];
        imageView.tag = 100;
        UILabel *label = [UILabel new];
        [cell addSubview:label];
        label.tag = 200;
    }
    
    UIImageView *iv = (UIImageView *)[cell viewWithTag:100];
    UILabel *label = (UILabel *)[cell viewWithTag:200];
    label.font = [UIFont systemFontOfSize:12];
    label.textColor = [UIColor blackColor];
    label.numberOfLines = 0;
    
    iv.frame = CGRectMake(0, 0, kWindowW/2 - 12, [self collectionView:collectionView heightForRowAtIndex:index]-30);
    label.frame = CGRectMake(0, [self collectionView:collectionView heightForRowAtIndex:index]-25, 150, 30);
    [iv setImageWithURL:[self.vm iconForRow:index]];
    label.text = [self.vm titleForRow:index];
    return cell;
}
@end
















