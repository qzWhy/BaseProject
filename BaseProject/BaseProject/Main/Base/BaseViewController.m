//
//  BaseViewController.m
//  BaseProject
//
//  Created by 范庆忠 on 2019/7/28.
//  Copyright © 2019 qingzhou. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setCommonConfigAction];//此时还未配置 可根据需要设置配置
    
    [self initState];
    
    [self loadData];
    
    [self setupSubViews];
    
    [self confingConstriant];
}

#pragma mark - 公共方法
- (void)initState {
    self.pageIndex = 1;
}

- (void)loadData {
}

- (void)setupSubViews {
}

- (void)confingConstriant {
    
}

- (void)setupLeftNavigBarWithTitle:(NSString *)title {
    if (!title) {
        [self setupLeftBarWithBarItem:nil];
    } else {
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(clickLeftItemAction:)];
        
        [self setupLeftBarWithBarItem:item];
    }
}

- (void)setupLeftNavigBarWithImage:(UIImage *)image {
    if (!image) {
        [self setupLeftBarWithBarItem:nil];
    } else {
        UIBarButtonItem *itme = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(clickLeftItemAction:)];
        [self setupLeftBarWithBarItem:itme];
    }
}

- (void)setupLeftNavigBarWithCustomView:(UIView *)view {
    if (!view) {
        [self setupLeftBarWithBarItem:nil];
    } else {
        UIBarButtonItem *itme = [[UIBarButtonItem alloc] initWithCustomView:view];
        [self setupLeftBarWithBarItem:itme];
    }
}

- (void)clickLeftItemAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setupRightNavigBarWithTitle:(NSString *)title {
    if (!title) {
        [self setupRightBarWithBarItem:nil];
    } else {
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(clickRightItemAction:)];
        
        [self setupRightBarWithBarItem:item];
    }
}

- (void)setupRightNavigBarWithImage:(UIImage *)image {
    if (!image) {
        [self setupRightBarWithBarItem:nil];
    } else {
        UIBarButtonItem *itme = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(clickRightItemAction:)];
        [self setupRightBarWithBarItem:itme];
    }
}

- (void)setupRightNavigBarWithCustomView:(UIView *)view {
    if (!view) {
        [self setupRightBarWithBarItem:nil];
    } else {
        UIBarButtonItem *itme = [[UIBarButtonItem alloc] initWithCustomView:view];
        [self setupRightBarWithBarItem:itme];
    }
}

- (void)clickRightItemAction:(id)sender {
    
}

#pragma mark - 私有方法
- (void)setupLeftBarWithBarItem:(UIBarButtonItem *) item {
    if (item) {
        self.navigationItem.leftBarButtonItem = item;
    } else {
        self.navigationItem.leftBarButtonItem = nil;
    }
}

- (void)setupRightBarWithBarItem:(UIBarButtonItem *) item {
    if (item) {
        self.navigationItem.rightBarButtonItem = item;
    } else {
        self.navigationItem.rightBarButtonItem = nil;
    }
}

#pragma mark - 通知回调
#pragma mark - 懒加载
- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray arrayWithCapacity:0];
    }
    return _dataSource;
}


#pragma mark - dealloc
- (void)dealloc {
    NSLog(@"%@----%@ is dealloc",self.title,[[self class] description]);
}

@end
