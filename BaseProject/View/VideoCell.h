//
//  VideoCell.h
//  BaseProject
//
//  Created by tarena on 15/10/27.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoCell : UITableViewCell
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *descLabel;
@property (strong, nonatomic)UIButton *iconButton;

@property (nonatomic, strong)NSURL *videoURL;

@end
