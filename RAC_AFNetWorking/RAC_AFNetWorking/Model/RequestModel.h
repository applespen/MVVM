//
//  requestModel.h
//  RAC_AFNetWorking
//
//  Created by 孙博文 on 2018/1/5.
//  Copyright © 2018年 孙博文. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestModel : NSObject
//! 网址
@property (nonatomic, copy)NSString * url;
//! 题目
@property (nonatomic, copy)NSString * title;
//! 图片
@property (nonatomic, copy)NSString * image;

@end
