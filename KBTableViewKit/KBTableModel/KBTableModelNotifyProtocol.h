//
//  KBTableModelNotifyProtocol.h
//  KBCoreFun
//
//  Created by xulingjiao on 2017/8/8.

//

#import <Foundation/Foundation.h>
#import "KBTableModelEventListener.h"

@protocol KBTableModelNotifyProtocol <NSObject>

- (void)addEventListener:(id<KBTableModelEventListener>)listener;

- (void)removeEventListener:(id<KBTableModelEventListener>)listener;

- (void)notifyListeners:(KBTableModelEvent *)event;

@end
