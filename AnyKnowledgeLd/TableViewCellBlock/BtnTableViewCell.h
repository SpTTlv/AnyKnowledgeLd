//
//  BtnTableViewCell.h
//  AnyKnowledgeLd
//
//  Created by Lv on 16/6/28.
//  Copyright © 2016年 Lv. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^btnBlock)(UIButton * btn);
@interface BtnTableViewCell : UITableViewCell

@property (nonatomic, copy)btnBlock myblock;
@property (strong, nonatomic) IBOutlet UIButton *btn;

- (void)handleBtnClick:(btnBlock)myblock;




//cell上的属性
@property (strong, nonatomic) IBOutlet UILabel *label;


@end
