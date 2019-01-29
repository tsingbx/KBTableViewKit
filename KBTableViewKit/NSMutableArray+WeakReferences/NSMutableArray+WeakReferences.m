//
//  NSMutableArray+WeakReferences.m
//  KBTableViewKit
//
//  Created by xulingjiao on 2019/1/29.
//  Copyright © 2019 Kuaibao. All rights reserved.
//

#import "NSMutableArray+WeakReferences.h"

@implementation NSMutableArray (WeakReferences)

+ (instancetype)mutableArrayUsingWeakReferences {
    return [self mutableArrayUsingWeakReferencesWithCapacity:0];
}

+ (instancetype)mutableArrayUsingWeakReferencesWithCapacity:(NSUInteger)capacity {
    CFArrayCallBacks callbacks = {0, NULL, NULL, CFCopyDescription, CFEqual};
    // Cast of C pointer type 'CFMutableArrayRef' (aka 'struct __CFArray *') to Objective-C pointer type 'id' requires a bridged cast
    return (id)CFBridgingRelease(CFArrayCreateMutable(0, capacity, &callbacks));
    // return (id)(CFArrayCreateMutable(0, capacity, &callbacks));
}

@end
