//
//  KBCollectionTableModel.h
//  KBCoreFun
//
//  Created by xulingjiao on 2017/8/8.

//

#import <Foundation/Foundation.h>
#import "KBTableModelProtocol.h"
#import "KBTableModelNotify.h"

@interface KBCollectionTableModel : KBTableModelNotify<KBTableModelProtocol>

- (instancetype)initWithObjects:(NSArray *)objects;

@end
