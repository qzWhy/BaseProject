//
//  TopChannelContainerView.h
//  BaseProject
//
//  Created by 范庆忠 on 2019/7/28.
//  Copyright © 2019 qingzhou. All rights reserved.
//
/**
 新闻首页上方新闻频道选择的scrollView
 */
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol TopChannelContainerViewDelegate <NSObject>

- (void)chooseChannelWithIndex:(NSInteger)index;

@end

@interface TopChannelContainerView : UIView

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) NSArray *channelArray;

@property (nonatomic, weak) id<TopChannelContainerViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
