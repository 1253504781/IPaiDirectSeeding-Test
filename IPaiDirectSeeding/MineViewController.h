//
//  MineViewController.h
//  IPaiDirectSeeding
//
//  Created by Yuwei on 17/5/8.
//  Copyright © 2017年 HZY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MineViewController : UIViewController

@property (nonatomic,copy)NSString *isLogin;//是否登录
@property (nonatomic,copy)NSString *userRole;//用户角色

@property (weak, nonatomic) IBOutlet UIImageView *headImage;


- (IBAction)clickDetail:(id)sender;//去账户详情页

- (IBAction)clickGuanZhu:(id)sender;//关注页

- (IBAction)clickShiMing:(id)sender;//实名认证页
- (IBAction)clickQiYe:(id)sender;//企业认证页
- (IBAction)clickQianBao:(id)sender;//钱包

- (IBAction)clickSafe:(id)sender;//安全页

- (IBAction)clickSet:(id)sender;//设置页



@end
