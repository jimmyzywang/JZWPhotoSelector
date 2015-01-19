//
//  JZWAssetsTableViewController.h
//  JZWPhotoSelector
//
//  Created by jimmyzywang-nb on 15/1/15.
//  Copyright (c) 2015年 com.JZWang.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/NSObjCRuntime.h>

extern const size_t kThumbnailInCell;

@class JZWAssetGroup;
@interface JZWAssetsTableViewController : UITableViewController

-(instancetype)initWithGroup:(JZWAssetGroup*)group NS_DESIGNATED_INITIALIZER;

@end
