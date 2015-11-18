//
//  WelcomeViewController.m
//  滚动视图_实现欢迎界面
//
//  Created by tarena on 15/9/10.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "WelcomeViewController.h"
#import "AppDelegate.h"

#define IMAGECOUNT 4
@interface WelcomeViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong)UIPageControl *pageControl;
@property (nonatomic, strong)FUIButton *btn;
@end

@implementation WelcomeViewController
- (FUIButton *)btn
{
    if (!_btn)
    {
        _btn = [FUIButton buttonWithType:0];
        _btn.shadowHeight = 3.0f;
        _btn.cornerRadius = 6.0f;
        _btn.shadowColor = [UIColor greenSeaColor];
        _btn.buttonColor = [UIColor turquoiseColor];
        [_btn setTitle:@"点击进入" forState:0];
        _btn.titleLabel.font = [UIFont boldFlatFontOfSize:16];
        [_btn setTitleColor:[UIColor cloudsColor] forState:0];
        [_btn setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
        [_btn bk_addEventHandler:^(id sender) {
            self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
            self.window.rootViewController = [AppDelegate new].sideMenu;
            [self.window makeKeyAndVisible];
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    //1.创建一个滚动视图实例
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.frame = self.view.frame;
    // 设置滚动视图的代理
    scrollView.delegate = self;
    //2.添加滚动视图到self.view中
    [self.view addSubview:scrollView];
    
    //3.配置滚动视图
    //配置边缘不可以弹跳
    scrollView.bounces = NO;
    //设置整页滚动
    scrollView.pagingEnabled = YES;
    //设置水平滚动条不可见
    scrollView.showsHorizontalScrollIndicator = NO;
    
    //大小中，竖直方向不想滚动则可以设置为0
    scrollView.contentSize = CGSizeMake(IMAGECOUNT * scrollView.frame.size.width, 0);
    //向滚动视图内，添加子视图
    for (NSInteger i = 0; i < IMAGECOUNT; i ++)
    {
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.userInteractionEnabled = YES;
        NSString *imageName = [NSString stringWithFormat:@"welcome%ld", i + 1];
        imageView.image = [UIImage imageNamed:imageName];
        imageView.frame = CGRectMake(i * scrollView.frame.size.width, 0, scrollView.frame.size.width, scrollView.frame.size.height);
        [scrollView addSubview:imageView];
        if (i == IMAGECOUNT - 1)
        {
            imageView.userInteractionEnabled = YES;
            [imageView addSubview:self.btn];
            [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.mas_equalTo(-100);
                make.size.mas_equalTo(CGSizeMake(140, 30));
                make.centerX.mas_equalTo(0);
            }];
        }
    }
    
    
    
    //配置UIPageControl   四个小点点
    UIPageControl *pageControl = [[UIPageControl alloc]init];
    self.pageControl = pageControl;
    //设置有几个小圆点
    pageControl.numberOfPages = IMAGECOUNT;
    pageControl.frame = CGRectMake(0, self.view.frame.size.height - 60, self.view.frame.size.width, 40);
    //设置原点没有选中时的颜色
    pageControl.pageIndicatorTintColor = [UIColor redColor];
    //设置原点选中时的颜色
    pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    //禁止与用户交互(用户点击后无响应)
    pageControl.userInteractionEnabled = NO;
    
    //测试
//    //修改被选中的小圆点的位置
//    pageControl.currentPage = 2;
    //将分页控件添加到self.view中
    [self.view addSubview:pageControl];
}

//滚动视图协议中的方法：一滚动就执行
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint offset = scrollView.contentOffset;
    
    //屏幕过半时，就换选中的圆点
    double i = offset.x / scrollView.frame.size.width;
    //取滚动的横向距离，与屏幕宽度的整数倍
//    NSInteger i = offset.x / scrollView.frame.size.width;
//    NSLog(@"%ld", i);
    //将这个整数倍作为被选中小圆点的下标
    self.pageControl.currentPage = i;
   // NSLog(@"%@", NSStringFromCGPoint(scrollView.contentOffset));
}
@end
