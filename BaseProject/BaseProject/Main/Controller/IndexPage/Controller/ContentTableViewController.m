//
//  ContentTableViewController.m
//  BaseProject
//
//  Created by 范庆忠 on 2019/7/28.
//  Copyright © 2019 qingzhou. All rights reserved.
//

#import "ContentTableViewController.h"

@interface ContentTableViewController ()

@end

@implementation ContentTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label = [UILabel new];
    label.frame = CGRectMake(10, 100, 100, 30);
    label.text = self.channelName;
    label.backgroundColor = [UIColor greenColor];
    [self.view addSubview:label];
}


@end
