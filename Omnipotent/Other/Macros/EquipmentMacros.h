//
//  EquipmentMacros.h
//  XWTSmartHome
//
//  Created by zivInfo on 16/6/20.
//  Copyright © 2016年 xiwangtech.com. All rights reserved.
//

#ifndef EquipmentMacros_h
#define EquipmentMacros_h


//**************************
//***      设备相关
//**************************
#pragma mark -
#pragma mark - 获取设备相关信息
//---------------获取设备相关信息------------------
//获取屏幕  宽度  高度   frame
#define  SCREEN_WIDTH  ([UIScreen mainScreen].bounds.size.width)
#define  SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define  SCREEN_FRAME  ([[UIScreen mainScreen].bounds])

//判断手机
#define  iPhone5       ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define  iPhone4       ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

//是否为ipad
#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

//判断是否为iOS7
#define  iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)

//获取系统版本
#define  IOS_VERSION  [[[UIDevice currentDevice] systemVersion] floatValue]

//获取手机序列号
#define  IdentifierNumber [[UIDevice currentDevice] uniqueIdentifier]

//获取手机别名(用户设置的名称)
#define  UserPhoneName  [[UIDevice currentDevice] name]

//获取手机名称(系统名称)
#define  DeviceName  [[UIDevice currentDevice] systemName]

//获取手机型号
#define  PhoneModel  [[UIDevice currentDevice] model]

//获取手机地方型号(国际化区域名称)
#define  LocalPhoneName  [[UIDevice currentDevice] localizedModel]

//获取当前语言
#define  CurrentLanguage   ([[NSLocale preferredLanguages] objectAtIndex:0])

//获取国际化区域名称
#define  LocalPhoneModel  [[UIDevice currentDevice] localizedModel]


#endif /* EquipmentMacros_h */
