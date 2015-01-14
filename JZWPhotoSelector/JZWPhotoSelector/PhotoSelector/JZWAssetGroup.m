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

-(NSString*)displayName{
  return [_alAssetGroup valueForProperty:ALAssetsGroupPropertyName];
}

-(NSString*)persistentID{
  return [_alAssetGroup valueForProperty:ALAssetsGroupPropertyPersistentID];
}

-(void)enumerateAssetsUsingBlock:(enumerateBlock)block{
  
}

-(NSString*)description{
  return [NSString stringWithFormat:@"JZWAssetGroup %p displayName = %@, pID = %@, count = %d",self, [self displayName],[self persistentID],[self alAssetsCount]];
}
//-(JZWAssetGroupType)type{
//  return 
//}

@end
