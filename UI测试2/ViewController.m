//
//  ViewController.m
//  UI测试2
//
//  Created by LiTianYang on 2017/7/19.
//  Copyright © 2017年 LiTianYang. All rights reserved.
//

#import "ViewController.h"
#import "KCStatus.h"
#import "KCStatusTableViewCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    NSMutableArray *_status;
}
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化数据
    [self initData];
    
    //创建一个分组样式的UITableView
    _tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
//    NSLog(@"_tableView frame:%@========_tableView bounds:%@",NSStringFromCGRect(_tableView.frame),NSStringFromCGRect(_tableView.bounds));
//    NSLog(@"self.view frame:%@========self.view bounds:%@",NSStringFromCGRect(self.view.frame),NSStringFromCGRect(self.view.bounds));
    
    //设置数据源，注意必须实现对应的UITableViewDataSource协议
    _tableView.dataSource=self;
    //设置代理
    _tableView.delegate=self;
    
    [self.view addSubview:_tableView];
}

#pragma mark 加载数据
-(void)initData{
    NSString *path=[[NSBundle mainBundle] pathForResource:@"Property List" ofType:@"plist"];
    NSArray *array=[NSArray arrayWithContentsOfFile:path];
    _status=[[NSMutableArray alloc]init];
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [_status addObject:[KCStatus statusWithDictionary:obj]];
    }];
    
}
#pragma mark - 数据源方法
#pragma mark 返回分组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

#pragma mark 返回每组行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _status.count;
}

#pragma mark返回每行的单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier=@"UITableViewCellIdentifierKey1";
    KCStatusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell){
        cell=[[KCStatusTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    //在此设置微博，以便重新布局
    KCStatus *status=_status[indexPath.row];
    cell.status=status;
    return cell;
}

#pragma mark - 代理方法
#pragma mark 重新设置单元格高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    KCStatusTableViewCell *cell = [[KCStatusTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.status=_status[indexPath.row];
    return cell.height;
}

#pragma mark 重写状态样式方法
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
@end
