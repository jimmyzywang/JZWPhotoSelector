//
//  JZWAssetsGroupDataSource.h
//  JZWPhotoSelector
//
//  Created by jimmyzywang-nb on 15/1/14.
//  Copyright (c) 2015年 com.JZWang.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIImage;
@class JZWAssetsGroupDataSource;

@protocol JZWAssetsGroupDataSourceDelegate <NSObject>
-(void)JZWAssetsGroupDataSourceDataReadySuccess:(JZWAssetsGroupDataSource*)dataSource;
-(void)JZWAssetsGroupDataSourceDataReadyFail:(JZWAssetsGroupDataSource*)dataSource;
@end

@interface JZWAssetsGroupDataSource : NSObject

-(NSInteger)count;
-(UIImage*)posterImageForIndex:(NSInteger)index;
-(NSString*)groupNameForIndex:(NSInteger)index;
@property(nonatomic,weak)id<JZWAssetsGroupDataSourceDelegate> delegate;
@end
