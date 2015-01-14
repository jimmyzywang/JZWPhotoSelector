//
//  JZWAssetsGroupTableController.m
//  JZWPhotoSelector
//
//  Created by jimmyzywang-nb on 15/1/14.
//  Copyright (c) 2015年 com.JZWang.com. All rights reserved.
//

#import "JZWAssetsGroupTableController.h"
#import "JZWAssetsGroupDataSource.h"

@implementation JZWAssetsGroupTableController{
  JZWAssetsGroupDataSource* dataSource_;
}

-(instancetype)initWithStyle:(UITableViewStyle)style{
  if (self = [super initWithStyle:style]) {
    
  }
  return self;
}

-(void)viewDidLoad{
  [super viewDidLoad];
  self.tableView.separatorColor = [UIColor clearColor];
  self.tableView.tableFooterView = [[UIView alloc] init];
  dataSource_ = [[JZWAssetsGroupDataSource alloc] init];
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  static NSString* const cellIdentifier = @"cellIdentifier";
  UITableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
  if (!cell) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
  }
  cell.imageView = dataSource_
  return cell;
}


@end
