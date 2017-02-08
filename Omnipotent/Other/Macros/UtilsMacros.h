//
//  UtilsMacros.h
//  XWTSmartHome
//
//  Created by zivInfo on 16/6/20.
//  Copyright © 2016年 xiwangtech.com. All rights reserved.
//

#ifndef UtilsMacros_h
#define UtilsMacros_h


//**************************
//***      UI控件相关
//**************************
#pragma mark -
#pragma mark - 设置RGB颜色
//---------------设置RGB颜色------------------
//获得RGB颜色
//获得RGB颜色
#define BSColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define  RGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define  RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

//View 坐标(x,y)和宽高(width,height)
#define ViewxPos(v)                 (v).frame.origin.x
#define ViewyPos(v)                 (v).frame.origin.y
#define ViewWidth(v)                (v).frame.size.width
#define ViewHeight(v)               (v).frame.size.height

// PNG JPG 图片路径
#define GetImagePathFromBundle(NAME)    [[NSBundle mainBundle] pathForResource:[NSString stringWithUTF8String:NAME] ofType:nil]
#define GetExtPathFromBundle(NAME, EXT)         [[NSBundle mainBundle] pathForResource:(NAME) ofType:(EXT)]

//角度转换成弧度
#define  ANGEL(x) (x)/180.0 * M_PI

#pragma mark -
#pragma mark - 设置沙盒路径
//---------------设置沙盒路径------------------
//沙盒路径
#define PATH_OF_APP_HOME    NSHomeDirectory()
#define PATH_OF_TEMP        NSTemporaryDirectory()
#define PATH_OF_DOCUMENT    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]


#pragma mark -
#pragma mark - 年月日相关操作
//---------------年月日相关操作------------------
//获得当前的 年 月 日 时 分 秒
#define  CurrentSec [[NSCalendar currentCalendar] component:NSCalendarUnitSecond fromDate:[NSDate date]]
#define  CurrentMin [[NSCalendar currentCalendar] component:NSCalendarUnitMinute fromDate:[NSDate date]]
#define  CurrentHour [[NSCalendar currentCalendar] component:NSCalendarUnitHour fromDate:[NSDate date]]
#define  CurrentDay  [[NSCalendar currentCalendar] component:NSCalendarUnitDay fromDate:[NSDate date]]
#define  CurrentMonth [[NSCalendar currentCalendar] component:NSCalendarUnitMonth fromDate:[NSDate date]]
#define  CurrentYear [[NSCalendar currentCalendar] component:NSCalendarUnitYear fromDate:[NSDate date]]

//判断年份是否闰年
#define  IS_LEAP_YEAR  year%4==0&&year%100!=0||year%400==0



#endif /* UtilsMacros_h */
