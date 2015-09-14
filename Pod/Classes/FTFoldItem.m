//
//  FoldItem.m
//  Pods
//
//  Created by tropsci on 15/9/8.
//
//

#import "FTFoldItem.h"

@interface FTFoldItem ()

@property(nonatomic, copy)NSString *foldName;
@property(nonatomic, strong)FTFoldItem *superFoldItem;

@property(nonatomic, strong)NSMutableDictionary *identifiderFoldItem;

@end

@implementation FTFoldItem

- (instancetype)initWithFoldIdentifier:(NSString *)identifier foldName:(NSString *)foldName foldOpened:(BOOL)foldOpened subFoldItems:(NSArray *)foldItems {
    self = [super init];
    if (self) {
        self.foldIdentifier = identifier;
        self.foldName = foldName;
        self.foldOpened = foldOpened;
        self.subFoldItems = [NSMutableArray array];

        NSMutableSet *itemIdentifiers = [NSMutableSet set];
        __block BOOL repeated = NO;
        [foldItems enumerateObjectsUsingBlock:^(FTFoldItem *item, NSUInteger idx, BOOL *stop) {
            if ([itemIdentifiers containsObject:item.foldIdentifier]) {
                *stop = YES;
                repeated = YES;
            } else {
                [itemIdentifiers addObject:item.foldIdentifier];
                item.superFoldItem = self;
                [self.subFoldItems addObject:item];
            }
        }];
        
        if (repeated) {
            return nil;
        }
    }
    return self;
}

- (instancetype)initWithFoldIdentifier:(NSString *)identifier foldName:(NSString *)foldName {
    return [self initWithFoldIdentifier:identifier foldName:foldName foldOpened:false subFoldItems:nil];
}

- (BOOL)isVisible {
    if (!self.superFoldItem) {
        return YES;
    }
    return self.superFoldItem.foldOpened;
}

- (NSInteger)foldLevel {
    if (!self.superFoldItem) {
        return 1;
    }
    return [self.superFoldItem foldLevel] + 1;
}

@end
