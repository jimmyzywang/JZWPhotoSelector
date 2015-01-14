//
//  JZWAssetLibrary.m
//  JZWPhotoSelector
//
//  Created by jimmyzywang-nb on 14/11/28.
//  Copyright (c) 2014年 com.JZWang.com. All rights reserved.
//

#import "JZWAssetLibrary.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "JZWAssetsUtils.h"
#import "JZWAssetGroup.h"

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
  ALAssetsGroupType alType = [JZWAssetsUtils bridgeToALAssetsGroupContentsType:type];
  NSMutableArray* groups = [NSMutableArray array];
  [_assetsLib enumerateGroupsWithTypes:alType usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
    if (group) {
      JZWAssetGroup* jzGroup = [[JZWAssetGroup alloc] initWithAlAssetsGroup:group];
      [groups addObject:jzGroup];
    }else{
      block(YES,groups);
    }
  }
  failureBlock:^(NSError *error) {
    if (error) {
      block(NO,nil);
    }
  }];
}

@end
