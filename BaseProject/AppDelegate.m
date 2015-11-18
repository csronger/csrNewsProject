//
//  AppDelegate.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import "LeftViewController.h"
#import "CSRNewsViewController.h"
#import "WelcomeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self initializeWithApplication:application];
    //self.window.rootViewController = self.sideMenu;
    
    NSDictionary *infoDic = [[NSBundle mainBundle]infoDictionary];
    NSString *key = @"CFBundleShortVersionString";
    NSString *currentVersion = infoDic[key];
    //已运行过的版本号需要持久化处理，通常存储在userDefault中
    NSString *runedVersion = [[NSUserDefaults standardUserDefaults] stringForKey:key];
    if (runedVersion == nil || ![runedVersion isEqualToString:currentVersion])//如果没运行过，或版本号不一致，则显示欢迎页
    {
//        NSLog(@"显示欢迎页,window根视图设置为欢迎控制器对象");
        WelcomeViewController *vc = [WelcomeViewController new];
        self.window.rootViewController = vc;
        //保存新的版本号，防止下次运行再显示欢迎页
        [[NSUserDefaults standardUserDefaults] setValue:currentVersion forKey:key];
        
    }else
    {
        //NSLog(@"显示主页面，window根视图设置为主页面控制器对象");
        self.window.rootViewController = self.sideMenu;
   }
    [self.window makeKeyAndVisible];
    //配置全局UI样式
    [self configGlobalUIStyle];
    return YES;
}

//全局样式
- (void)configGlobalUIStyle
{
    //设置导航栏不透明
    [[UINavigationBar appearance] setTranslucent:NO];
    //设置导航栏背景图
    [[UINavigationBar appearance]setBackgroundImage:[UIImage imageNamed:@"navigationbar_bg_64"] forBarMetrics:UIBarMetricsDefault];
    //配置导航栏题目的样式
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont flatFontOfSize:kNaviTitleFontSize], NSForegroundColorAttributeName:kNaviTitleColor}];
}

- (UIWindow *)window {
    if(_window == nil) {
        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [_window makeKeyAndVisible];
    }
    return _window;
}

- (RESideMenu *)sideMenu {
    if(_sideMenu == nil) {
        _sideMenu = [[RESideMenu alloc] initWithContentViewController:[CSRNewsViewController standardCSRNewsNavi] leftMenuViewController:[LeftViewController new] rightMenuViewController:nil];
        //为sideMenu设置背景图，
        _sideMenu.backgroundImage = [UIImage imageNamed:@"一个人"];
        //出现菜单时不显示状态栏
        _sideMenu.menuPrefersStatusBarHidden = YES;
        //不允许到了菜单栏边缘还继续缩小
        _sideMenu.bouncesHorizontally = NO;
    }
    return _sideMenu;
}
@end
