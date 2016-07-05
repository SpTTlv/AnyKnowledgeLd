//
//  LvAFNManager.h
//  AnyKnowledgeLd
//
//  Created by Lv on 16/6/30.
//  Copyright © 2016年 Lv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import <UIKit/UIKit.h>
@interface LvAFNManager : NSObject

+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params progress:(void (^)(NSProgress * progress))progress success:(void (^)(id json))success failure:(void (^)(NSError * error))failure;




@end
