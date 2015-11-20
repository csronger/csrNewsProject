//
//  CSRNewsNetManager.h
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "CSRNewsModel.h"
#import "CSRNewsTypeModel.h"

typedef NS_ENUM(NSUInteger, InfoType)
{
    InfoTypeTouTiao,//头条
    InfoTypeYuLe,//娱乐
    InfoTypeLiShi,//历史
    InfoTypeKeJi,//科技
    InfoTypeWenHua,//文化
    InfoTypeDuanZi,//段子
};

@interface CSRNewsNetManager : BaseNetManager
+ (id)getNewsInfoWithType:(InfoType)type  page:(NSInteger)pageID kCompletionHandle;
@end
