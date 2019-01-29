//
//  NSMutableArray+WeakReferences.h
//  KBTableViewKit
//
//  Created by xulingjiao on 2019/1/29.
//  Copyright © 2019 Kuaibao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (WeakReferences)

+ (instancetype)mutableArrayUsingWeakReferences;

+ (instancetype)mutableArrayUsingWeakReferencesWithCapacity:(NSUInteger)capacity;

@end

NS_ASSUME_NONNULL_END
