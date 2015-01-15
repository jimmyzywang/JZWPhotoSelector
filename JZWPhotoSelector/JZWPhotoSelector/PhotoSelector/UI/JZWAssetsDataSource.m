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

@implementation JZWAssetsDataSource{
  NSArray* assetsArray_;
  JZWAssetGroup* group_;
}

-(instancetype)initWithAssetsGroup:(JZWAssetGroup*)group{
  if (self = [super init]) {
    group_ = group;
  }
  return self;
}

-(NSInteger)count{
  return [assetsArray_ count];
}

-(void)loadAssets{
  [group_ enumerateAssetsUsingBlock:^(BOOL finish, NSArray *assets) {
    if (finish) {
      assetsArray_ = [assets copy];
      [_delegate JZWAssetsDataSourceDidLoadAssetsSuccess:self];
    }
  }];
}

-(UIImage*)thumbnailAtIndex:(NSInteger)index{
  JZWAsset* asset = [assetsArray_ objectAtIndex:index];
  return [asset thumnNail];
}



@end
