//
//  RootViewController.h
//  XWTSmartHome
//
//  Created by zivInfo on 16/6/21.
//  Copyright © 2016年 xiwangtech.com. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ZVNavigationController.h"

#import "ChallengeViewController.h"
#import "GameViewController.h"
#import "FindViewController.h"
#import "MeViewController.h"

@interface RootViewController : UITabBarController

/**
 *  添加一个子控制器
 *
 *  @param childVc       子控制器
 *  @param title         标题
 *  @param image         图片
 *  @param selectedImage 选中的图片
 */
- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage;

@end
