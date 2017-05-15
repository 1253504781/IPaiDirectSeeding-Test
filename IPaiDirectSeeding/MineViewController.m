//
//  MineViewController.m
//  IPaiDirectSeeding
//
//  Created by Yuwei on 17/5/8.
//  Copyright © 2017年 HZY. All rights reserved.
//

#import "MineViewController.h"

#import "LoginViewController.h"

#import "UserInfoViewController.h"
#import "MyGuanzZhuViewController.h"
#import "MyShiMingViewController.h"
#import "MyQiyeRenZhengViewController.h"
#import "MyWalletViewController.h"
#import "MySafeViewController.h"
#import "MySetViewController.h"


@interface MineViewController ()<UINavigationControllerDelegate>

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.headImage.layer setMasksToBounds:YES];
    [self.headImage.layer setCornerRadius:self.headImage.bounds.size.width/2]; //设置矩圆角半径
    [self.headImage.layer setBorderWidth:1];   //边框宽度
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 255/255.0, 255/255.0, 255/255.0, 1 });
    [self.headImage.layer setBorderColor:colorref];//边框颜色
    
    
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    self.isLogin = [defaults objectForKey:@"success"];
//    self.userRole = [defaults objectForKey:@"userRole"];
    NSLog(@"登陆状态：%@---------登陆角色：%@",self.isLogin,self.userRole);
}



- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.delegate = self;
    self.view.backgroundColor = [UIColor colorWithRed:244/255.0f green:244/255.0f blue:244/255.0f alpha:1];
    
}


#pragma --- UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    // 判断要显示的控制器是否是自己
    BOOL isShowHomePage = [viewController isKindOfClass:[self class]];
    
    [self.navigationController setNavigationBarHidden:isShowHomePage animated:YES];
}

//个人信息
- (IBAction)clickDetail:(id)sender {
    
    if (self.isLogin != nil && [self.isLogin integerValue] == 0) {//登陆成功状态下可以查看个人信息
        if ([self.userRole integerValue] == 1) {//userRole=1，用户
            UserInfoViewController *infoVC = [[UserInfoViewController alloc]init];
            infoVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:infoVC animated:YES];
        }else//主播用户
        {
            
        }
        
    }else{//登陆不成功，则跳转到登陆页面
        LoginViewController *loginVc = [[LoginViewController alloc]init];
        [self presentViewController:loginVc animated:YES completion:^{
            
        }];
    }
}


#pragma ----- 去二级页面的点击事件
//点击关注
- (IBAction)clickGuanZhu:(id)sender {
    MyGuanzZhuViewController *guanzhuVC = [[MyGuanzZhuViewController alloc]init];
    guanzhuVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:guanzhuVC animated:YES];
}

//点击实名认证
- (IBAction)clickShiMing:(id)sender {
    MyShiMingViewController *shimingVC = [[MyShiMingViewController alloc]init];
    shimingVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:shimingVC animated:YES];
}


//点击企业认证
- (IBAction)clickQiYe:(id)sender {
    MyQiyeRenZhengViewController *qiyeVC = [[MyQiyeRenZhengViewController alloc]init];
    qiyeVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:qiyeVC animated:YES];
}


//点击钱包
- (IBAction)clickQianBao:(id)sender {
    MyWalletViewController  *walletVC = [[MyWalletViewController alloc]init];
    walletVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:walletVC animated:YES];
}

//点击安全性
- (IBAction)clickSafe:(id)sender {
    MySafeViewController *safeVC = [[MySafeViewController alloc]init];
    safeVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:safeVC animated:YES];
}

//点击设置
- (IBAction)clickSet:(id)sender {
    MySetViewController *setVC = [[MySetViewController alloc]init];
    setVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:setVC animated:YES];
}

@end
