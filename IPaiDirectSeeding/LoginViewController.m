//
//  LoginViewController.m
//  IPaiDirectSeeding
//
//  Created by Yuwei on 17/5/8.
//  Copyright © 2017年 HZY. All rights reserved.
//

#import "LoginViewController.h"

#import "RegisterViewController.h"
#import "FirstPageViewController.h"
#import "ChangePwdViewController.h"
#import "MineViewController.h"
#import "AppDelegate.h"
#import "Global.h"


#import "MineViewController.h"

#import "NetWorkingTool.h"
#import "LCMD5Tool.h"

#import "AFNetworking.h"
#import "UserLoginMessageModel.h"





@interface LoginViewController ()<UITextFieldDelegate>

@property (nonatomic ,copy) NSString *account;
@property (nonatomic ,copy) NSString *password;

@property (nonatomic,copy) UITextField *userNameTF;
@property (nonatomic,copy) UITextField *pwdTF;

@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *ViewHightSet;

@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *viewWidthSet;
@property (weak, nonatomic) IBOutlet UILabel *loginLabel;
@property (weak, nonatomic) IBOutlet UILabel *loginDetailLabel;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _userNameTF.delegate = self;
    _pwdTF.delegate = self;
    [self setUp];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}


#pragma --- 搭建UI
-(void)setUp
{
    [self.loginButton.layer setMasksToBounds:YES];
    [self.loginButton.layer setCornerRadius:3.0]; //设置矩圆角半径
    [self.loginButton.layer setBorderWidth:0.5];   //边框宽度
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 0/255.0, 181/255.0, 137/255.0, 1 });
    [self.loginButton.layer setBorderColor:colorref];//边框颜色
    
    
    [self.buttomView.layer setMasksToBounds:YES];
    [self.buttomView.layer setCornerRadius:5];
    [self.buttomView.layer setBorderWidth:1];
    CGColorSpaceRef color = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorrefview = CGColorCreate(color,(CGFloat[]){ 217/255.0, 217/255.0, 217/255.0, 1 });
    [self.buttomView.layer setBorderColor:colorrefview];
    
    //名字输入框
//    _userNameTF = [[UITextField alloc]initWithFrame:CGRectMake(10, 0, self.buttomView.bounds.size.width , self.buttomView.bounds.size.height/2 - 1)];
//    _userNameTF.placeholder = @"您的手机号";
//    _userNameTF.tag = 101;
//    [self.buttomView addSubview:_userNameTF];
//    
//    //分割线
//    UILabel *line1 = [[UILabel alloc]initWithFrame:CGRectMake(0, _userNameTF.bounds.size.height , self.buttomView.bounds.size.width, 1)];
//    line1.backgroundColor = [UIColor colorWithRed:220/255 green:117/255 blue:90/255 alpha:0.1];
//    [self.buttomView addSubview:line1];
//    
//    
//    //验证码输入框
//     _pwdTF = [[UITextField alloc]initWithFrame:CGRectMake(10 * KScaleWidth, (_userNameTF.bounds.size.height + 1) * KScalenHeight , self.buttomView.bounds.size.width, self.buttomView.bounds.size.height/2)];
//    _pwdTF.placeholder = @"登陆密码";
//    _pwdTF.tag = 102;
//    [self.buttomView addSubview:_pwdTF];
    
    for (NSLayoutConstraint *constraint in _ViewHightSet) {
        constraint.constant *= KScalenHeight;
    }
    
    for (NSLayoutConstraint *constraint in _viewWidthSet) {
        constraint.constant *= KScaleWidth;
    }

    _loginLabel.font = [UIFont systemFontOfSize:25 * KScalenHeight];
    _loginDetailLabel.font = [UIFont systemFontOfSize:14 * KScalenHeight];
}



#pragma ----textField的代理方法

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    if (_userNameTF == textField) {
        textField.keyboardType = UIKeyboardTypeNumberPad;
    }else if (_pwdTF == textField){
        textField.keyboardType = UIKeyboardTypeNumberPad;
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (_userNameTF == textField) {
        _account = _userNameTF.text;
    }else if (_pwdTF == textField){
        _password = _pwdTF.text;
    }

}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_userNameTF resignFirstResponder];
    [_pwdTF resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
  
    if (_userNameTF == textField) {
        [_userNameTF resignFirstResponder];
    }else if (_pwdTF == textField){
       [_pwdTF resignFirstResponder];
    }
    return YES;
}



#pragma --- 返回按钮
- (IBAction)clickBackBtn:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}


#pragma --- 忘记密码按钮
- (IBAction)clickForgetPwd:(id)sender {
    self.hidesBottomBarWhenPushed = YES;
    ChangePwdViewController *pwdVC = [[ChangePwdViewController alloc]init];
    UINavigationController *nva = [[UINavigationController alloc]initWithRootViewController:pwdVC];
    [self presentViewController:nva animated:YES completion:^{
        
    }];
}

#pragma --- 登录按钮
- (IBAction)clickLoginBtn:(id)sender {

    _account = _userNameTF.text;
    _password = _pwdTF.text;
    [self loginClick:_account password:_password];

}

#pragma  --- 去注册页
- (IBAction)goRegisterBtn:(id)sender {
    RegisterViewController *registerVC = [[RegisterViewController alloc]init];
    [self presentViewController:registerVC animated:YES completion:^{
        
    }];
}


- (void)loginClick:(NSString *)account password:(NSString *)password{
    
    
    //mobileNo userPwd
    NSLog(@"%@------%@",account,password);
    NSString *pwdStr = [LCMD5Tool MD5ForLower32Bate:password];
    NSLog(@"小写32位:%@", pwdStr);
    
    NSString *url = @"login.do";
    
    [NetWorkingTool PostNetWorking:url params:@{@"mobileNo":account,@"userPwd":pwdStr} Success:^(id responseObject) {
        NSString *utf8String = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSError* error;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:&error];
        SSLog(@"\n********************request_login.do_Completed**********************\n%@\n%@\nerror=%@ \n***************************************************************",utf8String,dic,error);
        
        if(dic && !error){
            if ([dic[@"success"] integerValue] == 0) {//如果登陆成功，跳转到首页
               
                NSString *nickname = dic[@"data"][@"userNickname"];
                NSString *userImage = dic[@"data"][@"userImg"];
                NSString *userRole = dic[@"data"][@"userRole"];
                NSString *success = dic[@"success"];
                
//                NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//                [userDefaults setObject:nickname forKey:@"userNickname"];
//                [userDefaults setObject:userImage forKey:@"userImg"];
//                [userDefaults setObject:userRole forKey:@"userRole"];
//                [userDefaults setObject:success forKey:@"success"];
//                [userDefaults synchronize];
//                NSLog(@"--------UserDefault:%@",[userDefaults objectForKey:@"success"]);
                
                [self clickBackBtn:self];
                
            }else{
                simpleAlertView(@"登陆失败");
            }
        }

    } Failed:^(NSError *error) {
        [self loginFailed];
        NSLog(@"+++++++++++++++++%@++++++++++++++++",error);
    }];
}


- (void)loginFailed{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"登录失败" message:@"请检查网络后重试！" preferredStyle:UIAlertControllerStyleAlert];
    __weak typeof (self)weak_self = self;
    UIAlertAction *resetAction = [UIAlertAction actionWithTitle:@"重试" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [weak_self loginClick:_account password:_password];
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {}];
    [alertController addAction:resetAction];
    [alertController addAction:cancelAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}


@end
