//
//  ViewController.m
//  RAC_AFNetWorking
//
//  Created by 孙博文 on 2018/1/5.
//  Copyright © 2018年 孙博文. All rights reserved.
//

#import "ViewController.h"
#import "RequestViewModel.h"
#import "RequestModel.h"


@interface ViewController ()

@property (nonatomic,strong) RequestViewModel *requestViemModel;

@property (nonatomic,strong) UITableView * tableView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    
    self.requestViemModel.tableView = _tableView;
 
    // 执行请求
    [self.requestViemModel.requestCommand execute:nil];
}

#pragma mark - lazy

-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
      
        _tableView.delegate = self.requestViemModel;
        _tableView.dataSource = self.requestViemModel;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
 
    }
    return _tableView;
}

- (RequestViewModel *)requestViemModel{
    if (!_requestViemModel) {
        _requestViemModel = [[RequestViewModel alloc]init];
    }
    return _requestViemModel;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
