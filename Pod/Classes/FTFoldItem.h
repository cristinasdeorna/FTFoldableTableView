//
//  FoldItem.h
//  Pods
//
//  Created by tropsci on 15/9/8.
//
//

#import <Foundation/Foundation.h>

@interface FTFoldItem : NSObject

@property(nonatomic, assign)BOOL foldOpened;
@property(nonatomic, copy)NSString *foldIdentifier;
@property(nonatomic, strong)NSMutableArray *subFoldItems;
@property(nonatomic, copy)NSString *foldName;

- (instancetype)initWithFoldIdentifier:(NSString *)identifier foldName:(NSString *)foldName foldOpened:(BOOL)foldOpened subFoldItems:(NSArray *)foldItems;

- (instancetype)initWithFoldIdentifier:(NSString *)identifier foldName:(NSString *)foldName;

- (NSInteger)foldLevel;

@end
