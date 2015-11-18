//
//  AlbumNetManager.m
//  BaseProject
//
//  Created by tarena on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AlbumNetManager.h"

@implementation AlbumNetManager

+ (id)getBeautifulWomanForPage:(NSInteger)page completionHandle:(void(^)(COSAlbumModel *model, NSError *error))complete
{
    //http://box.dwstatic.com/apiAlbum.php?action=l&albumsTag=beautifulWoman&p=1&v=77&OSType=iOS8.2&versionName=2.1.7
    NSString *path = @"http://box.dwstatic.com/apiAlbum.php";
    NSDictionary *params = @{@"action":@"l", @"albumsTag":@"beautifulWoman", @"p":@(page), @"v":@"77", @"OSType":@"iOS8.2", @"versionName":@"2.1.7"};
    return [self GET:path parameters:params completionHandler:^(id responseObj, NSError *error) {
        complete([COSAlbumModel objectWithKeyValues:responseObj], error);
    }];
}

@end
