//
//  YJNetworkManager.m
//  WYNews
//
//  Created by Annabelle on 16/6/15.
//  Copyright © 2016年 annabelle. All rights reserved.
//

#import "YJNetworkManager.h"


@implementation YJNetworkManager

+ (instancetype)sharedManager {
    
    static YJNetworkManager *instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSURL *baseURL = [NSURL URLWithString:@"http://c.m.163.com/nc/article/"];
        
        instance = [[self alloc] initWithBaseURL:baseURL];
        
    });
    
    return instance;
        
}

/// 隔离 AFN 的 GET 方法
///
/// @param urlString  urlString
/// @param parameters 参数字典
/// @param completion 完成回调(json,  error)

- (void)GETRequestWithURL:(NSString *)urlString paramaters:(NSDictionary *)paramaters completion:(void (^)(id json, NSError *error))completion {
    
    [self GET:urlString parameters:paramaters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // 执行回调
        completion(responseObject, nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"网络请求出错 %@", error);
        // 执行回调
        completion(nil, error);
        
    }];
}

#pragma mark - 新闻数据 接口方法
- (void)newsListWithCategory:(NSString *)category startIndex:(NSInteger)startIdx completion:(void (^)(NSArray *, NSError *))completion {
    
    // url
    NSString *urlString = [NSString stringWithFormat:@"list/%@/%zd-20.html",category, startIdx];
    
    // 发起网络请求
    [self GETRequestWithURL:urlString paramaters:nil completion:^(NSDictionary *json, NSError *error) {
        
        NSLog(@"%@", json);
#warning TOASK 这里不理解意思
        // 取得第一个 KEY 中的数组
        NSString *key = json.keyEnumerator.nextObject;
        
        completion(json[key], error);
    }];
    
    
    
}

@end
