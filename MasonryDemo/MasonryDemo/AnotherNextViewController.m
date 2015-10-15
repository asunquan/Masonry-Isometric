//
//  AnotherNextViewController.m
//  MasonryDemo
//
//  Created by kaka on 15/10/15.
//  Copyright © 2015年 MoboGenie. All rights reserved.
//

#import "AnotherNextViewController.h"

#import "Masonry.h"

#import "MMPlaceHolder.h"

#import "UIView+IsometricView.h"

@interface AnotherNextViewController ()

@end

@implementation AnotherNextViewController

{
    BOOL isHidden;
    UIButton *hiddenBTN;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    __weak typeof (self) weakSelf = self;
    
    self.navigationController.navigationBarHidden = YES;
    isHidden = YES;
    
    self.view.backgroundColor = [UIColor colorWithRed:(arc4random() % 256 / 256.0)
                                                green:(arc4random() % 128 / 256.0) + 0.5
                                                 blue:(arc4random() % 128 / 256.0) + 0.5
                                                alpha:1];
    
    // 横向或者纵向等间隙的排列一组view
    UIView *sv11 = [UIView new];
    UIView *sv12 = [UIView new];
    UIView *sv13 = [UIView new];
    UIView *sv21 = [UIView new];
    UIView *sv31 = [UIView new];
    sv11.backgroundColor = [UIColor colorWithRed:(arc4random() % 256 / 256.0)
                                           green:(arc4random() % 128 / 256.0) + 0.5
                                            blue:(arc4random() % 128 / 256.0) + 0.5
                                           alpha:1];
    sv12.backgroundColor = [UIColor colorWithRed:(arc4random() % 256 / 256.0)
                                           green:(arc4random() % 128 / 256.0) + 0.5
                                            blue:(arc4random() % 128 / 256.0) + 0.5
                                           alpha:1];
    sv13.backgroundColor = [UIColor colorWithRed:(arc4random() % 256 / 256.0)
                                           green:(arc4random() % 128 / 256.0) + 0.5
                                            blue:(arc4random() % 128 / 256.0) + 0.5
                                           alpha:1];
    sv21.backgroundColor = [UIColor colorWithRed:(arc4random() % 256 / 256.0)
                                           green:(arc4random() % 128 / 256.0) + 0.5
                                            blue:(arc4random() % 128 / 256.0) + 0.5
                                           alpha:1];
    sv31.backgroundColor = [UIColor colorWithRed:(arc4random() % 256 / 256.0)
                                           green:(arc4random() % 128 / 256.0) + 0.5
                                            blue:(arc4random() % 128 / 256.0) + 0.5
                                           alpha:1];
    [self.view addSubview:sv11];
    [self.view addSubview:sv12];
    [self.view addSubview:sv13];
    [self.view addSubview:sv21];
    [self.view addSubview:sv31];
    
    //给予不同的大小 测试效果
    [sv11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@[sv12,sv13]);
        make.centerX.equalTo(@[sv21,sv31]);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    [sv12 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(70, 20));
    }];
    [sv13 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    [sv21 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 20));
    }];
    [sv31 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(40, 60));
    }];
    
    [self.view distributeSpacingHorizontallyWith:@[sv11,sv12,sv13]];
    [self.view distributeSpacingVerticallyWith:@[sv11,sv21,sv31]];
    [self.view showPlaceHolderWithAllSubviews];
    [self.view hidePlaceHolder];
    
    hiddenBTN = [UIButton buttonWithType:UIButtonTypeSystem];
    [hiddenBTN setTitle:@"显示" forState:UIControlStateNormal];
    [hiddenBTN addTarget:self action:@selector(hiddenButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:hiddenBTN];
    
    [hiddenBTN mas_makeConstraints:^(MASConstraintMaker *make) {
        __strong typeof(self) strongSelf = weakSelf;
        if (strongSelf)
        {
            make.left.equalTo(strongSelf.view.mas_left).with.offset(200);
            make.right.equalTo(strongSelf.view.mas_right).with.offset(-50);
            make.bottom.equalTo(strongSelf.view.mas_bottom).with.offset(-50);
            make.height.mas_equalTo(40);
        }
    }];
    
}

- (void)hiddenButtonClicked:(id)sender
{
    self.navigationController.navigationBarHidden = isHidden;
    isHidden = !isHidden;
    if (isHidden)
    {
        [hiddenBTN setTitle:@"隐藏" forState:UIControlStateNormal];
    }
    else
    {
        [hiddenBTN setTitle:@"显示" forState:UIControlStateNormal];
    }
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
