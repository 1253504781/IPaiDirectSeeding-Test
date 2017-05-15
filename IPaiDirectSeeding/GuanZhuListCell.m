//
//  GuanZhuListCell.m
//  IPaiDirectSeeding
//
//  Created by Yuwei on 17/5/12.
//  Copyright © 2017年 HZY. All rights reserved.
//

#import "GuanZhuListCell.h"

@interface GuanZhuListCell ()
@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *viewHightSet;

@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *viewWidthSet;



@end

@implementation GuanZhuListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    for (NSLayoutConstraint *constraint in _viewHightSet) {
        constraint.constant *= KScalenHeight;
    }
    
    for (NSLayoutConstraint *constraint in _viewWidthSet) {
        constraint.constant *= KScaleWidth;
    }
    
    self.contentLabel.font =
    self.statusLabel.font  =
    self.zhuboLabel.font   = kFont(14);

    self.fensiLabel.font   =
    self.paimingLabel.font = kFont(12);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
