//
//  JZWAssetsTableViewCell.m
//  JZWPhotoSelector
//
//  Created by jimmyzywang-nb on 15/1/15.
//  Copyright (c) 2015年 com.JZWang.com. All rights reserved.
//

#import "JZWAssetsTableViewCell.h"
#import "JZWAssetsTableViewController.h"

@implementation JZWAssetsTableViewCell{
  NSArray* imageViewArray_;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
  if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
    NSMutableArray* array = [[NSMutableArray alloc] init];
    for (int index = 0; index < kThumbnailInCell; index++) {
      UIImageView* imageView = [[UIImageView alloc] init];
      imageView.tag = index;
      UITapGestureRecognizer* tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(p_onThumbnailTap:)];
      [imageView addGestureRecognizer:tapGR];
      [array addObject:imageView];
    }
    imageViewArray_ = array;
  }
  return self;
}

-(void)setImagesArray:(NSArray *)imageArray{
  NSAssert([imageViewArray_ count] == [imageArray count], @"count mismatch");
  for (int index = 0; index < [imageViewArray_ count]; index++) {
    UIImageView* imageView = [imageViewArray_ objectAtIndex:index];
    imageView.image = [imageArray objectAtIndex:index];
  }
}

-(void)p_onThumbnailTap:(UIGestureRecognizer*)gr{
  
}


@end
