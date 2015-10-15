//
//  NextViewController.m
//  MasonryDemo
//
//  Created by kaka on 15/10/15.
//  Copyright © 2015年 MoboGenie. All rights reserved.
//

#import "NextViewController.h"

#import "Masonry.h"

#import "MMPlaceHolder.h"

@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    __weak typeof (self) weakSelf = self;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 在UIScrollView顺序排列一些view并自动计算contentSize
    
    UIScrollView *scrollV = [UIScrollView new];
    scrollV.backgroundColor = [UIColor lightGrayColor];
    [scrollV showPlaceHolder];
    [self.view addSubview:scrollV];
    
    [scrollV mas_makeConstraints:^(MASConstraintMaker *make) {
        __strong typeof(self) strongSelf = weakSelf;
        if (strongSelf)
        {
            // 给scrollView留10边缘
            make.edges.equalTo(strongSelf.view).with.insets(UIEdgeInsetsMake(64 + 10, 10, 10, 10));
        }
    }];
    
    UIView *containerV = [UIView new];
    containerV.backgroundColor = [UIColor whiteColor];
    [containerV showPlaceHolder];
    [scrollV addSubview:containerV];
    
    [containerV mas_makeConstraints:^(MASConstraintMaker *make) {
        // 边缘和scrollView相同
        make.edges.equalTo(scrollV).with.insets(UIEdgeInsetsMake(-64, 0, 0, 0));
        // 宽度和scrollView相同
        make.width.equalTo(scrollV);
    }];
    
    UIView *lastV = nil;
    // 创建10个view, 随机颜色, 高度递增20;
    for (int i = 0; i < 10; i++)
    {
        UIView *subV = [UIView new];
        subV.backgroundColor = [UIColor colorWithRed:(arc4random() % 256 / 256.0)
                                               green:(arc4random() % 128 / 256.0) + 0.5
                                                blue:(arc4random() % 128 / 256.0) + 0.5
                                               alpha:1];
        [subV showPlaceHolder];
        [containerV addSubview:subV];
        
        [subV mas_makeConstraints:^(MASConstraintMaker *make) {
            // 左右边缘和containerView的相同
            make.left.right.equalTo(containerV);
            make.height.mas_equalTo(20 * (i + 1));
            // 顶端有View, 顶端为lastView的底端, 没有则为containerView的顶端
            if (lastV)
            {
                make.top.mas_equalTo(lastV.mas_bottom);
            }
            else
            {
                make.top.mas_equalTo(containerV.mas_top);
            }
        }];
        
        lastV = subV;
    }
    [containerV mas_makeConstraints:^(MASConstraintMaker *make) {
        // containerView的底端和最后一个View的底端相同
        make.bottom.equalTo(lastV.mas_bottom);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
