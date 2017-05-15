//
//  GuanZhuListCell.h
//  IPaiDirectSeeding
//
//  Created by Yuwei on 17/5/12.
//  Copyright © 2017年 HZY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GuanZhuListCell : UITableViewCell



@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UILabel *zhuboLabel;

@property (weak, nonatomic) IBOutlet UILabel *paimingLabel;

@property (weak, nonatomic) IBOutlet UILabel *fensiLabel;


@end
