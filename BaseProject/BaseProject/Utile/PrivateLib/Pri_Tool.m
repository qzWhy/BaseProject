//
//  Pri_Tool.m
//  BaseProject
//
//  Created by 范庆忠 on 2019/7/28.
//  Copyright © 2019 qingzhou. All rights reserved.
//

#import "Pri_Tool.h"

@implementation Pri_Tool

+ (void)launchApp:(BOOL)isLogin {
    UIWindow *window = [AppDelegate sharedInstance].window;
    
    if (!window) {
        window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        window.backgroundColor = [UIColor whiteColor];
    }
    window.rootViewController = nil;
    
    if (isLogin) {
        window.rootViewController = [BaseTabBarController new];
    } else {
        
    }
    [window makeKeyAndVisible];
    
}

@end
