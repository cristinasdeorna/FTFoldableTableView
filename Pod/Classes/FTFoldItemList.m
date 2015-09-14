//
//  FTFoldItemList.m
//  Pods
//
//  Created by tropsci on 15/9/8.
//
//

#import "FTFoldItemList.h"
#import "FTFoldItem.h"

@interface FTFoldItemList ()

@property(nonatomic, strong)FTFoldItem *topFoldItem;
@property(nonatomic, strong)NSMutableArray *visibleFoldItems;// 所有可视的item

@end

@implementation FTFoldItemList

- (instancetype)initWithFoldItems:(NSArray *)foldItems {
    self = [super init];
    if (self) {
        self.topFoldItem = [[FTFoldItem alloc] initWithFoldIdentifier:@"TopFoldItemIdentifier" foldName:@"top item" foldOpened:true subFoldItems:foldItems];
        if (!self.topFoldItem) {
            return nil;
        }
        self.visibleFoldItems = [NSMutableArray arrayWithCapacity:foldItems.count];
        [foldItems enumerateObjectsUsingBlock:^(FTFoldItem *item, NSUInteger idx, BOOL *stop) {
            [self.visibleFoldItems addObject:item];
        }];
    }
    return self;
}

- (NSArray *)visibles {
    return self.visibleFoldItems;
}

// 打开一个接点
- (NSRange)openFoldItem:(FTFoldItem *)item {
    item.foldOpened = YES;
    if (!item.subFoldItems.count) {
        return NSMakeRange(NSNotFound, 0);
    }
    __block NSInteger itemIndex = 0;
    [self.visibleFoldItems enumerateObjectsUsingBlock:^(FTFoldItem *visibleItem, NSUInteger idx, BOOL *stop) {
        if ([visibleItem.foldIdentifier isEqualToString:item.foldIdentifier]) {
            *stop = YES;
        } else {
            itemIndex++;
        }
    }];
    NSRange range = NSMakeRange(itemIndex + 1, item.subFoldItems.count);
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:range];
    [self.visibleFoldItems insertObjects:item.subFoldItems atIndexes:indexSet];
    return range;
}

// 关闭一个节点
- (NSRange)closeFoldItem:(FTFoldItem *)item {
    item.foldOpened = NO;
    if (!item.subFoldItems.count) {
        return NSMakeRange(NSNotFound, 0);
    }
    __block NSInteger itemIndex = 0;
    [self.visibleFoldItems enumerateObjectsUsingBlock:^(FTFoldItem *visibleItem, NSUInteger idx, BOOL *stop) {
        if ([visibleItem.foldIdentifier isEqualToString:item.foldIdentifier]) {
            *stop = YES;
        } else {
            itemIndex++;
        }
    }];
    NSRange range = NSMakeRange(itemIndex + 1, item.subFoldItems.count);
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:range];
    [self.visibleFoldItems removeObjectsAtIndexes:indexSet];
    return range;
}



@end
