//
//  KBItemEntity.h

//
//  Created by xulingjiao on 2017/9/13.

//

#import "KBRootTableCellEntity.h"

@interface KBItemEntity : KBRootTableCellEntity

@property (nonatomic, strong) id item;

- (instancetype)initWithItem:(id)item;

- (instancetype)initWithNameId:(NSInteger)nameId item:(id)item;

- (instancetype)initWithGroupId:(NSInteger)groupId nameId:(NSInteger)nameId item:(id)item;

- (instancetype)initWithStyle:(NSInteger)style nameId:(NSInteger)nameId item:(id)item;

- (instancetype)initWithStyle:(NSInteger)style groupId:(NSInteger)groupId nameId:(NSInteger)nameId item:(id)item;

@end
