//
//  KBSelectableTableViewCell.h
//  WeiSh
//
//  Created by xulingjiao on 2017/9/6.
//  Copyright © 2017年 Kuaibao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KBRootSelectableTableViewCell.h"

@interface KBSelectableTableViewCell : KBRootSelectableTableViewCell

@property (strong, nonatomic) UIImage *selectCheckImage, *selectUncheckImage, *selectProhibitImage;
@property (assign, nonatomic) BOOL edit, prohibit, selectable;

- (void)setImageWithURLString:(NSString *)imageURLString placeholder:(UIImage *)placeholder;

- (void)setLogoImage:(UIImage *)logoImage;

- (void)setLogoImageURL:(NSURL *)logoImageURL
            placeholder:(UIImage *)placeholder;

- (void)setLogoImageURLString:(NSString *)logoImageURLString
            placeholder:(UIImage *)placeholder;

@end
