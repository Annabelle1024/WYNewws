//
//  WYNewsListViewController.m
//  WYNews
//
//  Created by Annabelle on 16/6/15.
//  Copyright © 2016年 annabelle. All rights reserved.
//

#import "WYNewsListViewController.h"

static NSString *cellId = @"cellId";

@interface WYNewsListViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation WYNewsListViewController {
    
    UITableView *_tableView;
    NSString *_category;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _category = @"T1348647853363";
    
    [self loadData];
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 加载数据
- (void)loadData {
    
    [[YJNetworkManager sharedManager] newsListWithCategory:_category startIndex:0 completion:^(NSArray *array, NSError *error) {
        NSLog(@"%@", array);
        
    }];
}

#pragma mark - 设置数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 20;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    cell.textLabel.text = @(indexPath.row).description;
    
    return cell;
    
}

#pragma mark - 设置界面
- (void)setupUI {
    
    UITableView *tv = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    
    [self.view addSubview:tv];
    
    [tv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [tv registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId];
    
    tv.dataSource = self;
    tv.delegate = self;
    
    tv.estimatedRowHeight = 100;
    tv.rowHeight = UITableViewAutomaticDimension;
    
    _tableView = tv;
    
}

@end
