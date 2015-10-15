//
//  UIView+IsometricView.m
//  MasonryDemo
//
//  Created by kaka on 15/10/15.
//  Copyright © 2015年 MoboGenie. All rights reserved.
//

#import "UIView+IsometricView.h"

#import "Masonry.h"

@implementation UIView (IsometricView)

- (void)distributeSpacingHorizontallyWith:(NSArray*)views
{
    NSMutableArray *spaces = [NSMutableArray arrayWithCapacity:views.count+1];
    
    for ( int i = 0 ; i < views.count+1 ; ++i )
    {
        UIView *v = [UIView new];
        [spaces addObject:v];
        [self addSubview:v];
        
        [v mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(v.mas_height);
        }];
    }
    
    UIView *v0 = spaces[0];
    
    __weak typeof (self) weakSelf = self;
    
    [v0 mas_makeConstraints:^(MASConstraintMaker *make) {
        __strong typeof(self) strongSelf = weakSelf;
        if (strongSelf)
        {
            make.left.equalTo(strongSelf.mas_left);
            make.centerY.equalTo(((UIView*)views[0]).mas_centerY);
        }
    }];
    
    UIView *lastSpace = v0;
    for ( int i = 0 ; i < views.count; ++i )
    {
        UIView *obj = views[i];
        UIView *space = spaces[i+1];
        
        [obj mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(lastSpace.mas_right);
        }];
        
        [space mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(obj.mas_right);
            make.centerY.equalTo(obj.mas_centerY);
            make.width.equalTo(v0);
        }];
        
        lastSpace = space;
    }
    
    [lastSpace mas_makeConstraints:^(MASConstraintMaker *make) {
        __strong typeof(self) strongSelf = weakSelf;
        if (strongSelf)
        {
            make.right.equalTo(strongSelf.mas_right);
        }
    }];
    
}

- (void)distributeSpacingVerticallyWith:(NSArray*)views
{
    NSMutableArray *spaces = [NSMutableArray arrayWithCapacity:views.count+1];
    
    for ( int i = 0 ; i < views.count+1 ; ++i )
    {
        UIView *v = [UIView new];
        [spaces addObject:v];
        [self addSubview:v];
        
        [v mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(v.mas_height);
        }];
    }
    
    
    UIView *v0 = spaces[0];
    
    __weak typeof (self) weakSelf = self;
    
    [v0 mas_makeConstraints:^(MASConstraintMaker *make) {
        __strong typeof(self) strongSelf = weakSelf;
        if (strongSelf)
        {
            make.top.equalTo(strongSelf.mas_top);
            make.centerX.equalTo(((UIView*)views[0]).mas_centerX);
        }
    }];
    
    UIView *lastSpace = v0;
    for ( int i = 0 ; i < views.count; ++i )
    {
        UIView *obj = views[i];
        UIView *space = spaces[i+1];
        
        [obj mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(lastSpace.mas_bottom);
        }];
        
        [space mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(obj.mas_bottom);
            make.centerX.equalTo(obj.mas_centerX);
            make.height.equalTo(v0);
        }];
        
        lastSpace = space;
    }
    
    [lastSpace mas_makeConstraints:^(MASConstraintMaker *make) {
        __strong typeof(self) strongSelf = weakSelf;
        if (strongSelf)
        {
            make.bottom.equalTo(strongSelf.mas_bottom);
        }
    }];
}

@end
