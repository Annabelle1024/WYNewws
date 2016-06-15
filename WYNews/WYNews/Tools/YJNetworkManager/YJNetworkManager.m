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
        
        NSURL *baseURL = [NSURL URLWithString:@"http://c.m.163.com/nc/"];
        
        instance = [[self alloc] initWithBaseURL:baseURL];
        
    });
    
    return instance;
        
}

@end
