//
//  DZCell.h
//  BaseProject
//
//  Created by tarena on 15/11/20.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"
#import "DZViewModel.h"

@interface DZCell : UITableViewCell
/** 图片 */
@property (nonatomic, strong)TRImageView *iconIV;

/** 评论数标签 */
@property (nonatomic, strong)UILabel *commentLb;
/** 喜欢次数标签 */
@property (nonatomic, strong)UILabel *likeLb;


@end
