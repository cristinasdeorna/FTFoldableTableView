//
//  FTFoldItemList.h
//  Pods
//
//  Created by tropsci on 15/9/8.
//
//

#import <Foundation/Foundation.h>

@interface FTFoldItemList : NSObject


/**
 *  打开一个接点
 *
 *  @param item 要打开的节点
 *
 *  @return Range(要操作的节点开始，操作的item的个数)，如果是没有子节点，返回的是NSMakeRange(NSNotFound, 0)
 */
- (NSRange)openFoldItem:(FTFoldItem *)item;

@end
