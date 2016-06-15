//
//  WYNewsListViewController.m
//  WYNews
//
//  Created by Annabelle on 16/6/15.
//  Copyright © 2016年 annabelle. All rights reserved.
//

#import "WYNewsListViewController.h"
#import "WYNewsList.h"
#import "WYNewsCell.h"


static NSString *normalCellId = @"normalCellId";
static NSString *imageSetCellId = @"imageSetCellId";

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

#pragma mark - 设置代理 UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];

#warning TODO 跳转控制器
    // 跳转控制器
}

#pragma mark - 设置数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _newsList.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 获取模型
    WYNewsList *model = _newsList[indexPath.row];
    
    NSString *cellId;
    
    if (model.imgextra.count > 0) {
        cellId = imageSetCellId;
    } else {
        cellId = normalCellId;
    }
    
    WYNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    // 设置数据
    cell.titleLabel.text = model.title;
    cell.sourceLabel.text = model.source;
    cell.replyCountLabel.text = @(model.replyCount).description;
    
    // 设置图片
    NSURL *iconURL = [NSURL URLWithString:model.imgsrc];
    [cell.iconView sd_setImageWithURL:iconURL];
    
    // 设置多图图片
    if (model.imgextra != nil) {
        
        NSInteger index = 0;
        
        for (NSDictionary *dict in model.imgextra) {
            
            NSString *urlString = dict[@"imgsrc"];
            NSURL *url = [NSURL URLWithString:urlString];
            
            [cell.imageSetView[index] sd_setImageWithURL:url];
            
            index ++;
        }
        
    }
    
    return cell;
    
}

#pragma mark - 设置界面
- (void)setupUI {
    
    UITableView *tv = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    
    [self.view addSubview:tv];
    
    [tv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    // [tv registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId];
    [tv registerNib:[UINib nibWithNibName:@"WYNewsNormalCell" bundle:nil] forCellReuseIdentifier:normalCellId];
    [tv registerNib:[UINib nibWithNibName:@"WYNewsImageSetCell" bundle:nil] forCellReuseIdentifier:imageSetCellId];
    
    
    tv.dataSource = self;
    tv.delegate = self;
    
    tv.estimatedRowHeight = 100;
    tv.rowHeight = UITableViewAutomaticDimension;
    
    tv.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    _tableView = tv;
    
}

@end
