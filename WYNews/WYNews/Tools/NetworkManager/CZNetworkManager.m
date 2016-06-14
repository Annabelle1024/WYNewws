//
//  CZNetworkManager.m
//  网易新闻
//
//  Created by 刘凡 on 16/6/14.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "CZNetworkManager.h"

@implementation CZNetworkManager

+ (instancetype)sharedManager {
    static CZNetworkManager *instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *baseURL = [NSURL URLWithString:@"http://c.m.163.com/nc/article/"];
        
        instance = [[self alloc] initWithBaseURL:baseURL];
        
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
    });
    
    return instance;
}

/// 隔离 AFN 的 GET 方法
///
/// @param urlString  urlString
/// @param parameters 参数字典
/// @param completion 完成回调(json,  error)
- (void)GETRequest:(NSString *)urlString parameters:(NSDictionary *)parameters completion:(void (^)(id json, NSError *error))completion {

    [self GET:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completion(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"网络请求错误 %@", error);
        
        completion(nil, error);
    }];
}

#pragma mark - 新闻数据方法
- (void)newsListWithCategory:(NSString *)category start:(NSInteger)start completion:(void (^)(NSArray *, NSError *))completion {
    
    NSString *urlString = [NSString stringWithFormat:@"list/%@/%zd-20.html", category, start];
    
    [self GETRequest:urlString parameters:nil completion:^(NSDictionary *json, NSError *error) {
       
        // 取得第一个 KEY 中的数组
        NSString *key = json.keyEnumerator.nextObject;
        
        completion(json[key], error);
    }];
}

@end
