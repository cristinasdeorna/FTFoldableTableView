//
//  FTFoldableTableView.m
//  Pods
//
//  Created by tropsci on 15/9/8.
//
//

#import "FTFoldableTableView.h"
#import "FTFoldItemList.h"

@interface FTFoldableTableView ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong)FTFoldItemList *foldItemList;

@end

@implementation FTFoldableTableView

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *tableViewCellIdentifier = @"cell id";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableViewCellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableViewCellIdentifier];
    }
    return cell;
}

@end
