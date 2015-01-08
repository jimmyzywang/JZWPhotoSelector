//
//  JZWAssetsUtils.m
//  JZWPhotoSelector
//
//  Created by jimmyzywang-nb on 14/12/1.
//  Copyright (c) 2014年 com.JZWang.com. All rights reserved.
//

#import "JZWAssetsUtils.h"

@implementation JZWAssetsUtils

+(JZWAssetGroupType)bridgeToJZWAssetGroupContentsType:(ALAssetsGroupType)alAssetGroupType{
  switch (alAssetGroupType) {
    case ALAssetsGroupLibrary:  // The Library group that includes all assets.
      return JZWALAssetsGroupLibrary;
    case ALAssetsGroupAlbum:
      return JZWALAssetsGroupAlbum;
    case ALAssetsGroupAll:
      return JZWALAssetsGroupAll;
    case ALAssetsGroupEvent:
      return JZWALAssetsGroupEvent;
    case ALAssetsGroupFaces:
      return JZWALAssetsGroupFaces;
    case ALAssetsGroupSavedPhotos:
      return JZWALAssetsGroupSavedPhotos;
#if __IPHONE_5_0 <= __IPHONE_OS_VERSION_MAX_ALLOWED
    case ALAssetsGroupPhotoStream:
      return JZWALAssetsGroupPhotoStream;
#endif
    default:
      return JZWALAssetsGroupAll;
  }
}

@end