//
//  JZWThumbnailView.m
//  JZWPhotoSelector
//
//  Created by jimmyzywang-nb on 15/1/19.
//  Copyright (c) 2015年 com.JZWang.com. All rights reserved.
//

#import "JZWThumbnailView.h"
#import "JZWAsset.h"

@implementation JZWThumbnailView{
  UIImageView* selectImageView_;
  JZWAsset* asset_;
}

-(void)setAsset:(JZWAsset*)asset{
  asset_ = asset;
  self.image = [asset thumnNail];
}

-(instancetype)initWithFrame:(CGRect)frame{
  if (self = [super initWithFrame:frame]) {
    //UIImageView默认是NO
    self.userInteractionEnabled = YES;
    selectImageView_ = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"check_box_highlight"]];
    selectImageView_.frame = CGRectMake(0, 0, selectImageView_.bounds.size.width, selectImageView_.bounds.size.height);
    UILongPressGestureRecognizer* longPressGR = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(p_onLongPressThumbnailView:)];
    [self addGestureRecognizer:longPressGR];
    UITapGestureRecognizer* tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(p_onTapPressThumbnailView:)];
    [self addGestureRecognizer:tapGR];
  }
  return self;
}

-(void)p_selectOrDeselect{
  [_delegate JZWThumbnailView:self DidSelectOrDeselectAsset:asset_];
  if (selectImageView_.superview) {
    [selectImageView_ removeFromSuperview];
  }else{
    [self addSubview:selectImageView_];
  }
}

-(void)p_onLongPressThumbnailView:(UIGestureRecognizer*)gr{
  [_delegate JZWThumbnailView:self DidLongPressAsset:asset_];
}


-(void)p_onTapPressThumbnailView:(UIGestureRecognizer*)gr{
  [self p_selectOrDeselect];
}

-(void)layoutSubviews{
  [super layoutSubviews];
  if (selectImageView_.frame.origin.x == 0 && self.bounds.size.width != 0) {
    selectImageView_.frame = CGRectMake(self.bounds.size.width - selectImageView_.bounds.size.width, self.bounds.size.height - selectImageView_.bounds.size.height, selectImageView_.bounds.size.width, selectImageView_.bounds.size.height);
  }
}



@end
