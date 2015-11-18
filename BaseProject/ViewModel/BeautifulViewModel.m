//
//  BeautifulViewModel.m
//  BaseProject
//
//  Created by tarena on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BeautifulViewModel.h"

@implementation BeautifulViewModel


- (NSInteger)rowNumber
{
    return self.dataArr.count;
}

- (NSURL *)iconForRow:(NSInteger)row
{
    AlbumDataModel *data = self.dataArr[row];
    return  [NSURL URLWithString:data.coverUrl];
}
- (NSString *)titleForRow:(NSInteger)row
{
    AlbumDataModel *data = self.dataArr[row];
    return data.title;
}
- (void)refreshDataCompleteHandle:(void(^)(NSError *error))complete
{
    _page = 1;
    [self getDataCompleteHandle:complete];
}
- (void)getMoreDataCompleteHandle:(void(^)(NSError *error))complete
{
    _page += 1;
    [self getDataCompleteHandle:complete];
}

- (void)getDataCompleteHandle:(void(^)(NSError *error))complete
{
    [AlbumNetManager getBeautifulWomanForPage:_page completionHandle:^(COSAlbumModel *model, NSError *error) {
        if (_page == 1)
        {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:model.data];
        complete(error);
    }];
}
@end






















