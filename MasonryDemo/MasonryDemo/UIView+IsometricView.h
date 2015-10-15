//
//  UIView+IsometricView.h
//  MasonryDemo
//
//  Created by kaka on 15/10/15.
//  Copyright © 2015年 MoboGenie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (IsometricView)

- (void)distributeSpacingHorizontallyWith:(NSArray*)views;

- (void)distributeSpacingVerticallyWith:(NSArray*)views;

@end
