//
//  NetWorkingTool.h
//  YuCheng
//
//  Created by apple on 16/2/20.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *const API_BASE_URL = @"http://47.93.58.118:8080/auction-api/";


/**
 *  请求成功Block
 *
 *  @param responseObject 请求成功数据
 */
typedef void(^requestsuccessBlock)(id responseObject);

/**
 *  请求失败Block
 *
 *  @param error 请求失败错误信息
 */
typedef void (^requestFailedBlock) (NSError *error);

@interface NetWorkingTool : NSObject

// 请求时导入头文件#import “NetWorkingTool.h”


// 导入后直接调用[NetWorkingTool PostNetWorking:url params:dict Success(id responseObject)^{
//       NSLog(%@,responseObject);
//   } Failed(NSError *error)^{
//        NSLog(%@,error);
//}];


/**
 *  Get请求
 *
 *  @param URL          接口
 *  @param params       body
 *  @param successBlock 请求成功回调
 *  @param failedBlock  请求失败回调
 */
+ (void)GetNetWorking:(NSString *)URL
               Params:(id)params
              Success:(requestsuccessBlock)successBlock
               Failed:(requestFailedBlock)failedBlock;

/**
 *  Psot请求
 *
 *  @param URL          接口
 *  @param params       body
 *  @param successBlock 请求成功回调
 *  @param failedBlock  请求失败回调
 */
+ (void)PostNetWorking:(NSString *)URL
                params:(id)params
               Success:(requestsuccessBlock)successBlock
                Failed:(requestFailedBlock)failedBlock;


/**
 *Post请求
 *
 
*/
- (void)someViewController:(SomeViewController *)someViewController sendToAnotherVCWithName:(NSString *)name andIDNum:(NSString *)idNum

@end
