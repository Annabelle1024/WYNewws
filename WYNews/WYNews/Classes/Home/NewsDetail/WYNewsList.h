//
//  WYNewsList.h
//  WYNews
//
//  Created by Annabelle on 16/6/15.
//  Copyright © 2016年 annabelle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYNewsList : NSObject

/// 标题
@property (nonatomic, copy) NSString *title;
/// 配图地址
@property (nonatomic, copy) NSString *imgsrc;
/// 来源
@property (nonatomic, copy) NSString *source;
/// 评论数量
@property (nonatomic, assign) NSInteger replyCount;
/// 文档代号
@property (nonatomic, copy) NSString *docid;
/// 多图配图
@property (nonatomic, strong) NSArray *imgextra;



@end
