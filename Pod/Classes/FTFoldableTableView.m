//
//  FTFoldableTableView.m
//  Pods
//
//  Created by tropsci on 15/9/8.
//
//

#import "FTFoldableTableView.h"
#import "FTFoldItemList.h"
#import "FTFoldItem.h"

NSString *const FoldableTableViewReusableID = @"foldable tableview reusable id";

@interface FTFoldableTableView ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation FTFoldableTableView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.delegate = self;
    self.dataSource = self;
    [self registerClass:[UITableViewCell class] forCellReuseIdentifier:FoldableTableViewReusableID];

}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.foldItemList visibles].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:FoldableTableViewReusableID];

    FTFoldItem *item = [self.foldItemList visibles][indexPath.row];
    cell.indentationLevel = [item foldLevel] - 1;
    
    cell.textLabel.text = item.foldName;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    FTFoldItem *item = [self.foldItemList visibles][indexPath.row];
    
    NSRange operationRange;
    if (item.foldOpened) {
        operationRange = [self.foldItemList closeFoldItem:item];
    } else {
        operationRange = [self.foldItemList openFoldItem:item];
    }
    if (operationRange.location == NSNotFound) {
        return;
    }
    NSMutableArray *indexPaths = [NSMutableArray arrayWithCapacity:operationRange.length];
    for (NSUInteger i = operationRange.location; i <= operationRange.length; i++) {
        NSIndexPath *opIndexPath = [NSIndexPath indexPathForRow:i inSection:indexPath.section];
        [indexPaths addObject:opIndexPath];
    }
    if (item.foldOpened) {
        [tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationTop];
    }
    else {
        [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationTop];
    }
}

@end
