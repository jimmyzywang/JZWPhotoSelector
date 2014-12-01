//
//  JZWAssetDefine.m
//  JZWPhotoSelector
//
//  Created by jimmyzywang-nb on 14/12/1.
//  Copyright (c) 2014年 com.JZWang.com. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, JZWAssetGroupContentsType){
  JZWAssetGroupAllContents,
  JZWAssetGroupPhotoContents,
  JZWAssetGroupVideoContents,
};


typedef NS_ENUM(NSInteger, JZWAssetGroupType){
  JZWALAssetsGroupLibrary,
  JZWALAssetsGroupAlbum,
  JZWALAssetsGroupEvent,
  JZWALAssetsGroupFaces,
  JZWALAssetsGroupSavedPhotos,
#if __IPHONE_5_0 <= __IPHONE_OS_VERSION_MAX_ALLOWED
  JZWALAssetsGroupPhotoStream,
#endif
  JZWALAssetsGroupAll,
};