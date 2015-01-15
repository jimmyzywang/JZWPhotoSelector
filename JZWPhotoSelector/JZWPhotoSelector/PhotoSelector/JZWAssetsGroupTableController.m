//
//  JZWAssetsGroupTableController.m
//  JZWPhotoSelector
//
//  Created by jimmyzywang-nb on 15/1/14.
//  Copyright (c) 2015年 com.JZWang.com. All rights reserved.
//

#import "JZWAssetsGroupTableController.h"
#import "JZWAssetsGroupDataSource.h"
#import "JZWAssetsTableViewController.h"

@interface JZWAssetsGroupTableController () <JZWAssetsGroupDataSourceDelegate>

@end


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
  self.tableView.tableFooterView = [[UIView alloc] init];
  dataSource_ = [[JZWAssetsGroupDataSource alloc] init];
  dataSource_.delegate = self;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  return 110;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  return [dataSource_ count];
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  static NSString* const cellIdentifier = @"cellIdentifier";
  UITableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
  if (!cell) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
  }
  cell.imageView.image = [dataSource_ posterImageForIndex:indexPath.item];
  cell.textLabel.text = [dataSource_ groupNameForIndex:indexPath.item];
  return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  JZWAssetGroup* group = [dataSource_ groupForIndex:indexPath.row];
  JZWAssetsTableViewController* vc = [[JZWAssetsTableViewController alloc] initWithGroup:group];
  [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark JZWAssetsGroupDataSourceDelegate Begin

-(void)JZWAssetsGroupDataSourceDataReadyFail:(JZWAssetsGroupDataSource *)dataSource{
  
}


-(void)JZWAssetsGroupDataSourceDataReadySuccess:(JZWAssetsGroupDataSource *)dataSource{
  [self.tableView reloadData];
}


#pragma mark JZWAssetsGroupDataSourceDelegate End

@end
