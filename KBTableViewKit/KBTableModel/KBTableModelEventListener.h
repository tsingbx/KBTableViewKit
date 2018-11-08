//
//  KBTableModelEventListener.h
//  KBCoreFun
//
//  Created by xulingjiao on 2017/8/8.

//

#import <UIKit/UIKit.h>
#import "KBTableModelEvent.h"

@protocol KBTableModelEventListener <NSObject>

- (void)tableModelChanged:(KBTableModelEvent *)event;

@end
