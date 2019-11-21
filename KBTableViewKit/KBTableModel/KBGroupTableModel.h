//
//  KBGroupTableModel.h
//  KBCoreFun
//
//  Created by xulingjiao on 2017/8/8.

//

#import "KBTableModelProtocol.h"
#import "KBTableModelNotify.h"

@interface KBGroupTableModel : KBTableModelNotify<KBTableModelProtocol>

- (instancetype)initWithObjects:(NSArray<KBRootTableCellEntity *> *)objects
                sortDescriptors:(NSArray<NSSortDescriptor *>*)sortDescriptors;

- (instancetype)initWithObjects:(NSArray<KBRootTableCellEntity *> *)objects;

@end
