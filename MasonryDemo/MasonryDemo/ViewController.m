//
//  ViewController.m
//  MasonryDemo
//
//  Created by kaka on 15/10/15.
//  Copyright © 2015年 MoboGenie. All rights reserved.
//

#import "ViewController.h"

#import "Masonry.h"

#import "MMPlaceHolder.h"

#import "NextViewController.h"
#import "AnotherNextViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    __weak typeof (self) weakSelf = self;
    
    // 居中显示一个view
    
    UIView *centerView = [UIView new];
    centerView.backgroundColor = [UIColor colorWithRed:(arc4random() % 256 / 256.0)
                                                 green:(arc4random() % 128 / 256.0) + 0.5
                                                  blue:(arc4random() % 128 / 256.0) + 0.5
                                                 alpha:1];
    [centerView showPlaceHolder];
    // 在做autoLayout之前, 一定要先将view添加到superView上, 否则会crash
    [self.view addSubview:centerView];
    
    //mas_makeConstraints 就是Masonry的autoLayout添加方法 将所需的约束添加到block中
    [centerView mas_makeConstraints:^(MASConstraintMaker *make) {
        __strong typeof(self) strongSelf = weakSelf;
        if (strongSelf)
        {
            // 将centerView的中心和controller的view的中心对齐
            make.center.equalTo(strongSelf.view);
            // 设置centerView的Size
            make.size.mas_equalTo(CGSizeMake(300, 300));
        }
    }];
    
    // 让一个view略小于其superView(边距为10)
    
    UIView *edgeView = [UIView new];
    edgeView.backgroundColor = [UIColor colorWithRed:(arc4random() % 256 / 256.0)
                                               green:(arc4random() % 128 / 256.0) + 0.5
                                                blue:(arc4random() % 128 / 256.0) + 0.5
                                               alpha:1];
    [edgeView showPlaceHolder];
    [self.view addSubview:edgeView];
    
    [edgeView mas_makeConstraints:^(MASConstraintMaker *make) {
        // 一切都是相对于superView的
        /* 写法一:
         make.top.equalTo(centerView).with.offset(10);
         make.left.equalTo(centerView).with.offset(10);
         make.bottom.equalTo(centerView).with.offset(-10);
         make.right.equalTo(centerView).with.offset(-10);
         */
        /* 写法二:
         make.top.left.bottom.right.equalTo(centerView).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
         */
        // 最简便写法
        // edges就是top, left, bottom, right的一个简化
        make.edges.equalTo(centerView).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
    
    // 让两个高度为125的view垂直居中且等宽且等间隔排列 间隔为10(自动计算其宽度)
    
    UIView *widthView1 = [UIView new];
    widthView1.backgroundColor = [UIColor colorWithRed:(arc4random() % 256 / 256.0)
                                                 green:(arc4random() % 128 / 256.0) + 0.5
                                                  blue:(arc4random() % 128 / 256.0) + 0.5
                                                 alpha:1];
    [widthView1 showPlaceHolder];
    [edgeView addSubview:widthView1];
    
    UIView *widthView2 = [UIView new];
    widthView2.backgroundColor = widthView1.backgroundColor;
    [widthView2 showPlaceHolder];
    [edgeView addSubview:widthView2];
    
    [widthView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        // 垂直居中
        make.centerY.mas_equalTo(edgeView.mas_centerY);
        // 距离左边界10
        make.left.equalTo(edgeView.mas_left).with.offset(10);
        // 距离第二个view左边间距10;
        make.right.equalTo(widthView2.mas_left).with.offset(-10);
        // 高度125
        make.height.mas_equalTo(125);
        // 宽度相等
        make.width.equalTo(widthView2);
    }];
    
    [widthView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(edgeView.mas_centerY);
        make.left.equalTo(widthView1.mas_right).with.offset(10);
        make.right.equalTo(edgeView.mas_right).with.offset(-10);
        make.height.mas_equalTo(125);
        make.width.equalTo(widthView1);
    }];
    
    UIButton *nextBTN = [UIButton buttonWithType:UIButtonTypeSystem];
    [nextBTN setTitle:@"下一页" forState:UIControlStateNormal];
    [nextBTN addTarget:self action:@selector(nextButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextBTN];
    
    UIButton *anotherBTN = [UIButton buttonWithType:UIButtonTypeSystem];
    [anotherBTN setTitle:@"另一页" forState:UIControlStateNormal];
    [anotherBTN addTarget:self action:@selector(anotherButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:anotherBTN];
    
    [nextBTN mas_makeConstraints:^(MASConstraintMaker *make) {
        __strong typeof(self) strongSelf = weakSelf;
        if (strongSelf)
        {
            make.left.equalTo(strongSelf.view.mas_left).with.offset(50);
            make.right.equalTo(anotherBTN.mas_left).with.offset(-50);
            make.bottom.equalTo(strongSelf.view.mas_bottom).with.offset(-50);
            make.width.equalTo(anotherBTN.mas_width);
            make.height.mas_equalTo(40);
        }
    }];
    
    [anotherBTN mas_makeConstraints:^(MASConstraintMaker *make) {
        __strong typeof(self) strongSelf = weakSelf;
        if (strongSelf)
        {
            make.left.equalTo(nextBTN.mas_right).with.offset(50);
            make.right.equalTo(strongSelf.view.mas_right).with.offset(-50);
            make.bottom.equalTo(strongSelf.view.mas_bottom).with.offset(-50);
            make.width.equalTo(nextBTN.mas_width);
            make.height.mas_equalTo(40);
        }
    }];
    
}

- (void)nextButtonClicked:(id)sender
{
    NextViewController *nextVC = [NextViewController new];
    [self.navigationController pushViewController:nextVC animated:YES];
}

- (void)anotherButtonClicked:(id)sender
{
    AnotherNextViewController *anotherVC = [AnotherNextViewController new];
    [self.navigationController pushViewController:anotherVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
