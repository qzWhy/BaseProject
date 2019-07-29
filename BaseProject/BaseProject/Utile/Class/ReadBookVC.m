//
//  ReadBookVC.m
//  QZReaderTool
//
//  Created by ctrl on 2019/7/26.
//  Copyright © 2019 ctrl. All rights reserved.
//

#import "ReadBookVC.h"
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
@interface ReadBookVC ()

@property (nonatomic, strong) UIView *contentView;


@end

@implementation ReadBookVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.35];
    [UIView commitAnimations];
    
    
    UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"green.png"]];
    imageView.frame = CGRectMake(0, 0, kScreenWidth,kScreenHeight - 88);
    
    [self.view addSubview:imageView];
    
    //自定义工具
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, kScreenHeight - 88, kScreenWidth, 88)];
    toolBar.tintColor = [UIColor grayColor];
    [self.view addSubview:toolBar];
    
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 88)];
    [self.view addSubview:self.textView];
    self.textView.text = self.textContent;
    
    self.textView.font = [UIFont italicSystemFontOfSize:20];
    self.textView.inputAccessoryView = imageView;
    
    self.textView.textColor = [UIColor blackColor];
    
    self.textView.backgroundColor = [UIColor grayColor];
    
    self.textView.editable = NO;

    
    //计算textView的总页数
    self.allPage = self.textView.contentSize.height / (kScreenHeight - 88) + 1;
    ///设置当前页数为1
    self.currentPage = 1;
    //为工具栏设置按钮
    //为工具栏设置按钮
    UIBarButtonItem * button01 = [[UIBarButtonItem alloc] initWithTitle:@"我的书架" style:UIBarButtonItemStylePlain target:self action:@selector(onClick)];
    UIBarButtonItem * button02 = [[UIBarButtonItem alloc] initWithTitle:@"上一页" style:UIBarButtonItemStylePlain target:self action:@selector(upPage)];
    button02.tag = 200;
    UIBarButtonItem * button03 = [[UIBarButtonItem alloc] initWithTitle:@"下一页" style:UIBarButtonItemStylePlain target:self action:@selector(downPage)];
    button03.tag = 300;
    
    self.myBookSheetBtn = [[UIBarButtonItem alloc] initWithTitle:[NSString stringWithFormat:@"%d/%d",self.currentPage,self.allPage] style:UIBarButtonItemStylePlain target:self action:@selector(hello)];
    self.myBookSheetBtn.tag = 110;
    //将工具栏按钮添加到一个数组里面
    NSArray * array = [[NSArray alloc] initWithObjects:button01,button02,button03,self.myBookSheetBtn, nil];
    //给工具栏添加按钮
    [toolBar setItems:array animated:YES];
    
    UIView *content = [UIView new];
    content.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight - 88);
    [self.view addSubview:content];
    self.contentView = content;
    content.backgroundColor = [UIColor clearColor];
    
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    
    [content addGestureRecognizer:tap];
}

- (void)tap:(UIPanGestureRecognizer *)tap{
    CGPoint  point = [tap locationInView:self.contentView];
    if (point.y >= (kScreenHeight - 88)/2) {
        [self downPage];
    } else {
        [self upPage];
    }
//    if (point.x < -5 && point.x > -10) {
//        [tap setTranslation:CGPointMake(0, 0) inView:self.textView];
//        [self upPage];
//        //        return;
//    }else if (point.x > 5 && point.x < 10) {
//        [self downPage];
//        [tap setTranslation:CGPointMake(0, 0) inView:self.textView];
//        //        return;
//    }
//    [tap setTranslation:CGPointMake(0, 0) inView:self.textView];
//    //NSLog(@"%f",point.x);
//    //    return;
}

- (void)downPage {
    if (_currentPage == _allPage) {
        NSLog(@"已经是最后一页了");
        return;
    }
    _currentPage = _currentPage +1 ;
    [self.myBookSheetBtn setTitle:[NSString stringWithFormat:@"%d/%d",_currentPage,_allPage]];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.1];
    [self.textView setContentOffset:CGPointMake(0, (_currentPage - 1) * (kScreenHeight - 88)) animated:YES];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.view cache:YES];
    [UIView commitAnimations];
}


//点击上一页时响应的事件
- (void)upPage{
    if (_currentPage == 1) {
        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"这已是第一页" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alertView show];
        
                return;
    }
    _currentPage = _currentPage - 1;
    //NSLog(@"%d",currentPage);
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.1];
    [self.textView setContentOffset:CGPointMake(0, (_currentPage - 1) * kScreenHeight-88) animated:YES];
    [UIView commitAnimations];
    //
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.view cache:YES];
    
    
    [UIView commitAnimations];
    
    [self.myBookSheetBtn setTitle:[NSString stringWithFormat:@"%d/%d",_currentPage,_allPage]];
    //    return;
}

-(void)hello{
    //    return;
}

//点击我的书架时回到主页
- (void)onClick{
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
