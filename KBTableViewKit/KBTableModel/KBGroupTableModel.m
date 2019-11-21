//
//  KBGroupTableModel.m
//  KBCoreFun
//
//  Created by xulingjiao on 2017/8/8.

//
#import "KBRootTableCellEntity.h"
#import "KBGroupTableModel.h"

@interface KBGroupTableModel()

@property (nonatomic, strong, readonly) NSString *keyPath;

@property (nonatomic, strong) NSArray *sortDescriptors;

@property (nonatomic, strong) NSMutableArray *sortedAllSectionFisrtObjects;

@property (nonatomic, strong) NSMutableDictionary<id, NSMutableArray*>* tableModelDic;

@end

@implementation KBGroupTableModel

- (instancetype)initWithObjects:(NSArray *)objects
                        keyPath:(NSString *)keyPath
                sortDescriptors:(NSArray<NSSortDescriptor *>*)sortDescriptors {
    self = [super init];
    if (self) {
        objects = (objects == nil ? @[] : objects);
        _keyPath = keyPath;
        _sortDescriptors = sortDescriptors;
        if (_sortDescriptors.count <= 0)
            _sortDescriptors = @[[[NSSortDescriptor alloc] initWithKey:keyPath ascending:YES]];
        [self updateTableModelList:objects];
    }
    return self;
}

- (instancetype)initWithObjects:(NSArray<KBRootTableCellEntity *> *)objects
                sortDescriptors:(NSArray<NSSortDescriptor *>*)sortDescriptors {
    self = [super init];
    if (self) {
        objects = (objects == nil ? @[] : objects);
        _keyPath = @"cellGroupId";
        NSSortDescriptor *sortByCellGroupId = [[NSSortDescriptor alloc] initWithKey:@"cellGroupId"
                                                                          ascending:YES];
        NSSortDescriptor *sortByCellNameId = [[NSSortDescriptor alloc] initWithKey:@"cellNameId"
                                                                         ascending:YES];
        NSMutableArray *allSortDescriptors = [[NSMutableArray alloc] initWithCapacity:10];
        [allSortDescriptors addObjectsFromArray:@[sortByCellGroupId, sortByCellNameId]];
        if (sortDescriptors.count > 0)
            [allSortDescriptors addObjectsFromArray:sortDescriptors];
        _sortDescriptors = [allSortDescriptors copy];
        [self updateTableModelList:objects];
    }
    return self;
}

- (instancetype)initWithObjects:(NSArray<KBRootTableCellEntity *> *)objects {
    self = [super init];
    if (self) {
        objects = (objects == nil ? @[] : objects);
        _keyPath = @"cellGroupId";
        NSSortDescriptor *sortByCellGroupId = [[NSSortDescriptor alloc] initWithKey:@"cellGroupId"
                                                                          ascending:YES];
        NSSortDescriptor *sortByCellNameId = [[NSSortDescriptor alloc] initWithKey:@"cellNameId"
                                                                         ascending:YES];
        _sortDescriptors = @[sortByCellGroupId, sortByCellNameId];
        [self updateTableModelList:objects];
    }
    return self;
}

- (BOOL)isEmpty {
    return self.sortedAllSectionFisrtObjects.count <= 0;
}

- (NSMutableDictionary<id, NSMutableArray *> *)tableModelDic {
    if (_tableModelDic)
        return _tableModelDic;
    _tableModelDic = [[NSMutableDictionary alloc] init];
    return _tableModelDic;
}

- (NSMutableArray *)sortedAllSectionFisrtObjects {
    if (_sortedAllSectionFisrtObjects)
        return _sortedAllSectionFisrtObjects;
    _sortedAllSectionFisrtObjects = [NSMutableArray array];
    return _sortedAllSectionFisrtObjects;
}

- (BOOL)isNull:(id)obj {
    if (obj == nil || [obj isKindOfClass:[NSNull class]])
        return YES;
    return NO;
}

- (void)updateTableModelList:(NSArray *)list {
    @try {
        if (list.count <= 0)
            return;
        for (id obj in list) {
            if ([self isNull:obj])
                continue;
            id value = nil;
            @try {
                value = [obj valueForKeyPath:self.keyPath];
            }
            @catch(NSException *exception) {
                NSLog(@"exception:%@", exception);
            }
            @finally {
                if ([self isNull:value])
                    continue;
                NSMutableArray *find = nil;
                @try {
                    find = [self.tableModelDic objectForKey:value];
                }
                @catch(NSException *exp) {
                    NSLog(@"exp:%@", exp);
                }
                @finally {
                    if (find == nil) {
                        if (obj)
                            find = [[NSMutableArray alloc] initWithArray:@[obj]];
                        else
                            find = [[NSMutableArray alloc] initWithArray:@[]];
                        if (find) {
                            [self.tableModelDic setObject:find
                                                   forKey:value];
                            [self.sortedAllSectionFisrtObjects addObject:obj];
                        }
                    }
                    else {
                        [find addObject:obj];
                    }
                }
            }
        }
        if (self.sortDescriptors.count > 0) {
            @try {
                [self.sortedAllSectionFisrtObjects sortUsingDescriptors:self.sortDescriptors];
            }
            @catch (NSException *exception) {
                NSLog(@"exception:%@", exception);
            }
            @finally {
                NSArray<NSMutableArray *> *allValues = self.tableModelDic.allValues;
                for (NSMutableArray *array in allValues) {
                    @try {
                        [array sortedArrayUsingDescriptors:self.sortDescriptors];
                    }
                    @catch (NSException *exception) {
                        NSLog(@"exception:%@", exception);
                    }
                    @finally {
                    }
                }
            }
        }
    } @catch (NSException *exception) {
        NSLog(@"exception:%@", exception);
    } @finally {
    }
}

- (NSInteger)numberOfSections {
    return self.sortedAllSectionFisrtObjects.count;
}

- (id)valueAtSection:(NSInteger)section {
    if (section < self.sortedAllSectionFisrtObjects.count) {
        id obj = self.sortedAllSectionFisrtObjects[section];
        id value = nil;
        @try {
            value = [obj valueForKey:self.keyPath];
        }
        @catch(NSException *exception) {
            
        }
        @finally {
            return value;
        }
    }
    return nil;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section {
    id value = [self valueAtSection:section];
    if (value) {
        NSMutableArray *tableModel = self.tableModelDic[value];
        return tableModel.count;
    }
    return 0;
}

- (id)objectAtIndexPath:(NSIndexPath *)indexPath {
    id value = [self valueAtSection:indexPath.section];
    if (value) {
        NSMutableArray *tableModel = nil;
        @try {
            tableModel = self.tableModelDic[value];
        }
        @catch(NSException *exp) {
            
        }
        @finally {
            if (indexPath.row < tableModel.count)
                return [tableModel objectAtIndex:indexPath.row];
        }
    }
    return nil;
}

- (NSIndexPath *)indexPathOfGroupId:(NSInteger)groupId nameId:(NSInteger)nameId {
    for (NSInteger section = 0; section < self.sortedAllSectionFisrtObjects.count; ++section) {
        id value = [self valueAtSection:section];
        if (value) {
            NSArray *sortedObjects = self.tableModelDic[value];
            for (NSInteger row = 0; row < sortedObjects.count; ++row) {
                id entity = sortedObjects[row];
                id cellGroupIdValue = nil;
                id cellNameIdValue = nil;
                @try {
                    cellGroupIdValue = [entity valueForKeyPath:@"cellGroupId"];
                    cellNameIdValue = [entity valueForKeyPath:@"cellNameId"];
                }
                @catch(NSException *exception) {
                    
                }
                @finally {
                    if (cellGroupIdValue && cellNameIdValue) {
                        NSString *cellGroupIdValueString = [cellGroupIdValue description];
                        NSString *cellNameIdValueString = [cellNameIdValue description];
                        NSInteger entityGroupId = [cellGroupIdValueString integerValue];
                        NSInteger entityNameId = [cellNameIdValueString integerValue];
                        if (entityGroupId == groupId && entityNameId == nameId) {
                            return [NSIndexPath indexPathForRow:row
                                                      inSection:section];
                        }
                    }
                }
            }
        }
    }
    
    return nil;
}

- (NSIndexPath *)indexPathOfObject:(id)object {
    
    for (NSInteger section = 0; section < self.sortedAllSectionFisrtObjects.count; ++section) {
        id value = [self valueAtSection:section];
        if (value) {
            NSMutableArray *tableModel = self.tableModelDic[value];
            NSInteger index = [tableModel indexOfObject:object];
            if (index != NSNotFound) {
                return [NSIndexPath indexPathForRow:index
                                          inSection:section];
            }
        }
    }
    return nil;
}

- (id)firstObjectForSection:(NSInteger)section {
    id value = [self valueAtSection:section];
    if (value) {
        NSMutableArray *tableModel = self.tableModelDic[value];
        if (tableModel.count) {
            return tableModel.firstObject;
        }
    }
    return nil;
}

- (NSArray *)sectionIndexValueForKeyPath:(NSString *)keyPath {
    if (keyPath.length <= 0)
        return _sortedAllSectionFisrtObjects;
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:_sortedAllSectionFisrtObjects.count];
    for (id obj in _sortedAllSectionFisrtObjects) {
        id value =  nil;
        @try {
            value = [obj valueForKey:keyPath];
        }
        @catch(NSException *exception) {
            
        }
        @finally {
            if (value != nil)
                [array addObject:value];
        }
    }
    return array;
    
}

- (void)setObjects:(NSArray *)objects {
    objects = (objects == nil ? @[] : objects);
    _sortedAllSectionFisrtObjects = nil;
    _tableModelDic = nil;
    [self updateTableModelList:objects];
    [self notifyListeners:[KBTableModelEvent reloadData:self]];
}

- (void)addObjectsFromArray:(NSArray *)objects {
    objects = (objects == nil ? @[] : objects);
    [self updateTableModelList:objects];
    [self notifyListeners:[KBTableModelEvent reloadData:self]];
}

- (void)addObject:(id)anObject {
    if (anObject) {
        [self updateTableModelList:@[anObject]];
        [self notifyListeners:[KBTableModelEvent reloadData:self]];
    }
    else {
        [self notifyListeners:[KBTableModelEvent reloadData:self]];
    }
}

- (void)removeObject:(id)anObject {
    NSInteger section = [self.sortedAllSectionFisrtObjects indexOfObject:anObject];
    if (section != NSNotFound) {
        id value = [self valueAtSection:section];
        if (value) {
            NSMutableArray *find = [self.tableModelDic objectForKey:value];
            NSInteger index = [find indexOfObject:anObject];
            if (index != NSNotFound) {
                [find removeObject:anObject];
                @try {
                    [find sortedArrayUsingDescriptors:self.sortDescriptors];
                }
                @catch(NSException *exception) {
                    NSLog(@"exception:%@", exception);
                }
                @finally {
                    [self notifyListeners:[KBTableModelEvent reloadData:self]];
                }
            }
        }
    }
}

- (void)removeObjects:(NSArray *)objects {
    BOOL needReload = NO;
    for (id anObject in objects) {
        NSInteger section = [self.sortedAllSectionFisrtObjects indexOfObject:anObject];
        if (section != NSNotFound) {
            id value = [self valueAtSection:section];
            if (value) {
                NSMutableArray *find = [self.tableModelDic objectForKey:value];
                NSInteger index = [find indexOfObject:anObject];
                if (index != NSNotFound) {
                    [find removeObject:anObject];
                    @try {
                        [find sortedArrayUsingDescriptors:self.sortDescriptors];
                    }
                    @catch(NSException *exception) {
                        NSLog(@"exception:%@", exception);
                    }
                    @finally {
                        needReload = YES;
                    }
                }
            }
        }
    }
    if (needReload)
        [self notifyListeners:[KBTableModelEvent reloadData:self]];
}

- (void)removeObjectAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section < self.sortedAllSectionFisrtObjects.count) {
        id value = [self valueAtSection:indexPath.section];
        if (value) {
            NSMutableArray *find = [self.tableModelDic objectForKey:value];
            if (find && indexPath.row < find.count) {
                [find removeObjectAtIndex:indexPath.row];
                [self notifyListeners:[KBTableModelEvent reloadData:self]];
            }
        }
    }
}

- (void)insertObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath {
    if (anObject == nil)
        return;
    if (indexPath.section < self.sortedAllSectionFisrtObjects.count) {
        id value = [self valueAtSection:indexPath.section];
        if (value) {
            NSMutableArray *find = [self.tableModelDic objectForKey:value];
            if (find) {
                [find insertObject:anObject
                           atIndex:indexPath.row];
                @try {
                    [find sortedArrayUsingDescriptors:self.sortDescriptors];
                }
                @catch(NSException *exception) {
                    NSLog(@"exception:%@", exception);
                }
                @finally {
                    [self notifyListeners:[KBTableModelEvent reloadData:self]];
                }
            }
            else {
                find = [NSMutableArray arrayWithObject:anObject];
                [self.tableModelDic setObject:find
                                       forKey:value];
                [self.sortedAllSectionFisrtObjects addObject:anObject];
                [self notifyListeners:[KBTableModelEvent reloadData:self]];
            }
        }
    }
    else {
        id value = nil;
        @try {
            value = [anObject valueForKeyPath:self.keyPath];
        }
        @catch (NSException *exception) {
            
        }
        @finally {
            if (value) {
                NSMutableArray *find = [NSMutableArray arrayWithObject:anObject];
                [self.tableModelDic setObject:find
                                       forKey:value];
                [self.sortedAllSectionFisrtObjects addObject:anObject];
                [self notifyListeners:[KBTableModelEvent reloadData:self]];
            }
        }
    }
}

- (void)replaceObjectAtIndexPath:(NSIndexPath *)indexPath withObject:(id)anObject {
    if (anObject == nil)
        return;
    id value = [self valueAtSection:indexPath.section];
    if (value) {
        NSMutableArray *tableModel = self.tableModelDic[value];
        if (indexPath.row < tableModel.count) {
            [tableModel replaceObjectAtIndex:indexPath.row
                                  withObject:anObject];
            @try {
                [tableModel sortedArrayUsingDescriptors:self.sortDescriptors];
            }
            @catch(NSException *exception) {
                NSLog(@"exception:%@", exception);
            }
            @finally {
                [self notifyListeners:[KBTableModelEvent reloadData:self]];
            }
        }
    }
}

- (NSArray *)filteredArrayUsingPredicate:(NSPredicate *)predicate {
    NSMutableArray *sortedAllObjects = [NSMutableArray array];
    for (NSInteger section = 0; section < self.sortedAllSectionFisrtObjects.count; ++section) {
        id value = [self valueAtSection:section];
        if (value) {
            NSMutableArray *tableModel = self.tableModelDic[value];
            if (tableModel.count > 0)
                [sortedAllObjects addObjectsFromArray:tableModel];
        }
    }
    if (predicate == nil) {
        return sortedAllObjects;
    }
    return [sortedAllObjects filteredArrayUsingPredicate:predicate];
}

- (void)reloadData {
    [self notifyListeners:[KBTableModelEvent reloadData:self]];
}

@end
