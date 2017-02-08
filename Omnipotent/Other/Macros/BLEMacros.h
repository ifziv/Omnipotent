//
//  BLEMacros.h
//  XWTSmartHome
//
//  Created by zivInfo on 16/6/22.
//  Copyright © 2016年 xiwangtech.com. All rights reserved.
//

#ifndef BLEMacros_h
#define BLEMacros_h


//**************************
//***      BLE相关信息
//**************************
#pragma mark -
#pragma mark - BLE相关信息
//---------------获取BLE相关信息------------------
#import <CoreBluetooth/CoreBluetooth.h>

//BLE特征值
//#define kReadCharacteristc  @"D44BC439-ABFD-45A2-B575-925416129601"      //读的特征 FFE1
//#define kWriteCharacteristc @"D44BC439-ABFD-45A2-B575-925416129600"      //写的特征 FFE3
#define kReadCharacteristc  @"FFE1"      //读的特征 FFE1
#define kWriteCharacteristc @"FFE3"      //写的特征 FFE3

#define kHead 0x08
#define kCommandLength(arrayName) sizeof(arrayName)/sizeof(arrayName[0])

#define kSaveModelPath              [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]                    //保存蓝牙历史记录文件路径
#define kSaveHistoryName            @"bleModel.data"      //保存历史记录文件名
#define kSaveCurrBleName            @"currentPerModel.data" //保存当前连接蓝牙的文件名



#endif /* BLEMacros_h */
