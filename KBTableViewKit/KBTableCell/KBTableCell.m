//
//  KBTableCell.m
//  WeiSh
//
//  Created by xulingjiao on 2017/8/9.
//  Copyright © 2017年 Kuaibao. All rights reserved.
//
#import <YYKit/YYKit.h>
#import "KBTableCell.h"

@interface KBTableCell ()

@end

@implementation KBTableCell

- (BOOL)configureTableViewCellEntity:(id<KBRootTableCellEntityProtocol>)entity {
    if (![super configureTableViewCellEntity:entity]) {
        if ([self.delegate respondsToSelector:@selector(configureCell:entity:)]) {
            [self.delegate configureCell:self
                                  entity:entity];
        }
        return YES;
    }
    return NO;
}

- (void)customStyle:(NSInteger)style {
    [super customStyle:style];
}

- (void)setAccessoryType:(UITableViewCellAccessoryType)accessoryType {
    if (accessoryType == UITableViewCellAccessoryDisclosureIndicator) {
#if 0
        UIButton *nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        nextBtn.enabled = NO;
        nextBtn.frame = CGRectMake(0, 0, 7, 49);
        UIImage *image = kGlobalReturnRightImage;
        [nextBtn setImage:image forState:UIControlStateNormal];
        [nextBtn setImage:image forState:UIControlStateDisabled];
        self.accessoryView = nextBtn;
#endif
    }
    else {
        self.accessoryView = nil;
        super.accessoryType = accessoryType;
    }
}

- (void)setImageWithURLString:(NSString *)imageURLString placeholder:(UIImage *)placeholder {
    if (self.imageView.image == nil)
        self.imageView.image = placeholder;
    __weak __typeof(self) ws = self;
    if (imageURLString.length > 0) {
        NSURL *url = [NSURL URLWithString:imageURLString];
        [self.imageView setImageWithURL:url
                            placeholder:placeholder
                                options:YYWebImageOptionAvoidSetImage
                             completion:^(UIImage * _Nullable image, NSURL * _Nonnull url, YYWebImageFromType from, YYWebImageStage stage, NSError * _Nullable error)
         {
             if (image) {
                 dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                     UIImage *scaleImage = [image imageByResizeToSize:placeholder.size];
                     dispatch_async(dispatch_get_main_queue(), ^{
                         ws.imageView.image = scaleImage;
                     });
                 });
             }
             else {
                 ws.imageView.image = placeholder;
             }
         }];
    }
}

@end
