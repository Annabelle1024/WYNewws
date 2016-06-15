//
//  WYNewsListViewController.m
//  WYNews
//
//  Created by Annabelle on 16/6/15.
//  Copyright © 2016年 annabelle. All rights reserved.
//

#import "WYNewsListViewController.h"
#import "WYNewsList.h"

static NSString *cellId = @"cellId";

@interface WYNewsListViewController () <UITableViewDataSource, UITableViewDelegate>

/// 表格视图
@property (nonatomic, weak) UITableView *tableView;
/// 新闻数据数组
@property (nonatomic, strong) NSMutableArray <WYNewsList *> *newsList;

@end

@implementation WYNewsListViewController {
    
    NSString *_category;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _category = @"T1348647853363";

#warning TOASK 这是咋的了? 不输出了?
    NSLog(@"你还能不能出来了");
    
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
        
        // 字典转模型
        NSArray *list = [NSArray yy_modelArrayWithClass:[WYNewsList class] json:array];
        
        // 设置属性 (newsList是可变数组, list是不可变数组, --> 要转换)
        self.newsList = [NSMutableArray arrayWithArray:list];
        
        // 刷新数据
        [self.tableView reloadData];
        
    }];
}

#pragma mark - 设置数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _newsList.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    // 设置模型
    
    
    cell.textLabel.text = _newsList[indexPath.row].title;
    
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
