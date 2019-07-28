//
//  Pri_Category.m
//  BaseProject
//
//  Created by 范庆忠 on 2019/7/28.
//  Copyright © 2019 qingzhou. All rights reserved.
//

#import "Pri_Category.h"

#import "IndexPageVC.h"
#import "MessageVC.h"
#import "FindVC.h"
#import "MineVC.h"

@implementation Pri_Category

@end
#pragma mark - BaseViewcontroller
@implementation BaseViewController (PCategory)

- (void)setCommonConfigAction {
    self.view.backgroundColor = [UIColor whiteColor];
}

@end

#pragma mark - UINavigationbar

@implementation UINavigationBar (PCategory)

+ (void)configNavigationBar {
    /** 两个设置导航栏背景颜色的方式 一、图片渲染 二、直接设置bartintcolor */
    //一、
    UIColor *navigationColor = [UIColor redColor];
    [[UINavigationBar appearance] setBackgroundImage:[[UIColor createImageWithColor:navigationColor] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[UIImage new]];
    //二、
    [[UINavigationBar appearance] setBarTintColor:[UIColor greenColor]];//设置导航栏背景的颜色
    
//    [[UINavigationBar appearance] setTintColor:[UIColor colorWithRed:34/255.0 green:34/255.0 blue:34/255.0 alpha:1.0]];
    //设置导航栏title的字体及颜色i
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor darkGrayColor],NSForegroundColorAttributeName, [UIFont systemFontOfSize:18],NSFontAttributeName , nil]];
}

@end

#pragma mark - BaseNavGationController
@implementation BaseNavigationController (PCategory)


@end

#pragma mark - BaeTabBarController
@implementation BaseTabBarController (PCategory)

- (void)addViewControllerAction {
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor darkGrayColor]} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateSelected];
    
    if (UNSYSTEM_VERSION_GREATER_THAN(@"12.0")) {
        //修复ios12.1 tabbaritem偏移bug
        [[UITabBar appearance] setTranslucent:NO];
    }
    
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    
    IndexPageVC *indexVc = [IndexPageVC new];
    indexVc.title = @"首页";
    [indexVc.tabBarItem setImage:[[UIImage imageNamed:@"icon_home_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [indexVc.tabBarItem setSelectedImage:[[UIImage imageNamed:@"icon_home_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    BaseNavigationController *indexNavig = [[BaseNavigationController alloc] initWithRootViewController:indexVc];
    
    MessageVC *messageVc = [MessageVC new];
    messageVc.title = @"信息";
    [messageVc.tabBarItem setImage:[[UIImage imageNamed:@"icon_mind_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [messageVc.tabBarItem setSelectedImage:[[UIImage imageNamed:@"icon_mind_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    BaseNavigationController *messageNavig = [[BaseNavigationController alloc] initWithRootViewController:messageVc];
    
    FindVC *findVc = [FindVC new];
    findVc.title = @"发现";
    [findVc.tabBarItem setImage:[[UIImage imageNamed:@"icon_read_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [findVc.tabBarItem setSelectedImage:[[UIImage imageNamed:@"icon_read_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    BaseNavigationController *findNavig = [[BaseNavigationController alloc] initWithRootViewController:findVc];
    
    MineVC *mineVc = [MineVC new];
    mineVc.title = @"我的";
    [mineVc.tabBarItem setImage:[[UIImage imageNamed:@"icon_user_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [mineVc.tabBarItem setSelectedImage:[[UIImage imageNamed:@"icon_user_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    BaseNavigationController *mineNavig = [[BaseNavigationController alloc] initWithRootViewController:mineVc];
    
    self.viewControllers = @[indexNavig,messageNavig,findNavig,mineNavig];
}

@end
