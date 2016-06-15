//
//  WYNewsCell.m
//  WYNews
//
//  Created by Annabelle on 16/6/15.
//  Copyright © 2016年 annabelle. All rights reserved.
//

#import "WYNewsCell.h"

@implementation WYNewsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _replyCountLabel.backgroundColor = [UIColor yj_colorWithHex:0xf1f1f1];
    _replyCountLabel.layer.cornerRadius = 4;
    _replyCountLabel.layer.masksToBounds = YES;
    
//    UIView *sepLine = [[UIView alloc] init];
//    sepLine.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.8];
//    
//    [self addSubview:sepLine];
//
//    [sepLine mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.bottom.equalTo(self.contentView);
//        make.height.mas_equalTo(1 / [UIScreen mainScreen].scale);
//    }];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
