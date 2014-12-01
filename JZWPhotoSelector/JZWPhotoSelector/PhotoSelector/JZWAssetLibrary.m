//
//  JZWAssetLibrary.m
//  JZWPhotoSelector
//
//  Created by jimmyzywang-nb on 14/11/28.
//  Copyright (c) 2014年 com.JZWang.com. All rights reserved.
//

#import "JZWAssetLibrary.h"
#import <AssetsLibrary/AssetsLibrary.h>
@implementation JZWAssetLibrary{
  ALAssetsLibrary* _assetsLib;
}

-(JZWAssetLibrary*)sharedInstance{
  static dispatch_once_t pred;
  static JZWAssetLibrary* _library;
  dispatch_once(&pred, ^{
    _library = [[JZWAssetLibrary alloc] init];
  });
  return _library;
}

-(instancetype)init{
  if (self = [super init]) {
    _assetsLib = [[ALAssetsLibrary alloc] init];
  }
  return self;
}

-(void)enumerateAssetGroupsWithType:(JZWAssetGroupType)type UsingBlock:(enumerateAssetGroupsBlock)block{
}

@end
