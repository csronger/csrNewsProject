//
//  VideoModel.m
//  BaseProject
//
//  Created by tarena on 15/10/27.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoModel.h"

@implementation VideoModel

+ (NSDictionary *)objectClassInArray
{
    return @{@"videoSidList":[VideoVideoListModel class], @"videoList":[VideoVideoListModel class]};
}

@end

@implementation VideoVideoListModel
//因为服务器传入串的key是description，系统关键词，我们属性无法命名为系统关键词，只能改为desc，改动后需要通知MJExtension
//mp4Url  m3u8HdUrl  mp4HdUrl  m3u8Url
+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"desc":@"description",
             @"mp4Url":@"mp4_url",
             @"mp4HdUrl":@"mp4Hd_url",
             @"m3u8Url":@"m3u8_url",
             @"m3u8HdUrl":@"m3u8Hd_url"
             };
}
//快捷的把例如 m3u8_url  转为 m3u8Url
/*下放代码需要服务器人员，代码规范十分严谨，可以参考多玩直播游戏列表*/
//命名：单词小写，以_间隔
//+ (NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName
//{
//    //loveYou--> love_you
//    //m3u8HdUrl-->m3u8_hd_url
//    return [propertyName underlineFromCamel];
//}
@end


@implementation VideoVideoSidListModel


@end



















