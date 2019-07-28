//
//  BaseViewController.h
//  BaseProject
//
//  Created by 范庆忠 on 2019/7/28.
//  Copyright © 2019 qingzhou. All rights reserved.
//

#import "ViewController.h"

/**
 基类
 */

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : ViewController
/**
 分页索引，从1开始
 */
@property (nonatomic, assign) NSInteger pageIndex;

/* 数据源 */
@property (nonatomic, strong) NSMutableArray *dataSource;

/**
 设置初始状态
 */
- (void)initState;

/* 加载数据 */
- (void)loadData;

/* 创建视图 */
- (void)setupSubViews;

/**
 设置约束
 */
- (void)confingConstriant;

/**
 设置导航栏左边按钮
 
 @param title 文字
 */
- (void)setupLeftNavigBarWithTitle:(NSString *) title;

/**
 设置导航栏左边按钮
 
 @param image 图片
 */
- (void)setupLeftNavigBarWithImage:(UIImage *) image;

/**
 设置导航栏左边按钮
 
 @param view <#view description#>
 */
- (void)setupLeftNavigBarWithCustomView:(UIView *) view;

/**
 导航栏左边按钮点击事件
 
 @param sender <#sender description#>
 */
- (void)clickLeftItemAction:(id) sender;

/**
 设置导航栏右边按钮
 
 @param title 文字
 */
- (void)setupRightNavigBarWithTitle:(NSString *) title;

/**
 设置导航栏右边按钮
 
 @param image 图片
 */
- (void)setupRightNavigBarWithImage:(UIImage *) image;

/**
 设置导航栏右按钮
 
 @param view <#view description#>
 */
- (void)setupRightNavigBarWithCustomView:(UIView *) view;

/**
 导航栏右边按钮点击事件
 
 @param sender <#sender description#>
 */
- (void)clickRightItemAction:(id) sender;
@end

NS_ASSUME_NONNULL_END
