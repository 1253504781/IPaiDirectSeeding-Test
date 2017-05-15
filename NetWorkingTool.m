//
//  NetWorkingTool.m
//  YuCheng
//
//  Created by apple on 16/2/20.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "NetWorkingTool.h"
#import "AFNetworking.h"

@implementation NetWorkingTool

+ (void)GetNetWorking:(NSString *)URL Params:(id)params Success:(requestsuccessBlock)successBlock Failed:(requestFailedBlock)failedBlock {

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 响应数据支持的类型
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", @"text/json", @"text/plain", nil];
    
    // 请求超时设定
    manager.requestSerializer.timeoutInterval = 10;
    
    [manager GET:URL parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        //        NSLog(@"%@", downloadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failedBlock(error);
        //		[MBProgressHUDManager removeHUD];
    }];
}

// URL是去除公共请求头的部分  params是一个字典，字典中key为后台的参数，value为参数的值。responseObject为后台返回的数据
+ (void)PostNetWorking:(NSString *)URL params:(id)params Success:(requestsuccessBlock)successBlock Failed:(requestFailedBlock)failedBlock {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 响应数据支持的类型
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", @"text/json", @"text/plain", nil];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    // 请求超时设定
    manager.requestSerializer.timeoutInterval = 10;
    
    NSString *path = [NSString stringWithFormat:@"%@%@",API_BASE_URL,URL];
    
    [manager POST:path parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failedBlock(error);
    }];
}

@end
