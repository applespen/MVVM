//
//  RequestViewModel.m
//  RAC_AFNetWorking
//
//  Created by 孙博文 on 2018/1/5.
//  Copyright © 2018年 孙博文. All rights reserved.
//

#import "RequestViewModel.h"
#import "RequestModel.h"
#import "BookTableViewCell.h"

@implementation RequestViewModel

- (instancetype)init{
    if (self = [super init]) {
        [self initialBind];
    }
    return self;
}
- (void)initialBind{
    
    _requestCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        RACSignal * signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
            parameters[@"q"] = @"基础";

            [[HttpManager sharedHttpManager] sendRequestWithDic:parameters opt:OPT_GET shortURL:@"v2/book/search" setSuccessBlock:^(NSDictionary *responseDic) {
                // 请求成功调用
                // 把数据用信号传递出去
                [subscriber sendNext:responseDic];
                [subscriber sendCompleted];
                
            } setFailBlock:^(id obj) {
                
            }];
            return nil;
        }];
     
        // 在返回数据信号时，把数据中的字典映射成模型信号，传递出去
        return [signal map:^id(NSDictionary *value) {
            NSMutableArray *dictArr = value[@"books"];
            //字典转模型，遍历字典中的所有元素，全部映射成模型，并且生成数组
            NSMutableArray *modelArr = [RequestModel mj_objectArrayWithKeyValuesArray:dictArr];
            return modelArr;
        }];
    }];
    
    // 获取请求的数据
    [_requestCommand.executionSignals.switchToLatest subscribeNext:^(NSArray *x) {
        
        // 有了新数据，刷新表格
        _dataSource = x;
        
        // 刷新表格
        [self.tableView reloadData];
        
    }];
}

#pragma mark - dataSource

// tableView 的组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// tableView 的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
// cell的数据源方法
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BookTableViewCell *cell = [BookTableViewCell cellWithTableView:tableView];
    cell.model = self.dataSource[indexPath.row];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
