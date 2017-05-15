//
//  IpaiTabBarController.m
//  IPaiDirectSeeding
//
//  Created by Yuwei on 17/5/8.
//  Copyright © 2017年 HZY. All rights reserved.
//

#import "IpaiTabBarController.h"

#import "FirstPageViewController.h"
#import "InstructionViewController.h"
#import "LotsViewController.h"
#import "MineViewController.h"


#import "Global.h"

@interface IpaiTabBarController ()

@end

@implementation IpaiTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置tabbar的背景颜色
    [[UITabBar appearance] setBarTintColor:[UIColor colorWithRed:255/255 green:255/255 blue:255/255 alpha:1]];
    [UITabBar appearance].translucent = NO;
    //自定义tabbar上的那条线
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.tabBar.bounds.size.width, 1)];
    lineView.backgroundColor = [UIColor colorWithRed:238/255 green:238/255 blue:238/255 alpha:0.1];
    [self.tabBar addSubview:lineView];
    
    //tabbar里的item选中颜色
    NSMutableDictionary *attrSelected = [NSMutableDictionary dictionary];
    attrSelected[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrSelected[NSForegroundColorAttributeName] = [UIColor colorWithRed:0.0/255.0 green:181/255.0 blue:137/255.0 alpha:1];
    
    // 1.添加第一个控制器
    // 1.1 初始化
    FirstPageViewController *oneVC = [[FirstPageViewController alloc]init];
    // 1.2 把oneVC添加为UINavigationController的根控制器
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:oneVC];
    // 设置tabBar的标题
    nav1.title = @"首页";
    oneVC.navigationItem.title = @"i拍直播";
    //导航栏背景颜色
    oneVC.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.0/255.0 green:181/255.0 blue:137/255.0 alpha:1];
    //导航栏上的字体颜色
    nav1.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:18]};
    
    // 选中
    [nav1.tabBarItem setTitleTextAttributes:attrSelected forState:UIControlStateSelected];
    
    if (IOS7) {
        UIImage *img1 = [UIImage imageNamed:@"icon_main-B"];
        UIImage *imgs1 = [UIImage imageNamed:@"icon_main-G"];
        nav1.tabBarItem.selectedImage = [imgs1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        nav1.tabBarItem.image = [img1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
    }
    else{
        [nav1.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"icon_main-G"] withFinishedUnselectedImage:[UIImage imageNamed:@"icon_main-B"]];
    }
    
    // 1.3 把UINavigationController交给UITabBarController管理
    [self addChildViewController:nav1];
    
    
    // 2.添加第2个控制器
    InstructionViewController *twoVC = [[InstructionViewController alloc]init];
    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:twoVC];
    nav2.title = @"说明";
    twoVC.navigationItem.title = @"竞拍说明";
    //导航栏背景颜色
    twoVC.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.0/255.0 green:181/255.0 blue:137/255.0 alpha:1];
    //导航栏上的字体颜色
    nav2.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:18]};
    
    // 选中
    [nav2.tabBarItem setTitleTextAttributes:attrSelected forState:UIControlStateSelected];
    
    if (IOS7) {
        UIImage *img1 = [UIImage imageNamed:@"icon_explain-B"];
        UIImage *imgs1 = [UIImage imageNamed:@"icon_explain-G"];
        nav2.tabBarItem.selectedImage = [imgs1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        nav2.tabBarItem.image = [img1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
    }
    else{
        [nav2.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"icon_explain-B"] withFinishedUnselectedImage:[UIImage imageNamed:@"icon_explain-G"]];
    }
    
    [self addChildViewController:nav2];
    
    
    
    // 3.添加第3个控制器
    LotsViewController *threeVC = [[LotsViewController alloc]init];
    UINavigationController *nav3 = [[UINavigationController alloc]initWithRootViewController:threeVC];
    nav3.title = @"拍品";
    threeVC.navigationItem.title = @"已拍&收藏";

    //导航栏背景颜色
    threeVC.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.0/255.0 green:181/255.0 blue:137/255.0 alpha:1];
    //导航栏上的字体颜色
    nav3.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:18]};
    
    // 选中
    [nav3.tabBarItem setTitleTextAttributes:attrSelected forState:UIControlStateSelected];
    if (IOS7) {
        UIImage *img1 = [UIImage imageNamed:@"icon_hammer-B"];
        UIImage *imgs1 = [UIImage imageNamed:@"icon_hammer-G"];
        nav3.tabBarItem.selectedImage = [imgs1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        nav3.tabBarItem.image = [img1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
    }
    else{
        [nav3.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"icon_hammer-B"] withFinishedUnselectedImage:[UIImage imageNamed:@"icon_hammer-G"]];
    }
    [self addChildViewController:nav3];
    
    
    // 4.添加第4个控制器
    MineViewController *fourVC = [[MineViewController alloc]init];
    UINavigationController *nav4 = [[UINavigationController alloc]initWithRootViewController:fourVC];
    nav4.title = @"我的";
    
    //导航栏背景颜色
    fourVC.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.0/255.0 green:181/255.0 blue:137/255.0 alpha:1];
    //导航栏上的字体颜色
    nav4.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:18]};
    
    //选中
    nav4.tabBarItem.title = @"我的";
    [nav4.tabBarItem setTitleTextAttributes:attrSelected forState:UIControlStateSelected];
    if (IOS7) {
        UIImage *img1 = [UIImage imageNamed:@"icon_my-B"];
        UIImage *imgs1 = [UIImage imageNamed:@"icon_my-G"];
        nav4.tabBarItem.selectedImage = [imgs1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        nav4.tabBarItem.image = [img1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
    }
    else{
        [nav4.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"icon_my-B"] withFinishedUnselectedImage:[UIImage imageNamed:@"icon_my-G"]];
    }

    [self addChildViewController:nav4];
    
    
}


#pragma ---没有用

// 添加所有子控制器方法
- (void)setUpAllChildViewController{    // 1.添加第一个控制器
    FirstPageViewController *oneVC = [[FirstPageViewController alloc]init];
    [self setUpOneChildViewController:oneVC image:[UIImage imageNamed:@"tab_home_icon"] title:@"首页"];    // 2.添加第2个控制器
    InstructionViewController *twoVC = [[InstructionViewController alloc]init];
    [self setUpOneChildViewController:twoVC image:[UIImage imageNamed:@"js"] title:@"技术"];    // 3.添加第3个控制器
    LotsViewController *threeVC = [[LotsViewController alloc]init];
    [self setUpOneChildViewController:threeVC image:[UIImage imageNamed:@"qw"] title:@"博文"];    // 4.添加第4个控制器
    MineViewController *fourVC = [[MineViewController alloc]init];
    [self setUpOneChildViewController:fourVC image:[UIImage imageNamed:@"user"] title:@"我的江湖"];
}

/**
  *  添加一个子控制器的方法
*/
- (void)setUpOneChildViewController:(UIViewController *)viewController image:(UIImage *)image title:(NSString *)title{    UINavigationController *navC = [[UINavigationController alloc]initWithRootViewController:viewController];
      navC.title = title;
      navC.tabBarItem.image = image;
      //[navC.navigationBar setBackgroundImage:[UIImage imageNamed:@"commentary_num_bg"] forBarMetrics:UIBarMetricsDefault];
    navC.tabBarItem.badgeColor = [UIColor greenColor];
      
      viewController.navigationItem.title = title;
      
      [self addChildViewController:navC];
  }


@end
