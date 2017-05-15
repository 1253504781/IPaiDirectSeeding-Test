//
//  ByMailViewController.m
//  IPaiDirectSeeding
//
//  Created by Yuwei on 17/5/9.
//  Copyright © 2017年 HZY. All rights reserved.
//

#import "ByMailViewController.h"

@interface ByMailViewController ()

@end

@implementation ByMailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self.sureButton.layer setMasksToBounds:YES];
    [self.sureButton.layer setCornerRadius:5];
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
    
    
    self.title = @"修改密码";
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

@end
