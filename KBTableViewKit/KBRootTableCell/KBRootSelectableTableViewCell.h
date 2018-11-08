//
//  KBRootSelectableTableViewCell.h

//
//  Created by xulingjiao on 2017/9/6.

//

#import <UIKit/UIKit.h>
#import "KBRootTableCell.h"

@interface KBRootSelectableTableViewCell : KBRootTableCell

@property (nonatomic, weak, readonly) UIImageView *myLogoImageView;

- (void)setupUI;

@end
