//
//  UserInfoViewController.h
//  IPaiDirectSeeding
//
//  Created by Yuwei on 17/5/11.
//  Copyright © 2017年 HZY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserInfoViewController : UIViewController


@property (weak, nonatomic) IBOutlet UIImageView *heaimage;//头像

@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;//昵称
@property (weak, nonatomic) IBOutlet UILabel *sexLabel;//性别
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;//日期
@property (weak, nonatomic) IBOutlet UILabel *qianMingLabel;//签名
@property (weak, nonatomic) IBOutlet UILabel *tellLabel;//电话号码
@property (weak, nonatomic) IBOutlet UILabel *mailLabel;//邮箱
@property (weak, nonatomic) IBOutlet UILabel *diQuLabel;//所在地区
@property (weak, nonatomic) IBOutlet UILabel *streetLabel;//所在街道


- (IBAction)clickChangeImage:(id)sender;//修改头像

- (IBAction)changeNickName:(id)sender;//修改昵称
- (IBAction)changeSex:(id)sender;//修改性别

- (IBAction)changeDate:(id)sender;//修改日期

- (IBAction)addQianming:(id)sender;//添加签名

- (IBAction)clickTell:(id)sender;//添加电话
- (IBAction)clickMail:(id)sender;//添加邮箱
- (IBAction)clickDiqu:(id)sender;//添加地区

- (IBAction)clickStreet:(id)sender;//添加街道


@end
