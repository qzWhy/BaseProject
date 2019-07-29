//
//  QZCycleScrollView.h
//  CycleScrollView
//
//  Created by fanqingzhong on 2019/7/27.
//  Copyright © 2019 fanqingzhong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class QZCycleScrollView;
@protocol QZCycleScrollViewDelegate <NSObject>
@optional
/**
 *  点击图片的回调事件
 */
- (void)carouselView:(QZCycleScrollView *)carouselView indexOfClickedImageBtn:(NSUInteger)index;
@end

@interface QZCycleScrollView : UIView

//传入图片数组
@property (nonatomic, copy) NSArray *images;
//pageControl颜色设置
@property (nonatomic, strong) UIColor *currentPageColor;
@property (nonatomic, strong) UIColor *pageColor;
//是否竖向滚动
@property (nonatomic, assign, getter=isScrollDorectionPortrait) BOOL scrollDorectionPortrait;

@property (weak, nonatomic) id<QZCycleScrollViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
