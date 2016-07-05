//
//  BlockManager.h
//  AnyKnowledgeLd
//
//  Created by Lv on 16/6/28.
//  Copyright © 2016年 Lv. All rights reserved.
//

#import <Foundation/Foundation.h>
//1.
typedef void (^MyBlock)(NSInteger ,NSString *);

@interface BlockManager : NSObject
//1.
@property (nonatomic, copy)MyBlock myBlock;
- (void)getMyblock:(NSString *)string;

//2.
@property (nonatomic, copy)void (^block)(NSString *,NSString *);

//3.
+ (void)getString:(NSString *)str withBlock:(void(^)(NSString * str1,NSString * str2))tblock;


@end
