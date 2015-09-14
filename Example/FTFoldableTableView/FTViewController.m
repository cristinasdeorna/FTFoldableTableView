//
//  FTViewController.m
//  FTFoldableTableView
//
//  Created by liuwin7 on 09/08/2015.
//  Copyright (c) 2015 liuwin7. All rights reserved.
//

#import "FTViewController.h"
#import <FTFoldableTableView/FTFoldableTableView.h>
#import <FTFoldableTableView/FTFoldItemList.h>
#import <FTFoldableTableView/FTFoldItem.h>

@interface FTViewController ()

@property (weak, nonatomic) IBOutlet FTFoldableTableView *tableView;

@end

@implementation FTViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    FTFoldItem *openItem = [[FTFoldItem alloc] initWithFoldIdentifier:@"open_fold" foldName:@"打开"];
    FTFoldItem *fileItem = [[FTFoldItem alloc] initWithFoldIdentifier:@"name_fold" foldName:@"文件" foldOpened:NO subFoldItems:@[openItem]];
    self.tableView.foldItemList = [[FTFoldItemList alloc] initWithFoldItems:@[fileItem]];
}

@end
