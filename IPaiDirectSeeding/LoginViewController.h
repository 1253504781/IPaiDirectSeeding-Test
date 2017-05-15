//
//  LoginViewController.h
//  IPaiDirectSeeding
//
//  Created by Yuwei on 17/5/8.
//  Copyright © 2017年 HZY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserInfoModel.h"

@interface LoginViewController : UIViewController

@property (nonatomic,strong) UserInfoModel *userModel;

@property (nonatomic,assign)BOOL isLogin;//是否登录

@property (weak, nonatomic) IBOutlet UIView *buttomView;

@property (weak, nonatomic) IBOutlet UIButton *loginButton;

- (IBAction)clickBackBtn:(id)sender;//返回

- (IBAction)clickForgetPwd:(id)sender;//忘记密码

- (IBAction)clickLoginBtn:(id)sender;
- (IBAction)goRegisterBtn:(id)sender;


- (void)loginClick:(NSString *)account password:(NSString *)password;

@end
