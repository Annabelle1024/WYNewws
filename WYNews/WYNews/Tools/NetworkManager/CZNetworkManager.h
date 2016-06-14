//
//  CZNetworkManager.h
//  网易新闻
//
//  Created by 刘凡 on 16/6/14.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

/// 网络管理器 - 统一管理所有网络请求
@interface CZNetworkManager : AFHTTPSessionManager

+ (instancetype)sharedManager;

/// 加载新闻列表
///
/// @param category   分类字符串
/// @param start      起始数字
/// @param completion 完成回调(字典数组, 错误)
- (void)newsListWithCategory:(NSString *)category start:(NSInteger)start completion:(void (^)(NSArray *array, NSError *error))completion;

@end
