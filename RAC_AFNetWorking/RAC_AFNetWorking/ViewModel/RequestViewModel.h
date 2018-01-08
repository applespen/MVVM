//
//  RequestViewModel.h
//  RAC_AFNetWorking
//
//  Created by 孙博文 on 2018/1/5.
//  Copyright © 2018年 孙博文. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RequestViewModel : NSObject <UITableViewDataSource,UITableViewDelegate>
// 请求命令
@property (nonatomic,strong,readonly) RACCommand * requestCommand;

//模型数组
@property (nonatomic, strong, readonly) NSArray *dataSource;

// 控制器中的tableView
@property (nonatomic, weak) UITableView *tableView;

@end
