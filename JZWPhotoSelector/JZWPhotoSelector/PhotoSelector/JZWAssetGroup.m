//
//  JZWAssetGroup.m
//  JZWPhotoSelector
//
//  Created by jimmyzywang-nb on 14/11/28.
//  Copyright (c) 2014年 com.JZWang.com. All rights reserved.
//

#import <AssetsLibrary/AssetsLibrary.h>
#import <UIKit/UIKit.h>

#import "JZWAssetGroup.h"
@implementation JZWAssetGroup{
  ALAssetsGroup* _alAssetGroup;
}

-(instancetype)initWithAlAssetsGroup:(ALAssetsGroup *)alAssetsGroup{
  if (self = [super init]) {
    _alAssetGroup = alAssetsGroup;
  }
  return self;
}

-(UIImage*)posterImage{
  return [[UIImage alloc] initWithCGImage:[_alAssetGroup posterImage]];
}

-(NSInteger)alAssetsCount{
  return [_alAssetGroup numberOfAssets];
}

-(NSString*)name{
  return [_alAssetGroup valueForProperty:ALAssetsGroupPropertyName];
}

-(NSString*)persistentID{
  return [_alAssetGroup valueForProperty:ALAssetsGroupPropertyPersistentID];
}

-(void)enumerateAlassetsUsingBlock:(enumerateBlock)block{
  
}

//-(JZWAssetGroupType)type{
//  return 
//}

@end
