//
//  DZContentCell.h
//  BaseProject
//
//  Created by tarena on 15/11/20.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZContentCell : UITableViewCell
/** content */
@property (nonatomic, strong)UILabel *contentLb;
/** 评论数标签 */
@property (nonatomic, strong)UILabel *commentLb;
/** 喜欢次数标签 */
@property (nonatomic, strong)UILabel *likeLb;

@end
