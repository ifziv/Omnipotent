//
//  NetworkMacros.h
//  XWTSmartHome
//
//  Created by zivInfo on 16/6/20.
//  Copyright © 2016年 xiwangtech.com. All rights reserved.
//

#ifndef NetworkMacros_h
#define NetworkMacros_h


//**************************
//***      网络相关
//**************************
#pragma mark -
#pragma mark - 服务器地址
//---------------服务器地址------------------
#define SERVER_ADDRESS   @"http://www.xiwangtech.com:8080"

//---------------User-----------------------
#define USER_REGISTER    @"/api/user/register"
#define USER_LOGIN       @"/api/user/login"
#define USER_UPDATA      @"/api/user/password"

//---------------Device---------------------
#define CREATE_DEVICE    @"/api/user/device"





#ifdef DEBUG  //Debug状态下的测试API
#define API_BASE_URL_STRING     @""
#else   //Release状态下的线上API
#define API_BASE_URL_STRING     @""
#endif

//  0表示正式地址，，1表示测试地址
#define serviceDebug 0
#define SERVER_Arrdess (serviceDebug == 1)?JTB_Ceshi:JTB_URL
#define JTB_URL   @"http://www.xiwangtech.com:8080"                     //正式
#define JTB_Ceshi @"http://192.168.1.221:8012"                    //测试



#endif /* NetworkMacros_h */
