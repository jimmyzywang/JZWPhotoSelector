//
//  JZWThumbnailView.h
//  JZWPhotoSelector
//
//  Created by jimmyzywang-nb on 15/1/19.
//  Copyright (c) 2015年 com.JZWang.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/NSObjCRuntime.h>

@class JZWAsset;
@class JZWThumbnailView;

@protocol JZWThumbnailViewDelegate <NSObject>

-(void)JZWThumbnailView:(JZWThumbnailView*)view DidSelectOrDeselectAsset:(JZWAsset*)asset;
-(void)JZWThumbnailView:(JZWThumbnailView*)view DidLongPressAsset:(JZWAsset *)asset;
@end

@interface JZWThumbnailView : UIImageView

-(void)setAsset:(JZWAsset*)asset;

@property(nonatomic,weak)id<JZWThumbnailViewDelegate> delegate;

@end
