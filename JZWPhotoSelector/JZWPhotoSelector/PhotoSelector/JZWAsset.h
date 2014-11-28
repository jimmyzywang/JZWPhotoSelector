//
//  JZWAsset.h
//  JZWPhotoSelector
//
//  Created by jimmyzywang-nb on 14/11/28.
//  Copyright (c) 2014年 com.JZWang.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ALAsset;
@class UIImage;

@interface JZWAsset : NSObject

-(instancetype)initWithALAsset:(ALAsset*)alasset;
-(UIImage*)thumnNail;
-(UIImage*)fullscreenImage;
@end
