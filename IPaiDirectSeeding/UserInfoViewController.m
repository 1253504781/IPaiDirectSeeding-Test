//
//  UserInfoViewController.m
//  IPaiDirectSeeding
//
//  Created by Yuwei on 17/5/11.
//  Copyright © 2017年 HZY. All rights reserved.
//

#import "UserInfoViewController.h"

@interface UserInfoViewController ()

@end

@implementation UserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self.heaimage.layer setMasksToBounds:YES];
    [self.heaimage.layer setCornerRadius:self.heaimage.bounds.size.width/2]; //设置矩圆角半径
    [self.heaimage.layer setBorderWidth:1];   //边框宽度
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 255/255.0, 255/255.0, 255/255.0, 1 });
    [self.heaimage.layer setBorderColor:colorref];//边框颜色
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.view.backgroundColor = [UIColor colorWithRed:244/255.0f green:244/255.0f blue:244/255.0f alpha:1];
    //自定义导航栏的返回按钮
    
    UIView *leftCustom = [[UIView alloc]initWithFrame:CGRectMake(20, 20, 60, 40)];
    UIImageView *imageVc = [[UIImageView alloc]initWithFrame:CGRectMake(0, 10, 21, 20)];
    imageVc.image = [UIImage imageNamed:@"icon_return_g"];
    [leftCustom addSubview:imageVc];
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 34)];
    [backBtn addTarget:self action:@selector(left:) forControlEvents:UIControlEventTouchUpInside];
    backBtn.backgroundColor = [UIColor clearColor];
    [leftCustom addSubview:backBtn];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftCustom];
    
    
    self.title = @"账户资料";
    //导航栏背景颜色
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:244/255.0f green:244/255.0f blue:244/255.0f alpha:1];
    //导航栏上的字体颜色
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:[UIFont systemFontOfSize:18]};
}


#pragma --- 返回
- (void)left:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)clickChangeImage:(id)sender {
}

- (IBAction)changeNickName:(id)sender {
}

- (IBAction)changeSex:(id)sender {
}

- (IBAction)changeDate:(id)sender {
}

- (IBAction)addQianming:(id)sender {
}

- (IBAction)clickTell:(id)sender {
}

- (IBAction)clickMail:(id)sender {
}

- (IBAction)clickDiqu:(id)sender {
}

- (IBAction)clickStreet:(id)sender {
}
@end
