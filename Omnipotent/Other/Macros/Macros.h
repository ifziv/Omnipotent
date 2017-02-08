//
//  Macros.h
//  XWTSmartHome
//
//  Created by zivInfo on 16/6/20.
//  Copyright © 2016年 xiwangtech.com. All rights reserved.
//

#ifndef Macros_h
#define Macros_h


//APP相关信息
#import "APPMacros.h"

//网络相关信息
#import "NetworkMacros.h"

//UI控件&开发中定义的宏
#import "UtilsMacros.h"

//凭证类的宏(e.g. QQ第三方登录QQ给的ID)
#import "CertificateMacros.h"

//设备相关信息
#import "EquipmentMacros.h"

//各类通知
#import "NotificationMacros.h"

//NSUserDefaults
#import "UserDefaultsMacros.h"

//CoreData
#import "CoreDataMacros.h"

//BLE
#import "BLEMacros.h"

//其它库头文件(e.g. AFNetworking)
#import "OtherFrameMacros.h"



#import "ZVBarButtonItem.h"
#import "UIView+Extension.h"
#import "UITextField+ExtentRange.h"


#endif /* Macros_h */



/*
 //自定义Log
 #ifdef DEBUG
 #define XWLog(...) NSLog(__VA_ARGS__)
 #else
 #define XWLog(...)
 #endif
 
 //自定义Log
 #ifdef DEBUG
 #define XWLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
 #else
 #define XWLog(...)
 #endif
 */