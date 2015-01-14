//
//  JZWAssetsGroupDataSource.h
//  JZWPhotoSelector
//
//  Created by jimmyzywang-nb on 15/1/14.
//  Copyright (c) 2015年 com.JZWang.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JZWAssetsGroupDataSource : NSObject
-(UIImage*)posterImageForIndex:(NSInteger)index;
-(NSString*)groupNameForIndex:(NSInteger)index;
@end
