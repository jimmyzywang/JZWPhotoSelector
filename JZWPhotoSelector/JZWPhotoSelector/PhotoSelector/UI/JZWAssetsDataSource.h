//
//  JZWAssetsDataSource.h
//  JZWPhotoSelector
//
//  Created by jimmyzywang-nb on 15/1/15.
//  Copyright (c) 2015年 com.JZWang.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIImage;
@class JZWAssetGroup;
@class JZWAssetsDataSource;

@protocol JZWAssetsDataSourceDelegate <NSObject>

-(void)JZWAssetsDataSourceDidLoadAssetsSuccess:(JZWAssetsDataSource*)dataSource;
-(void)JZWAssetsDataSourceDidLoadAssetsFail:(JZWAssetsDataSource*)dataSource;

@end

@interface JZWAssetsDataSource : NSObject

-(instancetype)initWithAssetsGroup:(JZWAssetGroup*)group;
-(UIImage*)thumbnailAtIndex:(NSInteger)index;
-(void)loadAssets;
-(NSInteger)count;
@property(nonatomic,weak)id<JZWAssetsDataSourceDelegate> delegate;
@end
