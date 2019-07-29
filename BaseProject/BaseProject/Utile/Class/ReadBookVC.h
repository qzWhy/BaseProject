//
//  ReadBookVC.h
//  QZReaderTool
//
//  Created by ctrl on 2019/7/26.
//  Copyright © 2019 ctrl. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ReadBookVC : UIViewController

@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, assign) int allPage;///总页数
@property (nonatomic, assign) int currentPage;///当前页数
@property (nonatomic, strong) UIBarButtonItem *myBookSheetBtn;




@property (nonatomic, strong) NSString *textContent;



-(void)downPage;


-(void)upPage;

@end

NS_ASSUME_NONNULL_END
