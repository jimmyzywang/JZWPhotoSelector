//
//  JZWAssetsUtils.h
//  JZWPhotoSelector
//
//  Created by jimmyzywang-nb on 14/12/1.
//  Copyright (c) 2014年 com.JZWang.com. All rights reserved.
//

#import "JZWAssetDefine.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface JZWAssetsUtils : NSObject{
}

+(JZWAssetGroupType)bridgeToJZWAssetGroupContentsType:(ALAssetsGroupType)alAssetGroupType;

@end
