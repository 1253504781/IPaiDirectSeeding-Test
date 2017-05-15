//
//  GloablConfig.m
//  Diandian
//
//  Created by 王 理 on 14/12/21.
//  Copyright (c) 2014年 王 理. All rights reserved.
//

#import "GloablConfig.h"
#import <CommonCrypto/CommonDigest.h>
#import <UIKit/UIKit.h>
#import "AESCrypt.h"

@implementation GloablConfig


- (id) init
{
    self = [super init];
    if(self)
    {
//Bundle versions string, short
        self.goback=NO;
        self.appVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"IPaiBundleShortVersionString"];
        self.systemVersion = [[UIDevice currentDevice] systemVersion];
        self.deviceName = [[UIDevice currentDevice] name];
        self.modelName = [[UIDevice currentDevice] model];

        SSLog(@"%@",[[NSBundle mainBundle] infoDictionary]);
        
        self.userId = [[self getConfigDic] objectForKey:@"userId"];
        if(![[[self getConfigDic] objectForKey:@"headimage"] isKindOfClass:[NSNull class]])
            self.headimage = [[self getConfigDic] objectForKey:@"headimage"];

        NSString* ss = [[self getConfigDic] objectForKey:@"ifUseGesture"];
        if(ss == nil)
            self.ifUseGesture = YES;
        else
            self.ifUseGesture = [ss intValue];
    }
    
    return self;
}


//去拼音输入法的空格
- (NSString*)getStringWithoutEmptyspace:(NSString *)aString
{
    if(aString && aString.length > 0)
    {
        NSString* res = [aString stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%C", 8198] withString:@""];
        res = [res stringByReplacingOccurrencesOfString:@" " withString:@""];
        return res;
    }
    else
        return @"";
}


- (BOOL)fitToMobileNumberWithString:(NSString*)aString
{
    NSString * regex = @"^1[3|4|5|6|7|8]\\d{9}$";//新增6 7
    NSPredicate* pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:aString];
}

- (BOOL)fitToChineseIDWith15String:(NSString*)aString
{
    aString=[aString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString * regex1 = @"^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$";
    NSPredicate* pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex1];
    if ([pred1 evaluateWithObject:aString]) {
        //15位身份证号码
        NSString* strTmp;
        NSRange rg;
        //获得省代码
        rg.length = 2;
        rg.location = 0;
        strTmp = [aString substringWithRange:rg];
        if ([strTmp intValue] > 41 || [strTmp intValue] < 11) {
            //省代码不合法
            return NO;
        }
        //获得月份
        rg.location = 8;
        rg.length = 2;
        strTmp = [aString substringWithRange:rg];
        if ([strTmp intValue] > 12 || [strTmp intValue] < 1) {
            //月份不合法
            return NO;
        }
        
        //获得日
        rg.location = 10;
        rg.length = 2;
        strTmp = [aString substringWithRange:rg];
        if ([strTmp intValue] > 31 || [strTmp intValue] < 1) {
            //日不合法
            return NO;
        }
        
        return YES;
    }
    
    return NO;
}

- (BOOL)fitToChineseIDWith18String:(NSString*)aString
{
    aString=[aString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString * regex2 = @"^[1-9]\\d{5}(19|20)\\d{2}(0\\d|1[0-2])(([0|1|2]\\d)|3[0-1])\\d{3}(x|X|\\d)$";
    
    NSPredicate* pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex2];
    if ([pred2 evaluateWithObject:aString])
    {
        //18位身份证号码
        NSString* strTmp;
        NSRange rg;
        //获得省代码
        rg.length = 2;
        rg.location = 0;
        strTmp = [aString substringWithRange:rg];
        if ([strTmp intValue] > 99 || [strTmp intValue] < 1) {
            //省代码不合法
            return NO;
        }
        //获得年
        rg.location = 6;
        rg.length = 4;
        strTmp = [aString substringWithRange:rg];
        if ([strTmp intValue] > 2100 || [strTmp intValue] < 1900) {
            //年不合法
            return NO;
        }
        //获得月份
        rg.location = 10;
        rg.length = 2;
        strTmp = [aString substringWithRange:rg];
        if ([strTmp intValue] > 12 || [strTmp intValue] < 1) {
            //月份不合法
            return NO;
        }
        
        //获得日
        rg.location = 12;
        rg.length = 2;
        strTmp = [aString substringWithRange:rg];
        if ([strTmp intValue] > 31 || [strTmp intValue] < 1) {
            //日不合法
            return NO;
        }
        
        NSRange rangeLast;
        rangeLast.length = 1;
        rangeLast.location = 17;
        NSString* strLast = [aString substringWithRange:rangeLast];
        if ([strLast isEqualToString:@"x"]) {
            strLast = @"X";
        }
        
        
        int i = 0;
        int sum = 0;
        int a[17] = {7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2};
        
        for (i = 0; i < 17; i++) {
            NSRange range;
            range.location = i;
            range.length = 1;
            int intValue = [[aString substringWithRange:range]intValue];
            if (intValue >= 0 && intValue <=9) {
                sum += intValue * a[i];
            }
            else
            {
                //非数字
                return NO;
            }
        }
        int y = sum % 11;
        
        NSDictionary* dicTmp = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"1",@"0",
                                @"0",@"1",
                                @"X",@"2",
                                @"9",@"3",
                                @"8",@"4",
                                @"7",@"5",
                                @"6",@"6",
                                @"5",@"7",
                                @"4",@"8",
                                @"3",@"9",
                                @"2",@"10", nil];
        NSString* strCounted = [dicTmp objectForKey:[NSString stringWithFormat:@"%d",y]];
        if ([strLast isEqualToString:strCounted]) {
            return YES;
        }
        else
            return NO;//验证码不匹配
        
    }
    
    return NO;
}

- (BOOL)fitToChineseCharacterOnly:(NSString*)aString {
    if(!aString || aString.length == 0)
        return NO;
    NSString* regex = @"^[\u4e00-\u9fa5]{0,}$";
    NSPredicate * pred      = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:aString];
}


+ (BOOL)fitToName:(NSString*)aString {
    NSString* regex = @"^[\u4E00-\u9FA5A-Za-z]+$";
    NSPredicate * pred      = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:aString];
}
+ (BOOL)fitToEngOrNumber:(NSString*)aString {
    NSString* regex = @"[a-zA-Z0-9\\b\\n]*";
    NSPredicate * pred      = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:aString];
}
+ (BOOL)fitToNumberOrX:(NSString*)aString {
    NSString* regex = @"^[0-9Xx]*$";
    NSPredicate * pred      = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:aString];
}

-(BOOL)fitToBankCard:(NSString*)cardNum
{
    NSString* digitsOnly = cardNum;
    int sum = 0;
    int digit = 0;
    int addend = 0;
    BOOL timesTwo = NO;
    
    for (int i = (int)digitsOnly.length - 1; i >= 0; i--)
    {
        NSRange ra;
        ra.length = 1;
        ra.location = i;
        digit = [[digitsOnly substringWithRange:ra] intValue];
        //Integer.parseInt(digitsOnly.substring(i, i + 1));
        if (timesTwo)
        {
            addend = digit * 2;
            if (addend > 9)
            {
                addend -= 9;
            }
        }
        else
        {
            addend = digit;
        }
        sum += addend;
        timesTwo = !timesTwo;
    }
    
    int modulus = sum % 10;
    return modulus == 0;
}


//调用[SSPredicate getStringByFormat:@"123456789012345" format:@"4 4 4 4"];
//结果1234 5678 0123 45
//format最后一位如果不够，有多少显示多少
- (NSString*)getStringByFormat:(NSString* )aString format:(NSString*)format;
{
    if(!aString || !format || format.length < 2)
        return nil;
    NSArray* farr = [format componentsSeparatedByString:@" "];
    
    NSMutableArray* newarr = [[NSMutableArray alloc]init];
    int start = 0;
    for(int i = 0;i<farr.count;i++)
    {
        NSRange ra;
        ra.location = start;
        ra.length = [[farr objectAtIndex:i]integerValue];
        start += ra.length;
        if(ra.location+ra.length < aString.length)
        {
            [newarr addObject:[aString substringWithRange:ra]];
        }
        else if(ra.location < aString.length)
        {
            [newarr addObject:[aString substringFromIndex:ra.location]];
            break;
        }
        else
            break;
    }
    
    NSString* newstr = [newarr componentsJoinedByString:@" "];
    //[farr release];
    return newstr;
}

- (NSString*)GetMarkedBankNum:(NSString* )aString;
{
    if(!aString)
        return nil;
    
    NSString* format;

    if(aString.length > 16)
        format = @"4 4 4 4 3";
    else
        format = @"4 4 4 4";
    
    NSArray* farr = [format componentsSeparatedByString:@" "];
    
    NSMutableArray* newarr = [[NSMutableArray alloc]init];
    int start = 0;
    for(int i = 0;i<farr.count;i++)
    {
        NSRange ra;
        ra.location = start;
        ra.length = [[farr objectAtIndex:i]integerValue];
        start += ra.length;
        if(ra.location+ra.length < aString.length)
        {
            if(i==0 || i==farr.count - 1)
                [newarr addObject:[aString substringWithRange:ra]];
            else
                [newarr addObject:@"****"];

        }
        else if(ra.location < aString.length)
        {
            if(i==0 || i==farr.count - 1)
                [newarr addObject:[aString substringFromIndex:ra.location]];
            else
                [newarr addObject:@"****"];
            break;
        }
        else
            break;
    }
    
    NSString* newstr = [newarr componentsJoinedByString:@" "];
    //[farr release];
    return newstr;
}

-(void)CleanInfo
{
    self.userId = @"";
}

- (void)storeUserData:(NSDictionary*)dic
{
    self.userData = dic;
    //self.customerBasic = [dic objectForKey:@"customerBasic"];
    self.user = dic;//[self.customerBasic objectForKey:@"user"];
    //NSDictionary* customerBasic = [dic objectForKey:@"customerBasic"];
    self.userId = [NSString stringWithFormat:@"%@",[dic objectForKey:@"id"]];
    if(![[dic objectForKey:@"headimage"] isKindOfClass:[NSNull class]])
        self.headimage = [dic objectForKey:@"headimage"];
}

+ (BOOL)CompareVersion:(NSString*)versionNow withVersion:(NSString*)versionServer
{
    if(!versionServer || !versionNow)
        return NO;
    
    int firstNow = [[versionNow substringToIndex:1]intValue];
    int firstSer = [[versionServer substringToIndex:1]intValue];
    if(firstSer > firstNow)
    {
        return YES;
    }
    
    if(versionNow.length >= 3 && versionServer.length >= 3)
    {
        firstNow = [[versionNow substringWithRange:NSMakeRange(2, 1)]intValue];
        firstSer = [[versionServer substringWithRange:NSMakeRange(2, 1)]intValue];
        if(firstSer > firstNow)
        {
            return YES;
        }
    }

    if(versionNow.length >= 5 && versionServer.length >= 5)
    {
        firstNow = [[versionNow substringWithRange:NSMakeRange(4, 1)]intValue];
        firstSer = [[versionServer substringWithRange:NSMakeRange(4, 1)]intValue];
        if(firstSer > firstNow)
        {
            return YES;
        }
    
    }

    
    return NO;

}


+ (NSString *) md5:(NSString *)str
{
    if (str) {
        const char *cStr = [str UTF8String];
        unsigned char result[32];
        CC_MD5( cStr, strlen(cStr), result );
        return [NSString
                stringWithFormat: @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                result[0], result[1],
                result[2], result[3],
                result[4], result[5],
                result[6], result[7],
                result[8], result[9],
                result[10], result[11],
                result[12], result[13],
                result[14], result[15]
                ];
    }
    else
        return nil;
}


- (NSMutableDictionary*)getConfigDic
{
    NSString *filename= [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/AppConfig.plist"];
    NSMutableDictionary* dicFile = [NSMutableDictionary dictionaryWithContentsOfFile:filename];
    if (!dicFile) {
        //该plist不存在
        dicFile = [NSMutableDictionary dictionary];
        [dicFile writeToFile:filename atomically:YES];
    }
    
    NSMutableDictionary* dicRet = [dicFile objectForKey:@"configDic"];
    if (!dicRet) {
        //该plist没有当前版本数据
        dicRet = [NSMutableDictionary dictionary];
        
        [dicFile setObject:dicRet forKey:@"configDic"];
        [dicFile writeToFile:filename atomically:YES];
    }
    else
    {
        SSLog(@"读取解密前 %@ %@ \n%@",self.modelName,self.deviceName,dicRet);
        //解密
        for (int i = 0 ;i < dicRet.allKeys.count ; i ++)
        {
            NSString* value = [dicRet objectForKey:[dicRet.allKeys objectAtIndex:i]];
            NSString* newvalue = [self AESDCryptcode:value];
            if(!newvalue)
            {
                dicRet = [NSMutableDictionary dictionary];
                
                [dicFile setObject:dicRet forKey:@"configDic"];
                [dicFile writeToFile:filename atomically:YES];
                return dicRet;
            }
            [dicRet setObject:newvalue forKey:[dicRet.allKeys objectAtIndex:i]];
        }
        SSLog(@"读取解密后\n%@",dicRet);

    }
    
    return dicRet;
}

-(void)deletecofigdic{
     NSString *filename= [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/AppConfig.plist"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager removeItemAtPath:filename error:nil];
}

- (void)saveConfigDic:(NSMutableDictionary*)aDic
{
    NSString *filename= [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/AppConfig.plist"];
    NSMutableDictionary* dicFile = [NSMutableDictionary dictionaryWithContentsOfFile:filename];
    if (!dicFile) {
        //该plist不存在
        dicFile = [NSMutableDictionary dictionary];
        
    }
    
    NSMutableDictionary* dicRet = [NSMutableDictionary dictionaryWithDictionary:aDic];
    
    SSLog(@"保存加密前\n%@",dicRet);
    //解t
    for (int i = 0 ;i < dicRet.allKeys.count ; i ++)
    {
        NSString* value = [dicRet objectForKey:[dicRet.allKeys objectAtIndex:i]];
        if(!value || [value isKindOfClass:[NSNull class]])//为空就删除
            continue;
        value = [NSString stringWithFormat:@"%@",value];
        NSString* newvalue = [self AESCryptcode:value];
        [dicRet setObject:newvalue forKey:[dicRet.allKeys objectAtIndex:i]];
    }
    SSLog(@"保存加密后\n%@",dicRet);
    
    [dicFile setObject:dicRet forKey:@"configDic"];
    
    NSString* das = [dicRet objectForKey:@"useGesture"];
    SSLog(@"useGesture=======>>> %@",das);
    
    BOOL result = [dicFile writeToFile:filename atomically:YES];
    if(!result)
    {
        SSLog(@"数据库保存失败");
    }
}

- (void)cleanDic
{
    NSMutableDictionary* dic = [self getConfigDic];
    [dic removeAllObjects];
    [self saveConfigDic:dic];
    
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *currentVersion = [NSString stringWithFormat:@"%@",infoDic[@"CFBundleVersion"]];
    
    [dic setValue:currentVersion forKey:@"GuideVersion"];
     [self saveConfigDic:dic];
}

- (void)saveObject:(NSString*)value for:(NSString*)key
{
    NSMutableDictionary* dic = [self getConfigDic];
    [dic setObject:value forKey:key];
    [self saveConfigDic:dic];
}

//解密
-(NSString *)AESDCryptcode:(NSString *)base64EncodedString{
    NSString* key = self.modelName;
    
    NSString *backstr=nil;
    
    NSString *sha1str = [AESCrypt getSha1String:key];
    NSString *shastr = [sha1str substringWithRange:NSMakeRange(0, 15)];
    
    NSString *allstr=[NSString stringWithFormat:@"%@%@",APPID,key];
    NSString *allstrsha1str = [AESCrypt getSha1String:allstr];
    NSString *allshastr = [allstrsha1str substringWithRange:NSMakeRange(0, 15)];
    
    NSString *botallstr=[NSString stringWithFormat:@"%@%@",key,APPID];
    NSString *botallstrshastr = [AESCrypt getSha1String:botallstr];
    NSString *boallshastr = [botallstrshastr substringWithRange:NSMakeRange(0, 15)];
    
    NSString *keychain=[NSString stringWithFormat:@"%@%@",allshastr,boallshastr];
    
    
    backstr=[AESCrypt dncrypt:base64EncodedString password:keychain initializationVector:shastr];
    return backstr;
}

//加密
-(NSString *)AESCryptcode:(NSString *) accountpassword{
    NSString *backstr=nil;
    NSString* key = self.modelName;

    NSString *sha1str = [AESCrypt getSha1String:key];
    NSString *shastr = [sha1str substringWithRange:NSMakeRange(0, 15)];
    
    NSString *allstr=[NSString stringWithFormat:@"%@%@",APPID,key];
    NSString *allstrsha1str = [AESCrypt getSha1String:allstr];
    NSString *allshastr = [allstrsha1str substringWithRange:NSMakeRange(0, 15)];
    
    NSString *botallstr=[NSString stringWithFormat:@"%@%@",key,APPID];
    NSString *botallstrshastr = [AESCrypt getSha1String:botallstr];
    NSString *boallshastr = [botallstrshastr substringWithRange:NSMakeRange(0, 15)];
    
    NSString *keychain=[NSString stringWithFormat:@"%@%@",allshastr,boallshastr];
    backstr= [AESCrypt encrypt:accountpassword password:keychain initializationVector:shastr];
    

    return backstr;
}


-(void)goComment
{
    NSString *str = [NSString stringWithFormat:@"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@",APPID];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}

-(void)goDownload
{
    NSString *str = [NSString stringWithFormat:@"http://itunes.apple.com/us/app/id%@", APPID];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}


- (void)checkUpdate:(NSString *)versionFromAppStroe {
    
    NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
    
    NSString *nowVersion = [infoDict objectForKey:@"CFBundleVersion"];
    
    SSLog(@"nowVersion == %@",nowVersion);
    
    //[processViewstopAnimating];
    
    //检查当前版本与appstore的版本是否一致
    
    if (![versionFromAppStroe isEqualToString:nowVersion])
        
    {
        
        UIAlertView *createUserResponseAlert = [[UIAlertView alloc] initWithTitle:@"提示" message: @"有新的版本可供下载" delegate:self cancelButtonTitle:@"下次再说" otherButtonTitles: @"去下载", nil];
        
        [createUserResponseAlert show];
        
    } else {
        
        //[CTCommonUtilsshowAlertViewOnView:self.viewwithText:@"暂无新版本"];
        
    }
    
}

+ (void)simpleAlert:(NSString*)text withView:(UIView*)view
{
    
//    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
//    
//    // Configure for text only and offset down
//    hud.mode = MBProgressHUDModeText;
//    hud.labelText = text;
//    hud.margin = 10.f;
//    hud.removeFromSuperViewOnHide = YES;
//    
//    [hud hide:YES afterDelay:2];
}


- (NSString *)toFormatNumberStringWith:(NSString *)numstring
{
    BOOL isnegative=NO;
    NSString *str=[numstring substringWithRange:NSMakeRange(0,1)];
    if ([str isEqualToString:@"-"]) {
        isnegative=YES;
        numstring=[numstring substringWithRange:NSMakeRange(1,numstring.length-1)];
    }

    if (numstring.length < 3)
    {
        if(isnegative)
        numstring = [NSString stringWithFormat:@"-%@",numstring];
        return numstring;
    }
    NSString *numStr = numstring;
    NSArray *array = [numStr componentsSeparatedByString:@"."];
    NSString *numInt = [array objectAtIndex:0];
    if (numInt.length <= 3)
    {
        if(isnegative)
            numstring = [NSString stringWithFormat:@"-%@",numstring];
        return numstring;
    }
    NSString *suffixStr = @"";
    if ([array count] > 1)
    {
        suffixStr = [NSString stringWithFormat:@".%@",[array objectAtIndex:1]];
    }
    
    NSMutableArray *numArr = [[NSMutableArray alloc] init];
    while (numInt.length > 3)
    {
        NSString *temp = [numInt substringFromIndex:numInt.length - 3];
        numInt = [numInt substringToIndex:numInt.length - 3];
        [numArr addObject:[NSString stringWithFormat:@",%@",temp]];//得到的倒序的数据
    }
    int count = numArr.count;
    for (int i = 0; i < count; i++)
    {
        numInt = [numInt stringByAppendingFormat:@"%@",[numArr objectAtIndex:(count -1 -i)]];
    }
    if (!isnegative)
        numStr = [NSString stringWithFormat:@"%@%@",numInt,suffixStr];
    else
         numStr = [NSString stringWithFormat:@"-%@%@",numInt,suffixStr];
    return numStr;
}






//+ (NSString *) md5_base64:(NSString *)str {
//    if (str) {
//        const char *cStr = [str UTF8String];
//        unsigned char result[32];
//        memset(result, 0, 32);
//        CC_MD5( cStr, strlen(cStr), result );
//        return [GTMBase64 stringByEncodingBytes:result length:16 ];
//    }
//    else
//        return nil;
//}
@end


@implementation NSString (HXAddtions)

+(NSString *) jsonStringWithString:(NSString *) string
{
    return [NSString stringWithFormat:@"\"%@\"",
            [[string stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"] stringByReplacingOccurrencesOfString:@"\""withString:@"\\\""]
            ];
}

+(NSString *) jsonStringWithArray:(NSArray *)array
{
    NSMutableString *reString = [NSMutableString string];
    [reString appendString:@"["];
    NSMutableArray *values = [NSMutableArray array];
    for (id valueObj in array) {
        NSString *value = [NSString jsonStringWithObject:valueObj];
        if (value) {
            [values addObject:[NSString stringWithFormat:@"%@",value]];
        }
    }
    [reString appendFormat:@"%@",[values componentsJoinedByString:@","]];
    [reString appendString:@"]"];
    return reString;
}

+(NSString *) jsonStringWithDictionary:(NSDictionary *)dictionary
{
    NSArray *keys = [dictionary allKeys];
    NSMutableString *reString = [NSMutableString string];
    [reString appendString:@"{"];
    NSMutableArray *keyValues = [NSMutableArray array];
    for (int i=0; i<[keys count]; i++) {
        NSString *name = [keys objectAtIndex:i];
        id valueObj = [dictionary objectForKey:name];
        NSString *value = [NSString jsonStringWithObject:valueObj];
        if (value) {
            [keyValues addObject:[NSString stringWithFormat:@"\"%@\":%@",name,value]];
        }
    }
    [reString appendFormat:@"%@",[keyValues componentsJoinedByString:@","]];
    [reString appendString:@"}"];
    return reString;
}

+(NSString *) signStringWithDictionary:(NSDictionary *)dictionary
{
    NSArray *keys = [dictionary allKeys];
    NSMutableString *reString = [NSMutableString string];
    for (int i=0; i<[keys count]; i++) {
        NSString *name = [keys objectAtIndex:i];
        NSString *value = [dictionary objectForKey:name];
        [reString appendFormat:@"%@%@",name,value];
    }
    return reString;
}

+(NSString *) jsonStringWithObject:(id) object
{
    NSString *value = nil;
    if (!object) {
        return value;
    }
    if ([object isKindOfClass:[NSString class]]) {
        value = [NSString jsonStringWithString:object];
    }else if([object isKindOfClass:[NSDictionary class]]){
        value = [NSString jsonStringWithDictionary:object];
    }else if([object isKindOfClass:[NSArray class]]){
        value = [NSString jsonStringWithArray:object];
    }
    return value;
}






@end
