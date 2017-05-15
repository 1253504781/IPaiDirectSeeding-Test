//
//  Gloabl.h
//  Diandian
//
//  Created by 王 理 on 14/12/21.
//  Copyright (c) 2014年 王 理. All rights reserved.
//

#ifndef Diandian_Gloabl_h
#define Diandian_Gloabl_h

#import "GloablConfig.h"
#import "DataModel.h"
#import "UIImageView+WebCache.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define kRed UIColorFromRGB(0xe57e59) //红
#define kGreen UIColorFromRGB(0x80c764) //绿
#define KQianBule UIColorFromRGB(0x64b5c9) //浅蓝
#define kBlueGreen UIColorFromRGB(0x55c7cb) //蓝绿
#define kShenGreen UIColorFromRGB(0x29a6dc) //深蓝
#define kOrange UIColorFromRGB(0xff9000) //橙色
#define kQianOrange UIColorFromRGB(0xffb658) //浅橙

#define kFont(f) [UIFont systemFontOfSize:f * KScalenHeight]

//1.屏幕尺寸
#define KScreenWidth [UIScreen mainScreen].bounds.size.width
#define KScreenHeight [UIScreen mainScreen].bounds.size.height
#define KScaleWidth [UIScreen mainScreen].bounds.size.width / 375
#define KScalenHeight [UIScreen mainScreen].bounds.size.height / 667

#define myNumbers          @"0123456789\n"
#define myDotNumbers     @"0123456789.\n"

#define simpleAlertView(msg) {UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"提示" message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil]; [av show];}

#define IOS6 ([[[UIDevice currentDevice] systemVersion] floatValue]<7.0 ? YES : NO)
#define IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue]>=7.0 ? YES : NO)
#define IOS8 ([[[UIDevice currentDevice] systemVersion] floatValue]>=8.0 ? YES : NO)
#define IOS9 ([[[UIDevice currentDevice] systemVersion] floatValue]>=9.0 ? YES : NO)

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define KRequestFail @"网络连接失败，请稍后再试"

#define APPID @"996525512"
#define UMengAPPID @"561f77d7e0f55a8350000d68"

#define KCommonUrl @"http://interface.ijgc.cn/api/%@/interface"//生产
//#define KCommonUrl @"http://121.41.90.222:8581/api/%@/interface"//测试
//#define KCommonUrl @"http://192.168.101.196:8080/api/%@/interface"

#define KUpdateImgUrl @"http://interface.ijgc.cn/api/upload/headimage" //生产
//#define KUpdateImgUrl @"http://121.41.90.222:8581/api/upload/headimage" //测试

#define KDNS @"http://www.ijgc.cn/" //生产环境动态
#define KStaticDNS @"http://html.ijgc.cn/" //生产环境静态

#define BuildIOS8
#define SSLog(format, ...) NSLog(format, ## __VA_ARGS__)


extern GloablConfig* gloabl;

#endif
