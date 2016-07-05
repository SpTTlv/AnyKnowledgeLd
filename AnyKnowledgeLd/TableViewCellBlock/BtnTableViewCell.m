//
//  BtnTableViewCell.m
//  AnyKnowledgeLd
//
//  Created by Lv on 16/6/28.
//  Copyright © 2016年 Lv. All rights reserved.
//

#import "BtnTableViewCell.h"

@implementation BtnTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)BtnClick:(UIButton *)sender {
    
    if (self.myblock) {
        self.myblock(sender);
    }
}
- (void)handleBtnClick:(btnBlock)myblock
{
    self.myblock = myblock;
}
@end
