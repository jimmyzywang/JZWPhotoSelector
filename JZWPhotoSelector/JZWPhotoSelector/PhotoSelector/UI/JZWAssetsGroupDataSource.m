//
//  JZWAssetsGroupDataSource.m
//  JZWPhotoSelector
//
//  Created by jimmyzywang-nb on 15/1/14.
//  Copyright (c) 2015年 com.JZWang.com. All rights reserved.
//

#import "JZWAssetsGroupDataSource.h"
#import "JZWPhotoSelector.h"

@implementation JZWAssetsGroupDataSource{
  NSArray* array_;
}

-(instancetype)init{
  if (self = [super init]) {
    array_ = [[NSArray alloc] init];
    [[JZWAssetLibrary sharedInstance] enumerateAssetGroupsWithType:JZWALAssetsGroupAll UsingBlock:^(BOOL success, NSArray *assetGroups) {
      if (success) {
        array_ = [assetGroups copy];
        [_delegate JZWAssetsGroupDataSourceDataReadySuccess:self];
      }else{
        [_delegate JZWAssetsGroupDataSourceDataReadyFail:self];
      }
    }];
  }
  return self;
}

-(UIImage*)posterImageForIndex:(NSInteger)index{
  JZWAssetGroup* group = [array_ objectAtIndex:index];
  return [group posterImage];
}

-(NSString*)groupNameForIndex:(NSInteger)index{
  JZWAssetGroup* group = [array_ objectAtIndex:index];
  return [group displayName];
}

-(NSInteger)count{
  return [array_ count];
}

-(JZWAssetGroup*)groupForIndex:(NSInteger)index{
  return [array_ objectAtIndex:index];
}

@end
