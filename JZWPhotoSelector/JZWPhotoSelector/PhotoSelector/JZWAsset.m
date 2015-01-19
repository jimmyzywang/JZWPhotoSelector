//
//  JZWAsset.m
//  JZWPhotoSelector
//
//  Created by jimmyzywang-nb on 14/11/28.
//  Copyright (c) 2014年 com.JZWang.com. All rights reserved.
//

#import "JZWAsset.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <UIKit/UIKit.h>

@implementation JZWAsset{
  ALAsset* _alAsset;
}

-(instancetype)initWithALAsset:(ALAsset *)alAsset{
  if (self = [super init]) {
    _alAsset = alAsset;
  }
  return self;
}

-(UIImage*)thumnNail{
  UIImage* image = [[UIImage alloc] initWithCGImage:[_alAsset thumbnail]];
  return image;
}

-(UIImage*)fullscreenImage{
  ALAssetRepresentation* alAssetRep = [_alAsset defaultRepresentation];
  UIImage* image = [[UIImage alloc] initWithCGImage:[alAssetRep fullScreenImage]];
  return image;
}

-(NSUInteger)hash{
  return [_alAsset hash];
}


@end
