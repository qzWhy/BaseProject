//
//  IndexPageVC.m
//  BaseProject
//
//  Created by 范庆忠 on 2019/7/28.
//  Copyright © 2019 qingzhou. All rights reserved.
//

#import "IndexPageVC.h"
#import "TopChannelContainerView.h"

#import "ContentTableViewController.h"

static CGFloat ChannelHeight  = 40;
@interface IndexPageVC () <UIScrollViewDelegate,TopChannelContainerViewDelegate>

@property (nonatomic, strong) TopChannelContainerView *topContainerView;
@property (nonatomic, strong) UIScrollView *contentScrollView;
@property (nonatomic, strong) NSMutableArray *channelsArray;
@property (nonatomic, strong) NSArray *arrayLists;

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
    [self setupChildController];
    [self scrollViewDidEndScrollingAnimation:self.contentScrollView];
    
}

#pragma mark --private Method--初始化子控制器
-(void)setupChildController {
    for (NSInteger i = 0; i<self.channelsArray.count; i++) {
        
        ContentTableViewController *viewController = [[ContentTableViewController alloc] init];
        
        viewController.title = self.arrayLists[i][@"title"];
        viewController.channelName = self.arrayLists[i][@"title"];
        [self addChildViewController:viewController];
    }
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    if (scrollView == self.contentScrollView) {
        NSInteger index = scrollView.contentOffset.x/self.contentScrollView.frame.size.width;
        ContentTableViewController *vc = self.childViewControllers[index];
        vc.view.frame = CGRectMake(scrollView.contentOffset.x, 0, self.contentScrollView.frame.size.width, self.contentScrollView.frame.size.height);
        [scrollView addSubview:vc.view];
    }
}

#pragma mark --UIScrollViewDelegate-- 滑动的减速动画结束后会调用这个方法
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView == self.contentScrollView) {
        [self scrollViewDidEndScrollingAnimation:scrollView];
        NSInteger index = scrollView.contentOffset.x/self.contentScrollView.frame.size.width;
        [self.topContainerView selecteChannelButtonWithIndex:index];
    }
}

#pragma mark - TopChannelContainterViewDelegate
- (void)chooseChannelWithIndex:(NSInteger)index {
    [self.contentScrollView setContentOffset:CGPointMake(self.contentScrollView.frame.size.width *index, 0) ];
}
#pragma mark - 懒加载
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

- (NSArray *)arrayLists {
    if (_arrayLists == nil) {
        _arrayLists = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"NewsURLs.plist" ofType:nil]];
    }
    return _arrayLists;
}

@end
