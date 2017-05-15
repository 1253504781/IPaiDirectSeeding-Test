//
//  UserLoginMessageModel.h
//  IPaiDirectSeeding
//
//  Created by Yuwei on 17/5/12.
//  Copyright © 2017年 HZY. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface UserLoginMessageModel : JSONModel

@property(nonatomic,copy)NSString *userNo;//用户号，唯一的号，类似QQ号那种
@property(nonatomic,copy)NSString *userNickname;//用户昵称
@property(nonatomic,copy)NSString *mobileNo;//用户手机号
@property(nonatomic,copy)NSString *userImg;//头像地址
@property(nonatomic,copy)NSString *success;//是否登陆成功
@property(nonatomic,copy)NSString *userId;//用户ID
@property(nonatomic,copy)NSString *userRole;//用户角色

@end
