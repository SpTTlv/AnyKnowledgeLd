//
//  CircleImagePic.m
//  AnyKnowledgeLd
//
//  Created by Lv on 16/6/28.
//  Copyright © 2016年 Lv. All rights reserved.
//

#import "CircleImagePic.h"

@implementation CircleImagePic

+ (void)getCircleImage:(UIView *)circleView cornerRadius:(NSInteger)cornerRadius
{
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:circleView.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(cornerRadius, 0)];
    CAShapeLayer * layer = [[CAShapeLayer alloc] init];
    layer.frame = circleView.bounds;
    layer.path = path.CGPath;
    circleView.layer.mask = layer;
    circleView.layer.cornerRadius = cornerRadius;
    circleView.layer.masksToBounds = YES;

}

@end
