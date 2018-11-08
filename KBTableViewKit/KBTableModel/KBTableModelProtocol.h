//
//  KBTableModelProtocol.h
//  KBCoreFun
//
//  Created by xulingjiao on 2017/8/8.

//

#import <UIKit/UIKit.h>
#import "KBTableModelNotifyProtocol.h"

@protocol KBTableModelProtocol <KBTableModelNotifyProtocol>

- (NSInteger)numberOfSections;

- (NSInteger)numberOfRowsInSection:(NSInteger)section;

- (id)objectAtIndexPath:(NSIndexPath *)indexPath;

- (NSIndexPath *)indexPathOfObject:(id)object;

- (NSIndexPath *)indexPathOfGroupId:(NSInteger)groupId nameId:(NSInteger)nameId;

- (id)firstObjectForSection:(NSInteger)section;

- (NSArray *)sectionIndexValueForKeyPath:(NSString *)keyPath;

- (BOOL)isEmpty;

- (void)reloadData;

@optional

- (void)setObjects:(NSArray *)objects;

- (void)addObjectsFromArray:(NSArray *)objects;

- (void)addObject:(id)anObject;

- (void)removeObject:(id)anObject;

- (void)removeObjects:(NSArray *)objects;

- (void)removeObjectAtIndexPath:(NSIndexPath *)indexPath;

- (void)insertObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath;

- (void)replaceObjectAtIndexPath:(NSIndexPath *)indexPath
                      withObject:(id)anObject;

- (NSArray *)filteredArrayUsingPredicate:(NSPredicate *)predicate;

@end
