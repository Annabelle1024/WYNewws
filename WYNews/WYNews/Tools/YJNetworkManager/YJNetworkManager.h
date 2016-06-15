//
//  YJNetworkManager.h
//  WYNews
//
//  Created by Annabelle on 16/6/15.
//  Copyright © 2016年 annabelle. All rights reserved.
//

#import <AFNetworking.h>


/// 网络管理器 - 统一管理所有网络请求
@interface YJNetworkManager : AFHTTPSessionManager

// 建立全局访问点
+ (instancetype)sharedManager;

// 接口方法
- (void)newsListWithCategory:(NSString *)category startIndex:(NSInteger)startIdx completion:(void (^)(NSArray *, NSError *))completion;

@end
