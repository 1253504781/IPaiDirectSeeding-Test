//
//  MyShiMingViewController.h
//  IPaiDirectSeeding
//
//  Created by Yuwei on 17/5/12.
//  Copyright © 2017年 HZY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyShiMingViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;//姓名

@property (weak, nonatomic) IBOutlet UILabel *IDNumberLabel;//身份证号

@property (weak, nonatomic) IBOutlet UILabel *shangchuanStatus;//上传状态

@property (weak, nonatomic) IBOutlet UIButton *sumbitBtn;//审核按钮

- (IBAction)clickSure:(id)sender;//点击提交审核


@end
