//
//  ZVNavigationController.h
//  XWTSmartHome
//
//  Created by zivInfo on 16/6/21.
//  Copyright © 2016年 xiwangtech.com. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ZVBarButtonItem.h"

@interface ZVNavigationController : UINavigationController

// 初始化一次
+ (void)initialize;

/**
 *  重写这个方法目的：能够拦截所有push进来的控制器
 *
 *  @param viewController 即将push进来的控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated;

- (void)back;

- (void)more;

@end
