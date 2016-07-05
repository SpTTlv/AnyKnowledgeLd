//
//  LvAFNManager.m
//  AnyKnowledgeLd
//
//  Created by Lv on 16/6/30.
//  Copyright © 2016年 Lv. All rights reserved.
//

#import "LvAFNManager.h"

@implementation LvAFNManager

+ (AFHTTPSessionManager *)manager
{
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval= 5;
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    return manager;
}

+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params progress:(void (^)(NSProgress *))progress success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    AFHTTPSessionManager * manager = [self manager];
    [manager POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        if (progress) {
            progress(uploadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
    
}

@end
