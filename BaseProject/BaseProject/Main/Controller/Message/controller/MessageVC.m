//
//  MessageVC.m
//  BaseProject
//
//  Created by 范庆忠 on 2019/7/28.
//  Copyright © 2019 qingzhou. All rights reserved.
//

#import "MessageVC.h"
#import "QZCycleScrollView.h"
@interface MessageVC ()<QZCycleScrollViewDelegate>
@property (nonatomic, strong) QZCycleScrollView *cycleScrollView;
@end

@implementation MessageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    QZCycleScrollView *carousel = [[QZCycleScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 300)];
    carousel.delegate = self;
    //    carousel.scrollDorectionPortrait = YES;
    carousel.images = @[
                        [UIImage imageNamed:@"0"],
                        [UIImage imageNamed:@"1"],
                        [UIImage imageNamed:@"2"],
                        [UIImage imageNamed:@"3"],
                        [UIImage imageNamed:@"4"]
                        ];
    carousel.currentPageColor = [UIColor orangeColor];
    carousel.pageColor = [UIColor grayColor];
    [self.view addSubview:carousel];
}

- (void)carouselView:(QZCycleScrollView *)carouselView indexOfClickedImageBtn:(NSUInteger )index {
    NSLog(@"点击了第%ld张图片",index);
}

@end
