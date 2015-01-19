//
//  JZWAssetsTableViewCell.h
//  JZWPhotoSelector
//
//  Created by jimmyzywang-nb on 15/1/15.
//  Copyright (c) 2015年 com.JZWang.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JZWThumbnailViewDelegate;

@interface JZWAssetsTableViewCell : UITableViewCell

-(void)setAssetsArray:(NSArray*)Assets; //array是JZWAssets的array

@property (nonatomic,weak)id<JZWThumbnailViewDelegate> delegate;

@end
