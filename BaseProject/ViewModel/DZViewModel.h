//
//  DZViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/20.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "CSRNewsNetManager.h"

@interface DZViewModel : BaseViewModel

@property (nonatomic, assign)NSInteger rowNumber;


/** 返回某行的图片 */
- (NSURL *)thumbNailForRow:(NSInteger)row;
/** 返回某行的评论数 */
- (NSString *)commentsAllForRow:(NSInteger)row;
/** 返回某行喜欢数 */
- (NSString *)likesForRow:(NSInteger)row;
/** 返回某行的文本 */
- (NSString *)contentForRow:(NSInteger)row;

/** 某行是否有图片 */
- (BOOL)hasImageForRow:(NSInteger)row;
/** 某行的跳转页面 */
- (NSURL *)commentsUrlForRow:(NSInteger)row;

@property (nonatomic, assign)NSInteger pageID;
@end
