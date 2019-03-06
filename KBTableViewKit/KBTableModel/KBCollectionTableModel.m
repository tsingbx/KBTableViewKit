//
//  KBCollectionTableModel.m
//  KBCoreFun
//
//  Created by xulingjiao on 2017/8/8.

//

#import "KBCollectionTableModel.h"

@interface KBCollectionTableModel()

@property (nonatomic, strong) NSMutableArray *mutableObjects;

@end

@implementation KBCollectionTableModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _mutableObjects = [NSMutableArray array];
    }
    return self;
}

- (instancetype)initWithObjects:(NSArray *)objects {
    self = [super init];
    if (self) {
        objects = (objects != nil ? objects : @[]);
        _mutableObjects = [objects mutableCopy];
    }
    return self;
}

- (instancetype)initWithObjects:(NSArray *)objects
                        keyPath:(NSString *)keyPath; {
    self = [super init];
    if (self) {
        objects = (objects != nil ? objects : @[]);
        _mutableObjects = [objects mutableCopy];
    }
    return self;
}

- (BOOL)isEmpty {
    return _mutableObjects.count <= 0;
}

- (NSInteger)numberOfSections {
    if (_mutableObjects.count)
        return 1;
    return 0;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section {
    return _mutableObjects.count;
}

- (id)objectAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < _mutableObjects.count) {
        return _mutableObjects[indexPath.row];
    }
    return nil;
}

- (NSIndexPath *)indexPathOfObject:(id)object {
    NSUInteger index = [_mutableObjects indexOfObject:object];
    if (index != NSNotFound) {
        return [NSIndexPath indexPathForRow:index
                                  inSection:0];
    }
    return nil;
}

- (NSIndexPath *)indexPathOfGroupId:(NSInteger)groupId nameId:(NSInteger)nameId {
    for (NSInteger row = 0; row < self.mutableObjects.count; ++row) {
        id entity = self.mutableObjects[row];
        id cellGroupIdValue = nil;
        id cellNameIdValue = nil;
        @try {
            cellGroupIdValue = [entity valueForKeyPath:@"cellGroupId"];
            cellNameIdValue = [entity valueForKeyPath:@"cellNameId"];
        } @catch (NSException *exception) {
            
        } @finally {
            if (cellGroupIdValue && cellNameIdValue) {
                NSString *cellGroupIdValueString = [cellGroupIdValue description];
                NSString *cellNameIdValueString = [cellNameIdValue description];
                NSInteger entityGroupId = [cellGroupIdValueString integerValue];
                NSInteger entityNameId = [cellNameIdValueString integerValue];
                if (entityGroupId == groupId && entityNameId == nameId) {
                    return [NSIndexPath indexPathForRow:row
                                              inSection:0];
                }
            }
        }
    }
    return nil;
}

- (id)firstObjectForSection:(NSInteger)section {
    if (_mutableObjects.count > 0) {
        return _mutableObjects.firstObject;
    }
    return @"";
}

- (NSArray *)sectionIndexValueForKeyPath:(NSString *)keyPath {
    if (keyPath.length <= 0)
        return _mutableObjects;
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:_mutableObjects.count];
    for (id obj in _mutableObjects) {
        id value =  [obj valueForKey:keyPath];
        if (value)
            [array addObject:value];
    }
    return array;
}

- (void)setObjects:(NSArray *)objects {
    _mutableObjects = [objects mutableCopy];
    [self notifyListeners:[KBTableModelEvent reloadData:self]];
}

- (void)addObjectsFromArray:(NSArray *)objects {
    [self notifyListeners:[KBTableModelEvent beginUpdates:self]];
    for (id obj in objects) {
        [_mutableObjects addObject:obj];
        NSInteger indexOfNewObject = [_mutableObjects indexOfObject:obj];
        [self notifyListeners:[KBTableModelEvent insertionAtRow:indexOfNewObject
                                                        section:0
                                                     tableModel:self]];
    }
    [self notifyListeners:[KBTableModelEvent endUpdates:self]];
}

- (void)addObject:(id)anObject {
    if (anObject == nil)
        return;
    [self notifyListeners:[KBTableModelEvent beginUpdates:self]];
    [_mutableObjects addObject:anObject];
    NSInteger indexOfNewObject = [_mutableObjects indexOfObject:anObject];
    [self notifyListeners:[KBTableModelEvent insertionAtRow:indexOfNewObject
                                                    section:0
                                                 tableModel:self]];
    [self notifyListeners:[KBTableModelEvent endUpdates:self]];
}

- (void)removeObject:(id)anObject {
    [self notifyListeners:[KBTableModelEvent beginUpdates:self]];
    NSUInteger indexOfObject = [_mutableObjects indexOfObject:anObject];
    if (indexOfObject != NSNotFound && indexOfObject < _mutableObjects.count) {
        [_mutableObjects removeObjectAtIndex:indexOfObject];
        [self notifyListeners:[KBTableModelEvent deletedAtRow:indexOfObject
                                                      section:0
                                                   tableModel:self]];
    }
    [self notifyListeners:[KBTableModelEvent endUpdates:self]];
}

- (void)removeObjects:(NSArray *)objects {
    if (objects <= 0)
        return;
    [self notifyListeners:[KBTableModelEvent beginUpdates:self]];
    for (id anObject in objects) {
        NSUInteger indexOfObject = [_mutableObjects indexOfObject:anObject];
        if (indexOfObject != NSNotFound && indexOfObject < _mutableObjects.count) {
            [_mutableObjects removeObjectAtIndex:indexOfObject];
            [self notifyListeners:[KBTableModelEvent deletedAtRow:indexOfObject
                                                          section:0
                                                       tableModel:self]];
        }
    }
    [self notifyListeners:[KBTableModelEvent endUpdates:self]];
}

- (void)removeObjectAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < _mutableObjects.count) {
        [self notifyListeners:[KBTableModelEvent beginUpdates:self]];
        [_mutableObjects removeObjectAtIndex:indexPath.row];
        [self notifyListeners:[KBTableModelEvent deletedAtRow:indexPath.row section:0 tableModel:self]];
        [self notifyListeners:[KBTableModelEvent endUpdates:self]];
    }
}

- (void)insertObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath {
    if (anObject == nil)
        return;
    [self notifyListeners:[KBTableModelEvent beginUpdates:self]];
    [_mutableObjects insertObject:anObject
                          atIndex:indexPath.row];
    [self notifyListeners:[KBTableModelEvent insertionAtRow:indexPath.row
                                                    section:0
                                                 tableModel:self]];
    [self notifyListeners:[KBTableModelEvent endUpdates:self]];
}

- (void)replaceObjectAtIndexPath:(NSIndexPath *)indexPath withObject:(id)anObject {
    if (indexPath.row < _mutableObjects.count) {
        [self notifyListeners:[KBTableModelEvent beginUpdates:self]];
        [_mutableObjects replaceObjectAtIndex:indexPath.row
                                   withObject:anObject];
        [self notifyListeners:[KBTableModelEvent updatedAtRow:indexPath.row
                                                      section:0
                                                   tableModel:self]];
        [self notifyListeners:[KBTableModelEvent endUpdates:self]];
    }
}

- (NSArray *)filteredArrayUsingPredicate:(NSPredicate *)predicate {
    if (predicate == nil)
        return [_mutableObjects copy];
    return [_mutableObjects filteredArrayUsingPredicate:predicate];
}

- (void)reloadData {
    [self notifyListeners:[KBTableModelEvent reloadData:self]];
}

@end
