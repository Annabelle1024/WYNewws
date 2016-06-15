//
//  WYNewsCell.h
//  WYNews
//
//  Created by Annabelle on 16/6/15.
//  Copyright © 2016年 annabelle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYNewsCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;
@property (weak, nonatomic) IBOutlet UILabel *replyCountLabel;

@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imageSetView;


@property (weak, nonatomic) IBOutlet UIView *sepLineView;

@end
