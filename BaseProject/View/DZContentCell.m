//
//  DZContentCell.m
//  BaseProject
//
//  Created by tarena on 15/11/20.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "DZContentCell.h"

@implementation DZContentCell
- (UILabel *)contentLb
{
    if(_contentLb == nil) {
        _contentLb = [[UILabel alloc] init];
        [self.contentView addSubview:_contentLb];
        [_contentLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
        }];
        _contentLb.numberOfLines = 0;
        _contentLb.font = [UIFont systemFontOfSize:15];
    }
    return _contentLb;
}
- (UILabel *)commentLb {
    if(_commentLb == nil) {
        _commentLb = [[UILabel alloc] init];
        [self.contentView addSubview:_commentLb];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sound_comments"]];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(20, 20));
            make.left.mas_equalTo(30);
            make.top.mas_equalTo(self.contentLb.mas_bottom).mas_equalTo(10);
            make.bottom.mas_equalTo(-10);
        }];
        [_commentLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(imageView.mas_centerY).mas_equalTo(0);
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(7);
        }];
        _commentLb.font = [UIFont systemFontOfSize:12];
        _commentLb.textColor = [UIColor lightGrayColor];
    }
    return _commentLb;
}

- (UILabel *)likeLb {
    if(_likeLb == nil) {
        _likeLb = [[UILabel alloc] init];
        [self.contentView addSubview:_likeLb];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sound_likes_n"]];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(20, 20));
            make.left.mas_equalTo(self.commentLb.mas_right).mas_equalTo(15);
            make.top.mas_equalTo(self.contentLb.mas_bottom).mas_equalTo(10);
            make.bottom.mas_equalTo(-10);
        }];
        [_likeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(imageView);
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(7);
        }];
        _likeLb.font = [UIFont systemFontOfSize:12];
        _likeLb.textColor = [UIColor lightGrayColor];
    }
    return _likeLb;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
