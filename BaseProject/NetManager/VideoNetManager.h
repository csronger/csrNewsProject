//
//  VideoNetManager.h
//  BaseProject
//
//  Created by tarena on 15/10/27.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "VideoModel.h"

@interface VideoNetManager : BaseNetManager

+ (id)getVideoWithIndex:(NSInteger)index kCompletionHandle;



@end
