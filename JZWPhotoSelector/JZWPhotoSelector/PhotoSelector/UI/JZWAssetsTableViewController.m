//
//  JZWAssetsTableViewController.m
//  JZWPhotoSelector
//
//  Created by jimmyzywang-nb on 15/1/15.
//  Copyright (c) 2015年 com.JZWang.com. All rights reserved.
//

#import "JZWAssetsTableViewController.h"
#import "JZWAssetsDataSource.h"

const size_t kThumbnailInCell = 4;

@interface JZWAssetsTableViewController () <JZWAssetsDataSourceDelegate>

@end

@implementation JZWAssetsTableViewController{
  JZWAssetsDataSource* dataSource_;
}

-(instancetype)initWithStyle:(UITableViewStyle)style{
  if (self = [super initWithStyle:style]) {
    
  }
  return self;
}

-(void)viewDidLoad{
  [super viewDidLoad];
  NSAssert(_group, @"group is nil");
  dataSource_ = [[JZWAssetsDataSource alloc] initWithAssetsGroup:_group];
  dataSource_.delegate = self;
  [dataSource_ loadAssets];
}

-(void)JZWAssetsDataSourceDidLoadAssetsSuccess:(JZWAssetsDataSource *)dataSource{
  
}





@end
