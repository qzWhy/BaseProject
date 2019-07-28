//
//  PriConfig.h
//  BaseProject
//
//  Created by 范庆忠 on 2019/7/28.
//  Copyright © 2019 qingzhou. All rights reserved.
//

#ifndef PriConfig_h
#define PriConfig_h


#pragma mark - 版本比较
/** 版本比较*/
//等于
#define UNSYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
//大于
#define UNSYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
//大于等于
#define UNSYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
//小于
#define UNSYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
//小于等于
#define UNSYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)
//大于等于8.0的版本
#define UNIOS8_OR_LATER UNSYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0")
//大于等于10.0的版本
#define UNIOS10_OR_LATER UNSYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"10.0")

#endif /* PriConfig_h */
