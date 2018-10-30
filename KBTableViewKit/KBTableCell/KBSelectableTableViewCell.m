//
//  KBSelectableTableViewCell.m
//  WeiSh
//
//  Created by xulingjiao on 2017/9/6.
//  Copyright © 2017年 Kuaibao. All rights reserved.
//

#import <YYKit/YYKit.h>
#import "KBSelectableTableViewCell.h"

@implementation KBSelectableTableViewCell

- (void)setLogoImage:(UIImage *)logoImage {
    self.myLogoImageView.image = logoImage;
    [self setNeedsLayout];
}

- (void)setLogoImageURLString:(NSString *)logoImageURLString
                  placeholder:(UIImage *)placeholder {
    NSURL *logoImageUrl = [NSURL URLWithString:logoImageURLString];
    [self setLogoImageURL:logoImageUrl
              placeholder:placeholder];
}

- (void)setLogoImageURL:(NSURL *)logoImageURL
            placeholder:(UIImage *)placeholder {
    if (self.myLogoImageView.image == nil) {
        self.myLogoImageView.image = placeholder;
    }
    [self.myLogoImageView setImageWithURL:logoImageURL
                            placeholder:placeholder
                                options:YYWebImageOptionAvoidSetImage
                             completion:^(UIImage * _Nullable image, NSURL * _Nonnull url, YYWebImageFromType from, YYWebImageStage stage, NSError * _Nullable error)
    {
        __weak __typeof(self) ws = self;
        if (image) {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                UIImage *scaleImage = [image imageByResizeToSize:placeholder.size];
                dispatch_async(dispatch_get_main_queue(), ^{
                    ws.myLogoImageView.image = scaleImage;
                });
            });
        }
        else {
            ws.myLogoImageView.image = placeholder;
        }
    }];
}

- (void)setImageWithURLString:(NSString *)imageURLString placeholder:(UIImage *)placeholder {
    if (self.imageView.image == nil) {
        self.imageView.image = placeholder;
    }
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

- (void)setProhibit:(BOOL)prohibit {
    _prohibit = prohibit;
    if (_prohibit)
        self.userInteractionEnabled = NO;
    else
        self.userInteractionEnabled = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    if (!self.selectable)
        return;
    self.userInteractionEnabled = YES;
    if (selected) {
        self.imageView.image = self.selectCheckImage;
    }
    else {
        if (self.edit) {
            if (self.prohibit) {
                self.userInteractionEnabled = NO;
                self.imageView.image = self.selectProhibitImage;
            }
            else {
                self.imageView.image = self.selectUncheckImage;
            }
        }
        else
            self.imageView.image = nil;
    }
}

@end
