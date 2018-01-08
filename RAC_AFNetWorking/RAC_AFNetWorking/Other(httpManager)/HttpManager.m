//
//  HttpManager.m
//  RAC_AFNetWorking
//
//  Created by 孙博文 on 2018/1/8.
//  Copyright © 2018年 孙博文. All rights reserved.
//

#import "HttpManager.h"

@implementation HttpManager

SingletonM(HttpManager)


-(NSURLSessionDataTask *)sendRequestWithDic:(NSDictionary *)infoDic opt:(NSString *)opt shortURL:(NSString *)url setSuccessBlock:(void(^)(NSDictionary * responseDic))success_block setFailBlock:(void (^)(id obj))fail_block
{
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    NSString * urlStr = [NSString stringWithFormat:@"%@%@",BASE_URL,url];
    
     NSURLSessionDataTask  * task = nil;

    if ([opt isEqualToString:OPT_POST]) {
        
        task = [[AFHTTPSessionManager manager] POST:urlStr parameters:infoDic progress:^(NSProgress * _Nonnull uploadProgress) {
           
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                                      NSDictionary * getDic;
                                      if ([responseObject isKindOfClass:[NSDictionary class]]) {
                                          getDic = (NSDictionary *)responseObject;
                                      }else {
                                          return ;
                                      }
            
                                      NSLog(@"__HTTPClient__Success__:%@",getDic);
            
                                      if (success_block) {
                                          success_block(getDic);
                                      }
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                                      if (fail_block) {
                                          fail_block(error);
                                          NSLog(@"__HTTPClient__Failure__:%@",error.localizedDescription);
                                      }
        }];
        

    }
    else if ([opt isEqualToString:OPT_GET])
    {
        task = [[AFHTTPSessionManager manager] GET:urlStr parameters:infoDic progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                                     NSDictionary * getDic;
                                     if ([responseObject isKindOfClass:[NSDictionary class]]) {
                                         getDic = (NSDictionary *)responseObject;
                                     }else {
                                         return ;
                                     }
                                     NSLog(@"__HTTPClient__Success__:%@",getDic);
            
                                     if (success_block) {
                                         success_block(getDic);
                                     }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (fail_block) {
                                             fail_block(error);
                                             NSLog(@"__HTTPClient__Failure__:%@",error);
                                         }
                                         [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        }];
                

    }
    return task;
}

@end
