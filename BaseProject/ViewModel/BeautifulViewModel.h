//
//  BeautifulViewModel.h
//  BaseProject
//
//  Created by tarena on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "AlbumNetManager.h"

@interface BeautifulViewModel : BaseViewModel

@property (nonatomic, assign)NSInteger rowNumber;

- (NSURL *)iconForRow:(NSInteger)row;
- (NSString *)titleForRow:(NSInteger)row;
- (void)refreshDataCompleteHandle:(void(^)(NSError *error))complete;
- (void)getMoreDataCompleteHandle:(void(^)(NSError *error))complete;

@property (nonatomic, assign)NSInteger page;

@end
