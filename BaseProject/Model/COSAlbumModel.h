//
//  COSAlbumModel.h
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

/*
 "pageNum": 1,
	"pageSize": 10,
	"totalPage": 76,
	"totalRecord": 752
 */
@interface COSAlbumModel : BaseModel

@property (nonatomic, strong)NSArray *data;
@property (nonatomic, strong)NSNumber *pageNum;
@property (nonatomic, strong)NSNumber *pageSize;
@property (nonatomic, strong)NSNumber *totalPage;
@property (nonatomic, strong)NSNumber *totalRecord;

@end

/*
 "clicks": "0",
 "commentCount": "0",
 "coverHeight": "293",
 "coverUrl": "http://s1.dwstatic.com/group1/M00/DE/E1/aae0fe01f70ff92704291e5640979990.jpg",
 "coverWidth": "195",
 "created": "1425353283",
 "description": "",
 "destUrl": "http://box.dwstatic.com/unsupport.php?lolboxAction=toAlbumDetail&albumId=101139&type=beautifulWoman",
 "galleryId": "101139",
 "picsum": "17",
 "title": "这波不亏COS：这样的胸器零换五都愿意",
 "updated": "1425353284"
 */
@interface AlbumDataModel : BaseModel

@property (nonatomic, strong)NSString *clicks;
@property (nonatomic, strong)NSString *commentCount;
@property (nonatomic, strong)NSString *coverHeight;
@property (nonatomic, strong)NSString *coverUrl;
@property (nonatomic, strong)NSString *coverWidth;
@property (nonatomic, strong)NSString *created;
@property (nonatomic, strong)NSString *desc;
@property (nonatomic, strong)NSString *destUrl;
@property (nonatomic, strong)NSString *galleryId;
@property (nonatomic, strong)NSString *picsum;
@property (nonatomic, strong)NSString *title;
@property (nonatomic, strong)NSString *updated;
//@property (nonatomic, strong)NSString *modify_time;

@end


