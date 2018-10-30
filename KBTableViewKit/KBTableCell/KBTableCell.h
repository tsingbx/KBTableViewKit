//
//  KBTableCell.h
//  WeiSh
//
//  Created by xulingjiao on 2017/8/9.
//  Copyright © 2017年 Kuaibao. All rights reserved.
//

#import "KBSelectableTableViewCell.h"

typedef enum KBTableCellStyleEnum {
    KBTableCellStyleTextField = kMinCustomStyle,
    KBTableCellStyleTextView,
    KBTableCellStyleColorTitleView,
    KBTableCellStyleCustom,
}KBTableCellStyle;

@interface KBTableCell : KBRootTableCell

- (void)setImageWithURLString:(NSString *)imageURLString placeholder:(UIImage *)placeholder;

@end
