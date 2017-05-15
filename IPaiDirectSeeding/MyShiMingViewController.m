//
//  MyShiMingViewController.m
//  IPaiDirectSeeding
//
//  Created by Yuwei on 17/5/12.
//  Copyright © 2017年 HZY. All rights reserved.
//

#import "MyShiMingViewController.h"

@interface MyShiMingViewController ()

@end

@implementation MyShiMingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.sumbitBtn.layer setMasksToBounds:YES];
    [self.sumbitBtn.layer setCornerRadius:5]; //设置矩圆角半径

}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //自定义导航栏的返回按钮
    self.view.backgroundColor = [UIColor colorWithRed:244/255.0f green:244/255.0f blue:244/255.0f alpha:1];
    
    UIView *leftCustom = [[UIView alloc]initWithFrame:CGRectMake(20, 20, 60, 40)];
    UIImageView *imageVc = [[UIImageView alloc]initWithFrame:CGRectMake(0, 10, 21, 20)];
    imageVc.image = [UIImage imageNamed:@"icon_return_g"];
    [leftCustom addSubview:imageVc];
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 34)];
    [backBtn addTarget:self action:@selector(left:) forControlEvents:UIControlEventTouchUpInside];
    backBtn.backgroundColor = [UIColor clearColor];
    [leftCustom addSubview:backBtn];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftCustom];
    
    self.title = @"实名认证";
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


//点击提交审核按钮
- (IBAction)clickSure:(id)sender {
}

@end
