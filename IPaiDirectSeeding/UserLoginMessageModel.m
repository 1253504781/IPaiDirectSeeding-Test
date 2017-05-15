//
//  UserLoginMessageModel.m
//  IPaiDirectSeeding
//
//  Created by Yuwei on 17/5/12.
//  Copyright © 2017年 HZY. All rights reserved.
//

#import "UserLoginMessageModel.h"

@implementation UserLoginMessageModel


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
