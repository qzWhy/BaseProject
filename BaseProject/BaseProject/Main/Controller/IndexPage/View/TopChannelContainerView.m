//
//  TopChannelContainerView.m
//  BaseProject
//
//  Created by 范庆忠 on 2019/7/28.
//  Copyright © 2019 qingzhou. All rights reserved.
//

#import "TopChannelContainerView.h"


@interface TopChannelContainerView ()

@property (nonatomic, strong) UIButton *lastSelectedBtn;

@end

static CGFloat ChannelHeight  = 40;
static CGFloat kTitleLabelNorimalFont = 13;
static CGFloat kTitleLabelSelectedFont = 15;
static CGFloat buttonWidth = 65;
@implementation TopChannelContainerView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews {
    [self addSubview:self.scrollView];
}


- (void)setChannelArray:(NSArray *)channelArray {
    _channelArray = channelArray;
    self.scrollView.contentSize = CGSizeMake(buttonWidth *channelArray.count, 0);
    for (int i = 0; i < channelArray.count; i++) {
        UIButton *button = [self createChannelButton];
        button.frame = CGRectMake(i *buttonWidth, 0, buttonWidth, ChannelHeight);
        [button setTitle:channelArray[i] forState:UIControlStateNormal];
        [self.scrollView addSubview:button];
    }
    [self clickChannelButton:self.scrollView.subviews[3]];
}

- (UIButton *)createChannelButton {
    UIButton *button = [UIButton new];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRed:243/255.0 green:75/255.0 blue:80/255.0 alpha:1.0] forState:UIControlStateDisabled];
    [button.titleLabel setFont:[UIFont systemFontOfSize:kTitleLabelNorimalFont]];
    [button addTarget:self action:@selector(clickChannelButton:) forControlEvents:UIControlEventTouchUpInside];
    [button layoutIfNeeded];
    return button;
}

- (void)clickChannelButton:(UIButton *)sender {
    self.lastSelectedBtn.titleLabel.font = [UIFont systemFontOfSize:kTitleLabelNorimalFont];
    self.lastSelectedBtn.enabled = YES;
    self.lastSelectedBtn = sender;
    self.lastSelectedBtn.enabled = NO;
    CGFloat newOffSetX = sender.center.x - [UIScreen mainScreen].bounds.size.width * 0.5;
    if (newOffSetX < 0) {
        newOffSetX = 0;
    }
    if (newOffSetX > self.scrollView.contentSize.width - self.scrollView.frame.size.width) {
        newOffSetX = self.scrollView.contentSize.width - self.scrollView.frame.size.width;
    }
    [UIView animateWithDuration:0.25 animations:^{
        [sender.titleLabel setFont:[UIFont systemFontOfSize:kTitleLabelSelectedFont]];
        [sender layoutIfNeeded];
        [self.scrollView setContentOffset:CGPointMake(newOffSetX, 0) animated:YES];
    }];
    
    NSInteger  index = [self.scrollView.subviews indexOfObject:sender];
    if ([self.delegate respondsToSelector:@selector(chooseChannelWithIndex:)]) {
        [self.delegate chooseChannelWithIndex:index];
    }
}

- (void)selecteChannelButtonWithIndex:(NSInteger)index {
    [self clickChannelButton:self.scrollView.subviews[index]];
}

#pragma mark - 懒加载
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, ChannelHeight);
        _scrollView.backgroundColor = [UIColor grayColor];
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
    }
    return _scrollView;
}

@end
