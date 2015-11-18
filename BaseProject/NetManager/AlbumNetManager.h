//
//  AlbumNetManager.h
//  BaseProject
//
//  Created by tarena on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "COSAlbumModel.h"

//http://box.dwstatic.com/apiAlbum.php?action=l&albumsTag=beautifulWoman&p=1&v=77&OSType=iOS8.2&versionName=2.1.7
@interface AlbumNetManager : BaseNetManager

+ (id)getBeautifulWomanForPage:(NSInteger)page completionHandle:(void(^)(COSAlbumModel *model, NSError *error))complete;

@end
