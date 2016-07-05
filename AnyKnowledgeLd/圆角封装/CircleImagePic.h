//
//  CircleImagePic.h
//  AnyKnowledgeLd
//
//  Created by Lv on 16/6/28.
//  Copyright © 2016年 Lv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CircleImagePic : NSObject
/**
 *  圆角封装
 *
 *  @param circleView   view
 *  @param cornerRadius cornerRadius
 */
+ (void)getCircleImage:(UIView *)circleView cornerRadius:(NSInteger)cornerRadius;

@end
