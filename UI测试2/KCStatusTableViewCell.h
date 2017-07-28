//
//  KCStatusTableViewCell.h
//  UI测试2
//
//  Created by LiTianYang on 2017/7/19.
//  Copyright © 2017年 LiTianYang. All rights reserved.
//

#import <UIKit/UIKit.h>


@class KCStatus;

@interface KCStatusTableViewCell : UITableViewCell

#pragma mark 微博对象
@property (nonatomic,strong) KCStatus *status;

#pragma mark 单元格高度
@property (assign,nonatomic) CGFloat height;

@end
