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
#import "JZWAsset.h"
#import "JZWThumbnailView.h"

const size_t kThumbnailInCell = 4;

@interface JZWAssetsTableViewController () <JZWAssetsDataSourceDelegate,JZWThumbnailViewDelegate>

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
  self.tableView.separatorColor = [UIColor clearColor];
  self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(p_onCompleteButtonClicked:)];
  [self.navigationItem.rightBarButtonItem setEnabled:NO];
}

#pragma mark JZWThumbnailViewDelegate Begin

-(void)JZWAssetsDataSourceDidLoadAssetsSuccess:(JZWAssetsDataSource *)dataSource{
  [self.tableView reloadData];
}

-(void)JZWAssetsDataSourceDidLoadAssetsFail:(JZWAssetsDataSource *)dataSource{
  
}

#pragma mark JZWThumbnailViewDelegate End
#pragma mark JZWThumbnailViewDelegate Begin


-(void)JZWThumbnailView:(JZWThumbnailView *)view DidLongPressAsset:(JZWAsset *)asset{

}

-(void)JZWThumbnailView:(JZWThumbnailView *)view DidSelectOrDeselectAsset:(JZWAsset *)asset{
  [dataSource_ selectOrDeselectAsset:asset];
  [self p_updateNavigationTitle];
}

#pragma mark JZWThumbnailViewDelegate End
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  return [dataSource_ count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  static NSString* const kCellIdentifier = @"CellIdentifier";
  NSInteger cellIndex = indexPath.item;
  NSMutableArray* assets = [NSMutableArray array];
  for (NSInteger assetsIndex = cellIndex * kThumbnailInCell; assetsIndex < kThumbnailInCell*(cellIndex + 1); assetsIndex++) {
    if (assetsIndex < [dataSource_ count]) {
      JZWAsset* asset = [dataSource_ assetAtIndex:assetsIndex];
      [assets addObject:asset];
    }
  }
  
  JZWAssetsTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
  if (!cell) {
    cell = [[JZWAssetsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellIdentifier];
  }
  cell.delegate = self;
  [cell setAssetsArray:assets];
  cell.selectionStyle = UITableViewCellSelectionStyleNone;
  return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  return 100;
}

#pragma mark Private Methods Begin

-(void)p_updateNavigationTitle{
  if ([[dataSource_ selectedAssets] count]) {
    [self.navigationItem.rightBarButtonItem setEnabled:YES];
    self.navigationItem.rightBarButtonItem.title = [NSString stringWithFormat:@"完成(%d)",[[dataSource_ selectedAssets] count]];
  }else{
    [self.navigationItem.rightBarButtonItem setEnabled:NO];
    self.navigationItem.rightBarButtonItem.title = @"完成";
  }
}

-(void)p_onCompleteButtonClicked:(id)sender{
  
}

#pragma mark Private Methods End



@end
