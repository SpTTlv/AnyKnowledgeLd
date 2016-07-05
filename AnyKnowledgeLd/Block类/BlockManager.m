//
//  BlockManager.m
//  AnyKnowledgeLd
//
//  Created by Lv on 16/6/28.
//  Copyright © 2016年 Lv. All rights reserved.
//

#import "BlockManager.h"

@implementation BlockManager
//1.  2.
- (void)getMyblock:(NSString *)string
{
    
    string = @"第一种block";
    self.myBlock((NSInteger)2,string);
    if (_block) {
        _block(@"第二种1",@"第二种2");
    }

}
//3.
+ (void)getString:(NSString *)str withBlock:(void (^)(NSString *, NSString *))tblock
{
    tblock(@"if you",str);

}

@end
