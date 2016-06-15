//
//  AppDelegate.m
//  WYNews
//
//  Created by Annabelle on 16/6/14.
//  Copyright © 2016年 annabelle. All rights reserved.
//

#import "AppDelegate.h"
#import <AFNetworkActivityIndicatorManager.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
//    sleep(4);
    [self setupAppearance];
    
    // 设置网络加载指示器
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    
    _window = [[UIWindow alloc] init];
    _window.backgroundColor = [UIColor whiteColor];
    
    Class cls = NSClassFromString(@"WYNewsListViewController");
    NSAssert(cls != nil, @"传入类名错误");
    
    UIViewController *vc = [[cls alloc] init];
        
    _window.rootViewController = vc;
    
    [_window makeKeyAndVisible];
    
    
    return YES;
}

- (void)setupAppearance {
    
    [UITabBar appearance].tintColor = [UIColor yj_colorWithHex:0xDF0000];
}

@end
