//
//  VideoCell.m
//  BaseProject
//
//  Created by tarena on 15/10/27.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoCell.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

@implementation VideoCell

- (UILabel *)titleLabel {
    if(_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(10);
            make.top.mas_equalTo(15);
        }];
        _titleLabel.font = [UIFont systemFontOfSize:20];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}

- (UILabel *)descLabel {
    if(_descLabel == nil) {
        _descLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_descLabel];
        [_descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.titleLabel.mas_bottom).mas_equalTo(5);
            make.left.right.mas_equalTo(10);
        }];
        _descLabel.font = [UIFont systemFontOfSize:15];
        _descLabel.textColor = [UIColor lightGrayColor];
        _descLabel.numberOfLines = 0;
    }
    return _descLabel;
}

- (UIButton *)iconButton {
    if(_iconButton == nil) {
        _iconButton = [[UIButton alloc] init];
        [self.contentView addSubview:_iconButton];
        [_iconButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.top.mas_equalTo(self.descLabel.mas_bottom).mas_equalTo(10);
        }];
        [_iconButton bk_addEventHandler:^(id sender) {
            AVPlayer *player = [AVPlayer playerWithURL:self.videoURL];
            [player play];
            [VideoCell sharedInstance].player = player;
            [sender addSubview:[VideoCell sharedInstance].view];
            [[VideoCell sharedInstance].view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.mas_equalTo(0);
            }];
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _iconButton;
}

//为了保证同一时间只有一个播放器，使用单例模式
+ (AVPlayerViewController *)sharedInstance
{
    static AVPlayerViewController *vc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc = [AVPlayerViewController new];
    });
    return vc;
}

//如果cell被复用了，需要把cell上的播放器删掉
- (void)prepareForReuse
{
    //判断当前cell是否有播放，如果有，则删除
    [super prepareForReuse];
    [[VideoCell sharedInstance].view removeFromSuperview];
    [VideoCell sharedInstance].player = nil;
}
@end











