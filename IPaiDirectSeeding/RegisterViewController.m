//
//  RegisterViewController.m
//  IPaiDirectSeeding
//
//  Created by 牧仁者 on 2017/5/7.
//  Copyright © 2017年 HZY. All rights reserved.
//

#import "RegisterViewController.h"
#import "Global.h"
#import "LoginViewController.h"
#import "UserInfoModel.h"

#import "NetWorkingTool.h"
#import "LCMD5Tool.h"


@interface RegisterViewController ()<UITextFieldDelegate>
{
    NSInteger yzmNumber;
}

@property (nonatomic,copy) UITextField *userNameTF;
@property (nonatomic,copy) UITextField *pwdTF;
@property (nonatomic,copy) UITextField *yzmTF;




@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
    
    
}


- (void)setup{
    [self.buttomView.layer setMasksToBounds:YES];
    [self.buttomView.layer setCornerRadius:5];
    [self.buttomView.layer setBorderWidth:1];
    CGColorSpaceRef color = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorrefview = CGColorCreate(color,(CGFloat[]){ 217/255.0, 217/255.0, 217/255.0, 1 });
    [self.buttomView.layer setBorderColor:colorrefview];
    
    //名字输入框
   _userNameTF = [[UITextField alloc]initWithFrame:CGRectMake(10, 0, self.buttomView.bounds.size.width - 80, self.buttomView.bounds.size.height/3 - 1)];
    _userNameTF.placeholder = @"您的手机号";
    _userNameTF.tag = 103;
    
    //获取验证码按钮
    UIButton *yzmBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.buttomView.bounds.size.width - 70, 0, 70, self.buttomView.bounds.size.height/3 - 1)];
    [yzmBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [yzmBtn addTarget:self action:@selector(getYZM) forControlEvents:UIControlEventTouchUpInside];
    yzmBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [yzmBtn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    
    //竖线
    UILabel *lineY = [[UILabel alloc]initWithFrame:CGRectMake(self.buttomView.bounds.size.width - 75, 10, 1, 30)];
    lineY.backgroundColor = [UIColor colorWithRed:220/255 green:117/255 blue:90/255 alpha:0.1];
    
    //验证码输入框
    _yzmTF  = [[UITextField alloc]initWithFrame:CGRectMake(10, _userNameTF.bounds.size.height + 1 , self.buttomView.bounds.size.width, self.buttomView.bounds.size.height/3 - 1)];
    _yzmTF.placeholder = @"收到的验证码";
    _yzmTF.tag = 104;
    //分割线1
    UILabel *line1 = [[UILabel alloc]initWithFrame:CGRectMake(0, _userNameTF.bounds.size.height + 1, self.buttomView.bounds.size.width, 1)];
    line1.backgroundColor = [UIColor colorWithRed:220/255 green:117/255 blue:90/255 alpha:0.1];
    
    //分割线2
    UILabel *line2 = [[UILabel alloc]initWithFrame:CGRectMake(0, _userNameTF.bounds.size.height*2 + 2, self.buttomView.bounds.size.width, 1)];
    line2.backgroundColor = [UIColor colorWithRed:220/255 green:117/255 blue:90/255 alpha:0.1];
    
    //密码输入框
    _pwdTF = [[UITextField alloc]initWithFrame:CGRectMake(10, _userNameTF.bounds.size.height*2 + 2, self.buttomView.bounds.size.width, self.buttomView.bounds.size.height/3 - 1)];
    _pwdTF.tag = 105;
    _pwdTF.placeholder = @"设置登录密码";
    
    
    [self.buttomView addSubview:_userNameTF];
    [self.buttomView addSubview:line1];
    [self.buttomView addSubview:_pwdTF];
    [self.buttomView addSubview:yzmBtn];
    [self.buttomView addSubview:lineY];
    [self.buttomView addSubview:line2];
    [self.buttomView addSubview:_yzmTF];
    
    //注册按钮
    
    UIButton *loginBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, KScreenHeight - 100 , KScreenWidth - 40, 45)];
    loginBtn.backgroundColor = [UIColor whiteColor];
    [loginBtn addTarget:self action:@selector(ClickSureBtn) forControlEvents:UIControlEventTouchUpInside ];
    [loginBtn setTitle:@"确认注册" forState:UIControlStateNormal];
    
    [loginBtn.layer setMasksToBounds:YES];
    [loginBtn.layer setCornerRadius:3.0]; //设置矩圆角半径
    [loginBtn.layer setBorderWidth:0.5];   //边框宽度
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 0/255.0, 181/255.0, 137/255.0, 1 });
    [loginBtn.layer setBorderColor:colorref];//边框颜色
    
    [loginBtn setTitleColor:[UIColor colorWithRed:0/255.0 green:181/255.0 blue:137/255.0 alpha:1] forState:UIControlStateNormal];
    [self.view addSubview:loginBtn];
}


#pragma ----textField的代理方法

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
   
    [_userNameTF resignFirstResponder];
    [_pwdTF resignFirstResponder];
    [_yzmTF resignFirstResponder];

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (_userNameTF == textField) {
        [_userNameTF resignFirstResponder];
    }else if (_pwdTF == textField){
        [_pwdTF resignFirstResponder];
    }else if (_yzmTF == textField){
        [_yzmTF resignFirstResponder];
    }
    
    return YES;
}


#pragma ----- getYZM ---- 请求验证码接口
//获取验证码
- (void)getYZM
{
    //sendRegisterCode.do
    NSLog(@"-------%@-----",_userNameTF.text);
    
    NSString *url = @"sendRegisterCode.do";
    if (_userNameTF.text.length == 0) {
        simpleAlertView(@"请输入您的电话号码");
    }else if (_userNameTF.text.length != 11){
        simpleAlertView(@"请输入正确的电话格式");
    }
    else{
    [NetWorkingTool PostNetWorking:url params:@{@"mobileNo":_userNameTF.text} Success:^(id responseObject) {
        NSString *utf8String = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSError* error;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:&error];
  SSLog(@"\n********************request_sendRegisterCode.do_Completed**********************\n%@\n%@\nerror=%@ \n***************************************************************",utf8String,dic,error);
    
        if(dic && !error){
            yzmNumber = [dic[@"success"] integerValue];
            SSLog(@"%ld",yzmNumber);
            //success为0，发送成功
            if (yzmNumber == -1) {
                simpleAlertView(@"验证码发送失败,请重新获取验证码");
                 
            }
        }
    } Failed:^(NSError *error) {
        NSLog(@"+++++++++++++++++%@+++++++++++++++",error);
        simpleAlertView(@"验证码发送失败,请检查网络后重试");
    }];
    }
}


#pragma --- 注册按钮
- (void)ClickSureBtn
{
    NSString *Number = _userNameTF.text;
    NSString *pwd = _pwdTF.text;
    NSString *yam = _yzmTF.text;
    
    [self RegisterClick:Number yzm:yam password:pwd];
}


#pragma ----- 注册接口

- (void)RegisterClick:(NSString *)account yzm:(NSString *)yzm password:(NSString *)password{
    
    
    //mobileNo userPwd
    NSLog(@"%@------%@------%@",account,yzm,password);
    NSString *pwdStr = [LCMD5Tool MD5ForLower32Bate:password];
    NSLog(@"小写32位:%@", pwdStr);
    
    NSString *url = @"register.do";
    
    [NetWorkingTool PostNetWorking:url params:@{@"mobileNo":account,@"userPwd":pwdStr,@"mobileCode":yzm} Success:^(id responseObject) {
        NSString *utf8String = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSError* error;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:&error];
        SSLog(@"\n********************request_register.do_Completed**********************\n%@\n%@\nerror=%@ \n***************************************************************",utf8String,dic,error);
        
        if(dic && !error){
            if ([dic[@"success"] integerValue] == 0) {//注册成功
                LoginViewController *loginVC = [[LoginViewController alloc]init];
                loginVC.userModel.userNickname = dic[@"userNickname"];
                loginVC.userModel.userNo = dic[@"userNo"];
                loginVC.userModel.userImg = dic[@"userImg"];
                loginVC.userModel.mobileNo = dic[@"mobileNo"];
                [self.navigationController pushViewController:loginVC animated:YES];
            }else{
                simpleAlertView(@"注册失败，请重试");
            }
        }

    } Failed:^(NSError *error) {
        NSLog(@"+++++++++++++++++%@+++++++++++++++",error);
        [self loginFailed];
    }];
}



- (void)loginFailed{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"注册失败" message:@"请检查网络后重试！" preferredStyle:UIAlertControllerStyleAlert];
    //__weak typeof (self)weak_self = self;
    UIAlertAction *resetAction = [UIAlertAction actionWithTitle:@"重试" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {}];
    [alertController addAction:resetAction];
    [alertController addAction:cancelAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}


//返回按钮
- (IBAction)clickBackBtn:(id)sender {

    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
@end
