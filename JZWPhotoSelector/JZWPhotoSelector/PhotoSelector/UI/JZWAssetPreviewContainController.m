//
//  JZWAssetPreviewContainController.m
//  JZWPhotoSelector
//
//  Created by jimmyzywang-nb on 15/1/19.
//  Copyright (c) 2015年 com.JZWang.com. All rights reserved.
//

#import "JZWAssetPreviewContainController.h"
#import "JZWAsset.h"

@implementation JZWAssetPreviewContainController{
  UIImageView* previewImage_;
}

-(void)viewDidLoad{
  previewImage_ = [[UIImageView alloc] init];
  [self.view addSubview:previewImage_];
  [self.view setNeedsLayout];
}

-(void)setAsset:(JZWAsset *)asset{
  _asset = asset;
  previewImage_.image = [asset fullscreenImage];
  [self.view setNeedsLayout];
}

-(void)viewDidLayoutSubviews{
  [super viewDidLayoutSubviews];
  if (previewImage_.frame.origin.x == 0 && !CGSizeEqualToSize(self.view.bounds.size, CGSizeZero)) {
    previewImage_.frame = CGRectMake((self.view.bounds.size.width - previewImage_.bounds.size.width)/2, (self.view.bounds.size.height - previewImage_.bounds.size.height)/2, previewImage_.bounds.size.width, previewImage_.bounds.size.height);
  }
}

@end
