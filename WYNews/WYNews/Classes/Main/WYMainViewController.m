//
//  WYMainViewController.m
//  WYNews
//
//  Created by Annabelle on 16/6/14.
//  Copyright © 2016年 annabelle. All rights reserved.
//

#import "WYMainViewController.h"

@interface WYMainViewController ()

@end

@implementation WYMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addAllChildViewControllers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// 添加所有控制器
- (void)addAllChildViewControllers {
    
    NSArray *array = @[
                       @{@"clsName": @"WYHomeViewController", @"title": @"新闻", @"imageName": @"news"},
                       @{@"clsName": @"UIViewController", @"title": @"阅读", @"imageName": @"reader"},
                       @{@"clsName": @"UIViewController", @"title": @"视频", @"imageName": @"media"},
                       @{@"clsName": @"UIViewController", @"title": @"话题", @"imageName": @"bar"},
                       @{@"clsName": @"UIViewController", @"title": @"我", @"imageName": @"me"},
                       ];
    
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        
        [arrayM addObject:[self addChildViewControllerWithDict:dict]];
        
    }
    
    // 设置 视图控制器
    self.viewControllers = arrayM.copy;
    
}


// 添加一个子控制器
- (UIViewController *)addChildViewControllerWithDict:(NSDictionary *)dict {
    
    NSString *clsName = dict[@"clsName"];
    Class cls = NSClassFromString(clsName);
    
    NSAssert(cls != nil, @"类名错误");
    
    UIViewController *vc = [cls new];
    
    // 设置一个导航栏按钮的 标题
    vc.title = dict[@"imageName"];
    
    // 设置一个导航栏按钮的 图像
    NSString *imageName = [NSString stringWithFormat:@"tabbar_icon_%@_normal", dict[@"imageName"]];
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    
    // 设置一个导航栏按钮的 高亮图片
    NSString *imageNameHL = [NSString stringWithFormat:@"tabbar_icon_%@_highlight", dict[@"imageName"]];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:imageNameHL] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    return [[UINavigationController alloc] initWithRootViewController:vc];
    
}

@end
