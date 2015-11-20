//
//  DZViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/20.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "DZViewModel.h"

@implementation DZViewModel

- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    self.dataTask = [CSRNewsNetManager getNewsInfoWithType:InfoTypeDuanZi page:_pageID completionHandle:^(CSRNewsTypeModel *model, NSError *error) {
        if (_pageID == 1) {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr  addObjectsFromArray:model.body];
        completionHandle(error);
    }];
}
- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle
{
    _pageID = 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}
- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle
{
    _pageID += 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}

- (NSInteger)rowNumber
{
    return self.dataArr.count;
}
- (CSRNewsTypeBodyModel *)modelForRow:(NSInteger)row
{
   // NSLog(@"dataarr count:%ld", self.dataArr.count);
    return self.dataArr[row];
}
/** 返回某行的图片 */
- (NSURL *)thumbNailForRow:(NSInteger)row
{
    return [NSURL URLWithString:[self modelForRow:row].thumbnail];
}
/** 返回某行的评论数 */
- (NSString *)commentsAllForRow:(NSInteger)row
{
    return [NSString stringWithFormat:@"%ld", [self modelForRow:row].commentsall];
}
/** 返回某行喜欢数 */
- (NSString *)likesForRow:(NSInteger)row
{
    return [NSString stringWithFormat:@"%ld", [self modelForRow:row]
            .likes];
}
/** 返回某行的文本 */
- (NSString *)contentForRow:(NSInteger)row
{
    return [self modelForRow:row].content;
}

/* 某行是否有图片*/
- (BOOL)hasImageForRow:(NSInteger)row
{
    NSLog(@"count:%ld", [self modelForRow:row].img.count);
    return [self modelForRow:row].img.count;
}

/** 某行的跳转页面 */
- (NSURL *)commentsUrlForRow:(NSInteger)row
{
    return [NSURL URLWithString:[self modelForRow:row].commentsUrl];
}
@end
