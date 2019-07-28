//
//  IndexPageVC.m
//  BaseProject
//
//  Created by 范庆忠 on 2019/7/28.
//  Copyright © 2019 qingzhou. All rights reserved.
//

#import "IndexPageVC.h"
#import "TopChannelContainerView.h"

static CGFloat ChannelHeight  = 40;
@interface IndexPageVC () <UIScrollViewDelegate,TopChannelContainerViewDelegate>

@property (nonatomic, strong) TopChannelContainerView *topContainerView;
@property (nonatomic, strong) UIScrollView *contentScrollView;
@property (nonatomic, strong) NSMutableArray *channelsArray;


@end

@implementation IndexPageVC

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)loadData {
    self.topContainerView.channelArray = self.channelsArray;
}

- (void)setupSubViews {
    [self.view addSubview:self.contentScrollView];
    [self.view addSubview:self.topContainerView];
}

- (UIScrollView *)contentScrollView {
    if (!_contentScrollView) {
        _contentScrollView = [[UIScrollView alloc] init];
        _contentScrollView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        _contentScrollView.backgroundColor = [UIColor redColor];
        _contentScrollView.contentSize = CGSizeMake(_contentScrollView.frame.size.width *self.channelsArray.count, 0);
        _contentScrollView.pagingEnabled = YES;
        _contentScrollView.delegate = self;
    }
    return _contentScrollView;
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
}

#pragma mark - TopChannelContainterViewDelegate
- (void)chooseChannelWithIndex:(NSInteger)index {
    [self.contentScrollView setContentOffset:CGPointMake(self.contentScrollView.frame.size.width *index, 0)];
}

- (TopChannelContainerView *)topContainerView {
    if (!_topContainerView) {
        _topContainerView = [TopChannelContainerView new];
        _topContainerView.backgroundColor = [UIColor greenColor];
        _topContainerView.delegate = self;
        _topContainerView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, ChannelHeight);
    }
    return _topContainerView;
}

- (NSMutableArray *)channelsArray {
    if (!_channelsArray) {
        _channelsArray = [NSMutableArray arrayWithObjects:@"头条",@"NBA",@"手机",@"移动互联",@"娱乐",@"时尚",@"电影",@"科技", nil];
    }
    return _channelsArray;
}

@end
