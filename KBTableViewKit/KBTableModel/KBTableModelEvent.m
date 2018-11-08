//
//  KBTableModelEvent.m
//  KBCoreFun
//
//  Created by xulingjiao on 2017/8/8.

//

#import "KBTableModelEvent.h"

@implementation KBTableModelEvent

- (instancetype)initWithEventType:(KBTableModelEventType)eventType
                        indexPath:(NSIndexPath *)indexPath
                       tableModel:(id)tableModel {
    self = [super init];
    if (self) {
        _eventType = eventType;
        _indexPath = indexPath;
        _tableModel = tableModel;
    }
    return self;
}

- (BOOL)isEqual:(id)object {
    if (![object isKindOfClass:[self class]])
        return NO;
    return [self isEqualToEvent:object];
}

- (BOOL)isEqualToEvent:(KBTableModelEvent *)event {
    if (self.indexPath == nil)
        return _eventType == event.eventType;
    return [self.indexPath isEqual:event.indexPath] &&
    _eventType == event.eventType;
}

+ (id)insertionAtRow:(NSInteger)row section:(NSInteger)section tableModel:(id)tableModel{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
    return [[self alloc] initWithEventType:KBTableModelEventTypeInsert
                                 indexPath:indexPath
                                tableModel:tableModel];
}

+ (id)updatedAtRow:(NSInteger)row section:(NSInteger)section tableModel:(id)tableModel{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
    return [[self alloc] initWithEventType:KBTableModelEventTypeUpdate
                                 indexPath:indexPath
                                tableModel:tableModel];
}

+ (id)deletedAtRow:(NSInteger)row section:(NSInteger)section tableModel:(id)tableModel {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
    return [[self alloc] initWithEventType:KBTableModelEventTypeDelete
                                 indexPath:indexPath
                                tableModel:tableModel];
}

+ (id)reloadData:(id)tableModel {
    return [[self alloc] initWithEventType:KBTableModelEventTypeReloadData
                                 indexPath:nil
                                tableModel:tableModel];
}

+ (id)beginUpdates:(id)tableModel {
    return [[self alloc] initWithEventType:KBTableModelEventTypeBeginUpdates
                                 indexPath:nil
                                tableModel:tableModel];
}

+ (id)endUpdates:(id)tableModel {
    return [[self alloc] initWithEventType:KBTableModelEventTypeEndUpdates
                                 indexPath:nil
                                tableModel:tableModel];
}

- (NSArray *)indexPaths {
    if (_indexPath != nil)
        return @[_indexPath];
    return @[];
}

@end
