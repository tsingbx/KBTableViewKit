//
//  KBTableModelEvent.h
//  KBCoreFun
//
//  Created by xulingjiao on 2017/8/8.
//  Copyright © 2017年 Kuaibao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum KBTableModelEventTypeEnum {
    KBTableModelEventTypeInsert,
    KBTableModelEventTypeUpdate,
    KBTableModelEventTypeDelete,
    KBTableModelEventTypeReloadData,
    KBTableModelEventTypeBeginUpdates,
    KBTableModelEventTypeEndUpdates,
}KBTableModelEventType;

@interface KBTableModelEvent : NSObject

@property (nonatomic, strong) id tableModel;

@property (nonatomic, assign) KBTableModelEventType eventType;

@property (nonatomic, strong) NSIndexPath *indexPath;

- (instancetype)initWithEventType:(KBTableModelEventType)eventType
                        indexPath:(NSIndexPath *)indexPath
                       tableModel:(id)tableModel;

+ (id)insertionAtRow:(NSInteger)row section:(NSInteger)section tableModel:(id)tableModel;

+ (id)updatedAtRow:(NSInteger)row section:(NSInteger)section tableModel:(id)tableModel;

+ (id)deletedAtRow:(NSInteger)row section:(NSInteger)section tableModel:(id)tableModel;

+ (id)reloadData:(id)tableModel;

+ (id)beginUpdates:(id)tableModel;

+ (id)endUpdates:(id)tableModel;

- (NSArray *)indexPaths;

@end
