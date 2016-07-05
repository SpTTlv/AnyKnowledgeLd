//
//  ViewController.m
//  AnyKnowledgeLd
//
//  Created by Lv on 16/6/23.
//  Copyright © 2016年 Lv. All rights reserved.
//

#import "ViewController.h"
#import "CircleImagePic.h"
#import "BlockManager.h"
#import "BtnTableViewCell.h"
#import "LvAFNManager.h"
#import "LvYYModel.h"
#import "YYModel.h"

@interface ViewController ()<
UITableViewDataSource,
UITableViewDelegate
>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //1.html转string
    NSString * htmlString = @"<html><body> Some html string \n <font size=\"13\" color=\"red\">This is some text!</font> </body></html>";
    NSAttributedString * attrStr = [[NSAttributedString alloc] initWithData:[htmlString dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    UILabel * myLabel = [[UILabel alloc] initWithFrame:self.view.bounds];
    myLabel.attributedText = attrStr;
    [self.view addSubview:myLabel];


    //2.除以100跟除以100.0的区别
    CGFloat devidedF = arc4random_uniform(200)/255.0;
    //没有.0出来的结果没有小数
    NSLog(@"除以 ====   %lf",devidedF);

    
    //3.圆角封装
    UIView * circleView = [UIView new];
    circleView.frame = CGRectMake(0, 0, 100, 100);
    circleView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"image"]];
    [CircleImagePic getCircleImage:circleView cornerRadius:circleView.bounds.size.width/2];
    [self.view addSubview:circleView];
    
    //4.缓存机制的圆角
    UIView * cacheImage = [UIView new];
    cacheImage.frame = CGRectMake(200, 0, 100, 100);
    cacheImage.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"image"]];
    
    cacheImage.layer.masksToBounds = YES;
    cacheImage.layer.cornerRadius = cacheImage.bounds.size.width/2;
    cacheImage.layer.shouldRasterize = YES;
    cacheImage.layer.rasterizationScale = [UIScreen mainScreen].scale;
    [self.view addSubview:cacheImage];
    
    //5.定义异常字段
//    NSString * exten = @"1";
//    NSAssert([exten isEqualToString:@"2"], @"timeLineVolumnPositionModels不能为空！");

    //6.第一种block
    
    BlockManager * blockMgr = [[BlockManager alloc] init];
    @weakify(self)
    blockMgr.myBlock = ^(NSInteger num,NSString * str){
    
        @strongify(self)
        NSLog(@"第一种 block == %ld  ==  %@",(long)num,str);
    };
    //6.1第二种block
    blockMgr.block = ^(NSString * str1,NSString * str2){
        NSLog(@"block2 ---%@  %@",str1,str2);
    };

    [blockMgr getMyblock:@"第一种string"];
     //6.3第三种block
    [BlockManager getString:@"block333" withBlock:^(NSString *str1, NSString *str2) {
        NSLog(@"block3 ==%@  == %@",str1,str2);
    }];
    
    
    //7.cell中的block
    [self initTab];
    
    //8.字符串替换
    NSString * strReplace= @"我我我 问问";
    if ([strReplace rangeOfString:@"问问"].location != NSNotFound) {
        strReplace = [strReplace stringByReplacingOccurrencesOfString:@"问问" withString:@"替换"];
    }
    NSLog(@"%@",strReplace);
    
    
    
    //9.AFN请求 ,  YYModel解析
    
    NSString * url =@"http://app.jjwxc.net/iosapi/getUserCenter";
    NSDictionary * params = @{
                        @"token":@"19722353_16e96f8198ec48a12dc799b97844fe17"
                              };
    [LvAFNManager postWithURL:url params:params progress:^(NSProgress *progress) {
        
    } success:^(id json) {
        
        LvYYModel * model= [LvYYModel yy_modelWithJSON:json];
        
        NSLog(@"message = %@   code == %@",model.message,model.code);
    } failure:^(NSError *error) {
        
    }];
    
    //10.时间戳 转成 时间
    NSString * dateStr = [self dateNumTodate:@"1437612377"];
    NSLog(@"时间是: ===   %@",dateStr);
    
    
    //11.毛玻璃效果
    UIImageView * effectImageV = [UIImageView getvisualEffectViewImage:@"xiaopingguo" alpha:0.8 initWithFrame:CGRectMake(0, 0, 100,100)];
    [self.view addSubview:effectImageV];
    
    //12. 高斯模糊
    UIImage * gsImage = [UIImage boxblurImage:[UIImage imageNamed:@"xiaopingguo"] withBlurNumber:0.3];
    UIImageView * gsImV = [[UIImageView alloc] initWithImage:gsImage];
    gsImV.contentMode = UIViewContentModeScaleAspectFill;
    gsImV.frame = CGRectMake(100, 100, 200, 200);
    [self.view addSubview:gsImV];
    

}
- (NSString *)dateNumTodate:(NSString *)string
{
    NSTimeInterval time = [string integerValue] + 28800;
    
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    NSString * currentDateStr = [formatter stringFromDate:date];
    return currentDateStr;

    

}
- (void)initTab
{
    UITableView * tab = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tab.delegate = self;
    tab.dataSource = self;
    [self.view addSubview:tab];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   static NSString * Id = @"cell";
    BtnTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:Id];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"BtnTableViewCell" owner:self options:nil] lastObject];
    }
    cell.label.text = @"测试";
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell handleBtnClick:^(UIButton *btn) {
            NSLog(@"点击的cell上的btn 的 === %ld",btn.tag);
        }];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
@end
