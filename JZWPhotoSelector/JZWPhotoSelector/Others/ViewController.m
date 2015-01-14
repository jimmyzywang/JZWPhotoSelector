//
//  ViewController.m
//  JZWGesturePass
//
//  Created by jimmyzywang-nb on 14/11/26.
//  Copyright (c) 2014年 com.JZWang.com. All rights reserved.
//
#import "ViewController.h"
#import "JZWAssetsGroupTableController.h"

@implementation ViewController{
  UIButton* _setUpPasswordButton;
  UIButton* _verifyPasswordButton;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];
  _setUpPasswordButton = [[UIButton alloc] init];
  [_setUpPasswordButton setTitle:@"Enter Albums" forState:UIControlStateNormal];
  [_setUpPasswordButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
  _setUpPasswordButton.backgroundColor = [UIColor colorWithRed:53.0/255.0 green:139.0/255.0 blue:210.0/255.0 alpha:1];
  _setUpPasswordButton.layer.cornerRadius = 3;
  [_setUpPasswordButton addTarget:self action:@selector(p_onEnterAlbums:) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:_setUpPasswordButton];
  
  _verifyPasswordButton = [[UIButton alloc] init];
  [_verifyPasswordButton setTitle:@"Verify the gesture password" forState:UIControlStateNormal];
  [_verifyPasswordButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
  _verifyPasswordButton.backgroundColor = [UIColor colorWithRed:53.0/255.0 green:139.0/255.0 blue:210.0/255.0 alpha:1];
  _verifyPasswordButton.layer.cornerRadius = 3;
  [_verifyPasswordButton addTarget:self action:@selector(p_onVerifyPasswordClicked:) forControlEvents:UIControlEventTouchUpInside];
//  [self.view addSubview:_verifyPasswordButton];
}

-(void)viewWillLayoutSubviews{
  [super viewWillLayoutSubviews];
  
  [_setUpPasswordButton sizeToFit];
  _setUpPasswordButton.frame = CGRectInset(_setUpPasswordButton.frame, -10, 0);
  _setUpPasswordButton.frame = CGRectMake((self.view.bounds.size.width - _setUpPasswordButton.bounds.size.width)/2, 200, _setUpPasswordButton.bounds.size.width, _setUpPasswordButton.bounds.size.height);
  [_verifyPasswordButton sizeToFit];
  _verifyPasswordButton.frame = CGRectInset(_verifyPasswordButton.frame, -10, 0);
  _verifyPasswordButton.frame = CGRectMake((self.view.bounds.size.width - _verifyPasswordButton.bounds.size.width)/2, CGRectGetMaxY(_setUpPasswordButton.frame) + 40, _verifyPasswordButton.bounds.size.width, _verifyPasswordButton.bounds.size.height);
}

-(void)p_onEnterAlbums:(id)sender{
  JZWAssetsGroupTableController* assetsTableVC = [[JZWAssetsGroupTableController alloc] init];
  [self.navigationController pushViewController:assetsTableVC animated:YES];
}

-(void)p_onVerifyPasswordClicked:(id)sender{
}


@end
