//
//  JZWAssetGroup.h
//  JZWPhotoSelector
//
//  Created by jimmyzywang-nb on 14/11/28.
//  Copyright (c) 2014年 com.JZWang.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JZWAssetDefine.h"

@class ALAssetsGroup;
@class UIImage;
@class JZWAsset;

typedef void(^enumerateBlock)(BOOL finish,NSArray* assets);

@interface JZWAssetGroup : NSObject

-(instancetype)initWithAlAssetsGroup:(ALAssetsGroup*)alAssetsGroup;
-(NSString*)persistentID;
-(NSString*)displayName;
-(NSInteger)alAssetsCount;
-(UIImage*)posterImage;
-(void)enumerateAssetsUsingBlock:(enumerateBlock)block;
//-(JZWAssetGroupType)type;


@end
