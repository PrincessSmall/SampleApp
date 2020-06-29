//
//  InfoViewController.m
//  SampleApp
//
//  Created by Limin on 2020/6/27.
//  Copyright © 2020 Limin. All rights reserved.
//

#import "InfoViewController.h"
#import "InfoTableViewCell.h"

@interface InfoViewController ()
<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation InfoViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"资讯";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"资讯页";
    [self.view addSubview:self.tableView];
}


#pragma UITableViewDelegate, UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row % 2 == 0) {
        InfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([InfoTableViewCell class])];//此方法用于从缓存池中找寻此id的cell，有就取出来用，没有就创建一个
        [cell setupTitleLabelInfoWithRow:indexPath.row];
//        NSLog(@"InfoTableViewCell = %p",cell);//%p，打印对象的内存地址
        return cell;
    }else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdetifier"];
        cell.textLabel.text = @"资讯内容";
//        NSLog(@"UITableViewCell = %p",cell);
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath.row % 2 == 0 ? 62 : 40;
}


#pragma lazy

- (UITableView *)tableView {//懒加载里面使用下划线成员变量，不使用self，是因为避免循环引用
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
        UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 80)];
        UILabel *footLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, (footerView.frame.size.height - 20)/2, footerView.frame.size.width, 20)];
        footLabel.text = @"点击回到顶部";
        footLabel.textAlignment = NSTextAlignmentCenter;
        [footerView addSubview:footLabel];
        footerView.backgroundColor = [UIColor greenColor];
        _tableView.tableFooterView = footerView;
        
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(scrollToTop)];
        [footerView addGestureRecognizer:gesture];
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuseIdetifier"];
        [_tableView registerClass:[InfoTableViewCell class] forCellReuseIdentifier:NSStringFromClass([InfoTableViewCell class])]; 
        
        
    }
    return _tableView;
}


/// TODO 可以实现点击滚动tableView回到顶部，需要了解滚动ScrollView的一些代理方法
- (void)scrollToTop {
    [self.tableView scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:YES];
}
@end
