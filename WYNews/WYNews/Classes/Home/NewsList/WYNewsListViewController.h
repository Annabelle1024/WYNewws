//
//  WYNewsListViewController.h
//  WYNews
//
//  Created by Annabelle on 16/6/15.
//  Copyright © 2016年 annabelle. All rights reserved.
//

#import <UIKit/UIKit.h>

// 不同的 新闻页面 使用 不同的 url 来加载数据

@interface WYNewsListViewController : UIViewController

@property (nonatomic, copy) NSString *urlString;

@end
