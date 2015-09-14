//
//  FTFoldItemList.h
//  Pods
//
//  Created by tropsci on 15/9/8.
//
//

#import <Foundation/Foundation.h>

@class FTFoldItem;
@interface FTFoldItemList : NSObject

- (instancetype)initWithFoldItems:(NSArray *)foldItems;

/**
 *  打开一个接点
 *
 *  @param item 要打开的节点
 *
 *  @return Range(要操作的节点开始，操作的item的个数)，如果是没有子节点，返回的是NSMakeRange(NSNotFound, 0)
 */
- (NSRange)openFoldItem:(FTFoldItem *)item;


- (NSRange)closeFoldItem:(FTFoldItem *)item;

- (NSArray *)visibles;

@end
