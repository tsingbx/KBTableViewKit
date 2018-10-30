//
//  KBRootSelectableTableViewCell.h
//  WeiSh
//
//  Created by xulingjiao on 2017/9/6.
//  Copyright © 2017年 Kuaibao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KBRootTableCell.h"

@interface KBRootSelectableTableViewCell : KBRootTableCell

@property (nonatomic, weak, readonly) UIImageView *myLogoImageView;

- (void)setupUI;

@end
