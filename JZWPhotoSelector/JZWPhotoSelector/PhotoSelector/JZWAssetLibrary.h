//
//  JZWAssetLibrary.h
//  JZWPhotoSelector
//
//  Created by jimmyzywang-nb on 14/11/28.
//  Copyright (c) 2014年 com.JZWang.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JZWAssetDefine.h"

typedef void(^enumerateAssetGroupsBlock)(BOOL success, NSArray* assetGroups);

@interface JZWAssetLibrary : NSObject

-(JZWAssetLibrary*)sharedInstance;
-(void)enumerateAssetGroupsWithType:(JZWAssetGroupType)type UsingBlock:(enumerateAssetGroupsBlock)block;

@end
