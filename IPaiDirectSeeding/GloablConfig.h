//
//  GloablConfig.h
//  Diandian
//
//  Created by 王 理 on 14/12/21.
//  Copyright (c) 2014年 王 理. All rights reserved.
//

#import <Foundation/Foundation.h>

//#import "MBProgressHUD.h"


@interface GloablConfig : NSObject//


//public var
//system
@property(nonatomic,assign)BOOL prdutype;
@property(nonatomic,assign)BOOL nxbsz;
@property(nonatomic,assign)BOOL nxbcy;
@property(nonatomic,assign)BOOL diqi;
@property(nonatomic,assign)BOOL huoqi;

@property (retain,nonatomic) NSMutableArray* prodTypeList;
@property (retain,nonatomic) NSMutableArray* nxbszdata;
@property (retain,nonatomic) NSMutableArray* nxbcydata;
@property (retain,nonatomic) NSMutableArray* huoqidata;
@property (retain,nonatomic) NSMutableArray* diqidata;

//@property (retain,nonatomic) NSMutableDictionary* prodTypeList;
@property (retain,nonatomic) NSMutableDictionary* nxbszdic;
@property (retain,nonatomic) NSMutableDictionary* nxbcydic;
@property (retain,nonatomic) NSMutableDictionary* huoqidic;
@property (retain,nonatomic) NSMutableDictionary* diqidic;

@property (assign , nonatomic) long endIndex; //用于标记理财界面切换到其他界面的时候上面的指示条对应的位置

@property (nonatomic,assign) BOOL goback;//是否登录

@property(nonatomic,assign)int shangZhengUpNum;
@property(nonatomic,assign)int shangZhengDownNum;

@property(nonatomic,assign)int chuangYeUpnum;
@property(nonatomic,assign)int chuangYeDownnum;

@property (nonatomic,retain) NSString *deviceToken;
@property (nonatomic, retain) NSString* appVersion;
@property (nonatomic, retain) NSString* deviceName;
@property (nonatomic, retain) NSString* modelName;
@property (nonatomic, retain) NSString* systemVersion;

@property (nonatomic, retain) NSString* nickname;


//user
@property (nonatomic,assign) BOOL isLogin;//是否登录
@property (nonatomic,assign) BOOL ifUseGesture;//是否使用手势密码
@property (nonatomic,assign) BOOL isRealName;//是否实名
@property (nonatomic,assign) BOOL isBindCard;//是否绑卡

@property (nonatomic, assign) int CreditLineAuth;//激活信用额度 //0 未激活  1 已经激活 2 激活中 3激活失败
@property (nonatomic, assign) int BindCard;//绑定银行卡状态 //0 未绑定 1 已绑定
@property (nonatomic, retain) NSString* AuthIdentity;//身份认证状态 //B000 未认证 B001 认证通过 B002 认证失败


@property (nonatomic, retain) NSString* userId;
@property (nonatomic, retain) NSString* userGesturepw;
@property (nonatomic, retain) NSString* userPhone;
@property (nonatomic, retain) NSString* headimage;
//@property (nonatomic, retain) UIImagev* myhead;

@property (nonatomic, retain) NSDictionary* userData;
//@property (nonatomic, retain) NSDictionary* customerBasic;
@property (nonatomic, retain) NSDictionary* user;


@property (nonatomic,assign) BOOL goBackMain;//手势密码换账号登录返回主页


//@property (nonatomic, retain) MBProgressHUD *hud;


- (NSString*)getStringWithoutEmptyspace:(NSString *)aString;
- (BOOL)fitToMobileNumberWithString:(NSString*)aString;
- (NSString*)getStringByFormat:(NSString* )aString format:(NSString*)format;
- (NSString*)GetMarkedBankNum:(NSString* )aString;

- (BOOL)fitToChineseIDWith18String:(NSString*)aString;
- (BOOL)fitToChineseIDWith15String:(NSString*)aString;
- (BOOL)fitToChineseCharacterOnly:(NSString*)aString;
- (BOOL)fitToBankCard:(NSString*)cardNum;




//public functions
- (NSString *)toFormatNumberStringWith:(NSString *)numstring;//截取字符转；
- (void)CleanInfo;
- (void)storeUserData:(NSDictionary*)dic;

+ (BOOL)CompareVersion:(NSString*)versionNow withVersion:(NSString*)versionServer;


+ (NSString *) md5:(NSString *)str;

- (NSMutableDictionary*)getConfigDic;
-(void)deletecofigdic;
- (void)saveConfigDic:(NSMutableDictionary*)aDic;
- (void)saveObject:(NSString*)value for:(NSString*)key;
- (void)cleanDic;


-(void)goComment;
-(void)goDownload;


//+(void)simpleAlert:(NSString*)text withView:(UIView *)view;

@property (nonatomic,assign) BOOL background;
@property (nonatomic,assign) int rootNow;//0手势密码登录,1tabbar,2其他
@property (nonatomic,assign) int rootLast;//0手势密码登录,1tabbar,2其他
@property (nonatomic,assign) BOOL noShowGesture;//支付界面不显示手势密码登陆


@end

@interface NSString (HXAddtions)
+(NSString *) jsonStringWithString:(NSString *) string;
+(NSString *) jsonStringWithArray:(NSArray *)array;
+(NSString *) jsonStringWithDictionary:(NSDictionary *)dictionary;
+(NSString *) signStringWithDictionary:(NSDictionary *)dictionary;
+(NSString *) jsonStringWithObject:(id) object;

@end
