//
//  Pri_Category.h
//  BaseProject
//
//  Created by 范庆忠 on 2019/7/28.
//  Copyright © 2019 qingzhou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "BaseViewController.h"
#import "BaseNavigationController.h"
#import "BaseTabBarController.h"


NS_ASSUME_NONNULL_BEGIN

@interface Pri_Category : NSObject

@end

#pragma mark - AppDelegatae

@implementation AppDelegate (PCategory)

+ (AppDelegate *)sharedInstance {
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}

@end

#pragma mark - BaseViewController
@interface BaseViewController (PCategory)

/**
 通用配置
 */
- (void)setCommonConfigAction;

@end

#pragma mark - NavigationBar

@interface UINavigationBar (PCategory)

+ (void)configNavigationBar;

@end

#pragma mark - BaseNavigationController

@interface BaseNavigationController (PCategory)

@end

#pragma mark - BaseTabBarController

@interface BaseTabBarController (PCategory)

- (void)addViewControllerAction;

@end

NS_ASSUME_NONNULL_END
