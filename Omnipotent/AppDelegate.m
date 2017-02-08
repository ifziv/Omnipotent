//
//  AppDelegate.m
//  Omnipotent
//
//  Created by zivInfo on 16/9/9.
//  Copyright © 2016年 xiwangtech.com. All rights reserved.
//

#import "AppDelegate.h"

//获取app版本号 (格式:1.0.1)
#define  AppCurVersion  [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

#define APPFirstRun @"APPFirstRun"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    [self RootAction];
    //不是第一次打开就判断是否登录，是就进入引导。
    if ([AppCurVersion isEqualToString:[[NSUserDefaults standardUserDefaults] objectForKey:APPFirstRun]]) {
        
        //没有登录就登录，登录就进入主界面。
        if ([[NSUserDefaults standardUserDefaults] objectForKey:@"APPIsLogin"]) {
            [self RootAction];
        }
        else {
            [self LoginAction];
        }
        
    }
    else {
        [[NSUserDefaults standardUserDefaults] setObject:AppCurVersion forKey:APPFirstRun];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [((AppDelegate*)[[UIApplication sharedApplication] delegate]) GuideAction];
    }

    
    return YES;
}

-(void)RootAction
{
    self.window.rootViewController = [[RootViewController alloc] init];
}

-(void)LoginAction
{
    ZVNavigationController *zvNav = [[ZVNavigationController alloc] initWithRootViewController:[[LoginViewController alloc] init]];
    self.window.rootViewController = zvNav;
}

-(void)GuideAction
{
    self.window.rootViewController = [[GuideViewController alloc] init];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
