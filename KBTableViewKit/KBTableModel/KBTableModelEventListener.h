//
//  KBTableModelEventListener.h
//  KBCoreFun
//
//  Created by xulingjiao on 2017/8/8.
//  Copyright © 2017年 Kuaibao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KBTableModelEvent.h"

@protocol KBTableModelEventListener <NSObject>

- (void)tableModelChanged:(KBTableModelEvent *)event;

@end
