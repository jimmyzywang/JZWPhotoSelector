//
//  JZWAssetsTableViewCell.m
//  JZWPhotoSelector
//
//  Created by jimmyzywang-nb on 15/1/15.
//  Copyright (c) 2015年 com.JZWang.com. All rights reserved.
//

#import "JZWAssetsTableViewCell.h"
#import "JZWAssetsTableViewController.h"
#import "JZWThumbnailView.h"

@implementation JZWAssetsTableViewCell{
  NSArray* imageViewArray_;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
  if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
    NSMutableArray* array = [[NSMutableArray alloc] init];
    for (int index = 0; index < kThumbnailInCell; index++) {
      JZWThumbnailView* thumbnailView = [[JZWThumbnailView alloc] init];
      [array addObject:thumbnailView];
      [self addSubview:thumbnailView];
    }
    imageViewArray_ = array;
  }
  return self;
}

-(void)setAssetsArray:(NSArray*)Assets{
  for (int index = 0; index < [Assets count]; index++) {
    JZWThumbnailView* thumbnailView = [imageViewArray_ objectAtIndex:index];
    thumbnailView.delegate = _delegate;
    [thumbnailView setAsset:[Assets objectAtIndex:index]];
  }
}

-(void)layoutSubviews{
  [super layoutSubviews];
  for (NSInteger index = 0;index < [imageViewArray_ count];index++) {
    UIImageView* imageView = [imageViewArray_ objectAtIndex:index];
    imageView.frame = CGRectMake(index * (self.bounds.size.width / kThumbnailInCell), 0,(self.bounds.size.width / kThumbnailInCell), self.bounds.size.height);
  }
}


@end
