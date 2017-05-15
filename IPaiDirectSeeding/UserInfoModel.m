//
//  UserInfoModel.m
//  IPaiDirectSeeding
//
//  Created by Yuwei on 17/5/11.
//  Copyright © 2017年 HZY. All rights reserved.
//

#import "UserInfoModel.h"

@implementation UserInfoModel

//为了防止属性和返回的数据不对应而导致的崩溃
+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}

//key的转换
+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:nil];
}


@end
