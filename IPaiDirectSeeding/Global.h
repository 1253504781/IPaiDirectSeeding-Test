//
//  Global.h
//  IPaiDirectSeeding
//
//  Created by 牧仁者 on 2017/5/6.
//  Copyright © 2017年 HZY. All rights reserved.
//

#ifndef Global_h
#define Global_h


//1.屏幕尺寸
#define KScreenWidth [UIScreen mainScreen].bounds.size.width
#define KScreenHeight [UIScreen mainScreen].bounds.size.height


#define simpleAlertView(msg) {UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"提示" message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil]; [av show];}

#define SSLog(format, ...) NSLog(format, ## __VA_ARGS__)


#define IOS6 ([[[UIDevice currentDevice] systemVersion] floatValue]<7.0 ? YES : NO)
#define IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue]>=7.0 ? YES : NO)
#define IOS8 ([[[UIDevice currentDevice] systemVersion] floatValue]>=8.0 ? YES : NO)
#define IOS9 ([[[UIDevice currentDevice] systemVersion] floatValue]>=9.0 ? YES : NO)

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)



#define APPID @"996525512"
#define UMengAPPID @"561f77d7e0f55a8350000d68"


static NSString * const url1 = @"http://c.m.163.com/nc/video/home/1-10.html";
static NSString * const url2 = @"http://apis.baidu.com/apistore/";
static NSString * const url3 = @"http://yycloudvod1932283664.bs2dl.yy.com/djMxYTkzNjQzNzNkNmU4ODc1NzY1ODQ3ZmU5ZDJlODkxMTIwMjM2NTE5Nw";
static NSString * const url4 = @"http://www.aomy.com/attach/2012-09/1347583576vgC6.jpg";
static NSString * const url5 = @"http://chanyouji.com/api/users/likes/268717.json";


#define defaultUrl        @"http://zl160528.15.baidusx.com/app/log_mobile.php"

/*！国内天气预报融合版－apikey */
//#define apikey  @"82428a4618b6aa313be6914d727cb9b7"

#define BAKit_ShowAlertWithMsg(msg) UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:msg preferredStyle:UIAlertControllerStyleAlert];\
UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确 定" style:UIAlertActionStyleDefault handler:nil];\
[alert addAction:sureAction];\
[self presentViewController:alert animated:YES completion:nil];

#endif /* Global_h */
