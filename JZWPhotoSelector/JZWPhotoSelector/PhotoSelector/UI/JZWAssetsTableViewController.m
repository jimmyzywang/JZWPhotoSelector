//
//  JZWAssetsTableViewController.m
//  JZWPhotoSelector
//
//  Created by jimmyzywang-nb on 15/1/15.
//  Copyright (c) 2015年 com.JZWang.com. All rights reserved.
//

#import "JZWAssetsTableViewController.h"
#import "JZWAssetsDataSource.h"
#import "JZWAssetsTableViewCell.h"

const size_t kThumbnailInCell = 4;

@interface JZWAssetsTableViewController () <JZWAssetsDataSourceDelegate>

@end

@implementation JZWAssetsTableViewController{
  JZWAssetsDataSource* dataSource_;
  JZWAssetGroup* group_;
}

-(instancetype)initWithGroup:(JZWAssetGroup *)group{
  if (self = [super init]) {
    group_ = group;
  }
  return self;
}

-(void)viewDidLoad{
  [super viewDidLoad];
  NSAssert(group_, @"group is nil");
  dataSource_ = [[JZWAssetsDataSource alloc] initWithAssetsGroup:group_];
  dataSource_.delegate = self;
  [dataSource_ loadAssets];
  self.tableView.tableFooterView = [[UIView alloc] init];
}

-(void)JZWAssetsDataSourceDidLoadAssetsSuccess:(JZWAssetsDataSource *)dataSource{
  [self.tableView reloadData];
}

-(void)JZWAssetsDataSourceDidLoadAssetsFail:(JZWAssetsDataSource *)dataSource{
  
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  return [dataSource_ count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  static NSString* const kCellIdentifier = @"CellIdentifier";
  NSInteger cellIndex = indexPath.item;
  NSMutableArray* imageArrays = [NSMutableArray array];
  for (NSInteger imageIndex = cellIndex * kThumbnailInCell; imageIndex < kThumbnailInCell*(cellIndex + 1); imageIndex++) {
    if (imageIndex < [dataSource_ count]) {
      UIImage* image = [dataSource_ thumbnailAtIndex:imageIndex];
      [imageArrays addObject:image];
    }
  }
  
  JZWAssetsTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
  if (!cell) {
    cell = [[JZWAssetsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellIdentifier];
  }
  [cell setImagesArray:imageArrays];

  return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  return 100;
}

@end
