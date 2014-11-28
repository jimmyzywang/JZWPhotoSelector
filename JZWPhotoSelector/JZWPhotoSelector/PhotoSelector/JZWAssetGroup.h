//
//  JZWAssetGroup.h
//  JZWPhotoSelector
//
//  Created by jimmyzywang-nb on 14/11/28.
//  Copyright (c) 2014年 com.JZWang.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ALAssetsGroup;
@class UIImage;
@class JZWAsset;

typedef NS_ENUM(NSInteger, JZWAssetGroupType){
  JZWAssetGroupPhoto,
  JZWAssetGroupVideo
};

typedef void(^enumerateBlock)(BOOL finish,NSArray* assets);

@interface JZWAssetGroup : NSObject

-(instancetype)initWithAlAssetsGroup:(ALAssetsGroup*)alAssetsGroup;
-(NSString*)persistentID;
-(NSString*)displayName;
-(NSInteger)alAssetsCount;
-(UIImage*)posterImage;
-(void)enumerateAlassetsUsingBlock:(enumerateBlock)block;
//-(JZWAssetGroupType)type;


@end
