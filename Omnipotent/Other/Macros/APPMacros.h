//
//  APPMacros.h
//  XWTSmartHome
//
//  Created by zivInfo on 16/6/20.
//  Copyright © 2016年 xiwangtech.com. All rights reserved.
//

#ifndef APPMacros_h
#define APPMacros_h


//**************************
//***      APP相关信息
//**************************
#pragma mark -
#pragma mark - 获取APP相关信息
//---------------获取APP相关信息------------------
//获取app版本号 (格式:1.0.1)
#define  AppCurVersion  [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

//获取app版本号 int类型
#define  AppCurVersionNum [[[NSBundle mainBundle] infoDictionary] objectForkey:@"CFBundleVersion"]

//当前app应用名称
#define  AppCurName   [[[NSBundle mainBundle] infoDictionary] objectForkey:@"CFBundleDisplayName"]


#endif /* APPMacros_h */
