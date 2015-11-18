//
//  COSAlbumModel.m
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "COSAlbumModel.h"

@implementation COSAlbumModel
//特殊规定  data对应的值，由特殊类解析
+ (NSDictionary *)objectClassInArray
{
    return @{@"data":[AlbumDataModel class]};
}

@end

@implementation AlbumDataModel

//通过字典返回，特殊的属性名
+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"desc":@"description"};
}

@end