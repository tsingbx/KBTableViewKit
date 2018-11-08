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

@property (nonatomic, strong, readonly) NSString *keyPath;

- (instancetype)initWithObjects:(NSArray *)objects;

- (instancetype)initWithObjects:(NSArray *)objects
                        keyPath:(NSString *)keyPath;

@end
