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
#import "JZWAsset.h"

@implementation JZWAssetGroup{
  ALAssetsGroup* _alAssetGroup;
  NSArray* _assetsArray;
}

-(instancetype)initWithAlAssetsGroup:(ALAssetsGroup *)alAssetsGroup{
  if (self = [super init]) {
    _alAssetGroup = alAssetsGroup;
    _assetsArray = [[NSArray alloc] init];
  }
  return self;
}

-(UIImage*)posterImage{
  return [[UIImage alloc] initWithCGImage:[_alAssetGroup posterImage]];
}

-(NSInteger)alAssetsCount{
  return [_alAssetGroup numberOfAssets];
}

-(NSString*)displayName{
  return [_alAssetGroup valueForProperty:ALAssetsGroupPropertyName];
}

-(NSString*)persistentID{
  return [_alAssetGroup valueForProperty:ALAssetsGroupPropertyPersistentID];
}

-(void)enumerateAssetsUsingBlock:(enumerateBlock)block{
  NSMutableArray* array = [NSMutableArray array];
  [_alAssetGroup enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
    if (result) {
      JZWAsset* jzAsset = [[JZWAsset alloc] initWithALAsset:result];
      [array addObject:jzAsset];
    }else{
      _assetsArray = [array copy];
    }
  }];
}


-(NSString*)description{
  return [NSString stringWithFormat:@"JZWAssetGroup %p displayName = %@, pID = %@, count = %ld",self, [self displayName],[self persistentID],[self alAssetsCount]];
}

@end
