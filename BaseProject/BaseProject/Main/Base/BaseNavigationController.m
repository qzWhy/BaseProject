//
//  BaseNavigationController.m
//  BaseProject
//
//  Created by 范庆忠 on 2019/7/28.
//  Copyright © 2019 qingzhou. All rights reserved.
//
/**
 实现侧滑返回 遵循UIGestureRecognizerDelegate 并实现代理即可
 */

#import "BaseNavigationController.h"

@interface BaseNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.interactivePopGestureRecognizer.delegate = self;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    NSArray *controllers = self.childViewControllers;
    if (controllers.count <= 1) {
        return NO;
    }
    return YES;
}

@end
