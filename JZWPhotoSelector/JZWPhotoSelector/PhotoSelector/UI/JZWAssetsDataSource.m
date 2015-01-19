//
//  JZWAssetsDataSource.m
//  JZWPhotoSelector
//
//  Created by jimmyzywang-nb on 15/1/15.
//  Copyright (c) 2015年 com.JZWang.com. All rights reserved.
//

#import "JZWAssetsDataSource.h"
#import "JZWAssetGroup.h"
#import "JZWAsset.h"
#import "JZWAssetsTableViewController.h"

@implementation JZWAssetsDataSource{
  NSArray* assetsArray_;
  NSMutableArray* selectAssetsArray_;
  JZWAssetGroup* group_;
}

-(instancetype)initWithAssetsGroup:(JZWAssetGroup*)group{
  if (self = [super init]) {
    group_ = group;
    selectAssetsArray_ = [NSMutableArray array];
  }
  return self;
}

-(NSInteger)assetsCount{
  return [assetsArray_ count];
}

-(NSInteger)cellCount{
  return [assetsArray_ count] / kThumbnailInCell;
}

-(void)loadAssets{
  [group_ enumerateAssetsUsingBlock:^(BOOL finish, NSArray *assets) {
    if (finish) {
      assetsArray_ = [assets copy];
      [_delegate JZWAssetsDataSourceDidLoadAssetsSuccess:self];
    }
  }];
}

-(JZWAsset*)assetAtIndex:(NSInteger)index{
  return [assetsArray_ objectAtIndex:index];
}

-(NSArray*)selectedAssets{
  return selectAssetsArray_;
}

-(void)selectOrDeselectAsset:(JZWAsset*)asset{
  if (![selectAssetsArray_ containsObject:asset]) {
    [selectAssetsArray_ addObject:asset];
  }else{
    [selectAssetsArray_ removeObject:asset];
  }
}



@end
