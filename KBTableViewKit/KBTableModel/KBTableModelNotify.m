//
//  KBTableModelNotify.m
//  KBCoreFun
//
//  Created by xulingjiao on 2017/8/8.

//
#import "NSMutableArray+WeakReferences.h"
#import "KBTableModelEventListener.h"
#import "KBTableModelNotify.h"

@interface KBTableModelNotify()

@property(nonatomic, strong) NSMutableArray<id<KBTableModelEventListener>> *eventListeners;

@end

@implementation KBTableModelNotify

- (instancetype)init {
    self = [super init];
    if (self) {
        _eventListeners = [NSMutableArray mutableArrayUsingWeakReferencesWithCapacity:1];
    }
    return self;
}

- (void)addEventListener:(id<KBTableModelEventListener>)listener {
    if (listener) {
        [_eventListeners removeObject:listener];
        [_eventListeners addObject:listener];
    }
}

- (void)removeEventListener:(id<KBTableModelEventListener>)listener {
    [_eventListeners removeObject:listener];
}

- (void)notifyListeners:(KBTableModelEvent *)event {
    if ([NSThread currentThread].isMainThread) {
        [self.eventListeners enumerateObjectsUsingBlock:^(id<KBTableModelEventListener>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [obj tableModelChanged:event];
        }];
    }
    else {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.eventListeners enumerateObjectsUsingBlock:^(id<KBTableModelEventListener>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [obj tableModelChanged:event];
            }];
        });
    }
}

@end
