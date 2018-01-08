//
//  BookTableViewCell.h
//  RAC_AFNetWorking
//
//  Created by 孙博文 on 2018/1/8.
//  Copyright © 2018年 孙博文. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RequestModel;

@interface BookTableViewCell : UITableViewCell

@property (nonatomic,strong) RequestModel * model;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
