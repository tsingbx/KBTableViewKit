//
//  KBGroupTableModel.h
//  KBCoreFun
//
//  Created by xulingjiao on 2017/8/8.
//  Copyright © 2017年 Kuaibao. All rights reserved.
//

#import "KBTableModelProtocol.h"
#import "KBTableModelNotify.h"

@interface KBGroupTableModel : KBTableModelNotify<KBTableModelProtocol>

- (instancetype)initWithObjects:(NSArray *)objects
                        keyPath:(NSString *)keyPath
                sortDescriptors:(NSArray<NSSortDescriptor *>*)sortDescriptors;

@end
