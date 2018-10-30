//
//  KBRootSelectableTableViewCell.m
//  WeiSh
//
//  Created by xulingjiao on 2017/9/6.
//  Copyright © 2017年 Kuaibao. All rights reserved.
//
#import <Masonry/Masonry.h>
#import "KBRootSelectableTableViewCell.h"

#define kSelectableTableViewCellTitleColor [UIColor colorWithRed:66/255.0 green:66/255.0 blue:66/255.0 alpha:1.0]

#define kSelectableTableViewCellTitleFont [UIFont systemFontOfSize:17]

#define kSelectableTableViewCellDetailFont [UIFont systemFontOfSize:14]

#define kSelectableTableViewCellDetailColor [UIColor colorWithRed:149/255.0 green:149/255.0 blue:149/255.0 alpha:1.0]


@interface KBRootSelectableTableViewCell()

@property (nonatomic, weak) UIImageView *myLogoImageView;

@end

@implementation KBRootSelectableTableViewCell

- (void)setupUI {
    [self setupKBSelectableTableViewCell];
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    if (self.cellStyle == UITableViewCellStyleSubtitle) {
        [self.myImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).with.offset(15);
            make.size.mas_equalTo(self.myImageView.image.size);
            make.centerY.equalTo(self.contentView).with.offset(0);
        }];
        
        [self.myLogoImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            if (self.myImageView.image)
                make.left.equalTo(self.myImageView.mas_right).with.offset(15);
            else
                make.left.equalTo(self.myImageView.mas_right).with.offset(0);
            make.size.mas_equalTo(self.myLogoImageView.image.size);
            make.centerY.equalTo(self.contentView).with.offset(0);
        }];
        
        CGSize boudSize = CGSizeMake(self.bounds.size.width-30-self.myImageView.image.size.width-self.myLogoImageView.image.size.width, [UIScreen mainScreen].bounds.size.height);
        if (self.myImageView.image)
            boudSize.width -= 15;
        if (self.myLogoImageView.image)
            boudSize.width -= 15;
        if (self.accessoryView) {
            CGFloat accessoryViewWidth = (self.bounds.size.width - self.accessoryView.frame.origin.x)
            ;
            boudSize = CGSizeMake(self.bounds.size.width-30-accessoryViewWidth-self.myImageView.image.size.width-self.myLogoImageView.image.size.width, [UIScreen mainScreen].bounds.size.height);
            if (self.myImageView.image)
                boudSize.width -= 15;
            if (self.myLogoImageView.image)
                boudSize.width -= 15;
        }
        
        CGSize myTextLabelSize = [self.myTextLabel sizeThatFits:boudSize];
        CGSize myDetailLabelSize = [self.myDetailLabel sizeThatFits:boudSize];
        CGFloat top = (self.bounds.size.height - myTextLabelSize.height - myDetailLabelSize.height - 4)/2.0f;
        
        [self.myTextLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            if (self.myLogoImageView.image)
                make.left.equalTo(self.myLogoImageView.mas_right).with.offset(15);
            else
                make.left.equalTo(self.myLogoImageView.mas_right).with.offset(0);
            make.right.equalTo(self.contentView).with.offset(-15);
            make.top.equalTo(self.contentView).with.offset(top);
        }];
        
        [self.myDetailLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            if (self.myLogoImageView.image)
                make.left.equalTo(self.myLogoImageView.mas_right).with.offset(15);
            else
                make.left.equalTo(self.myLogoImageView.mas_right).with.offset(0);
            make.right.equalTo(self.contentView).with.offset(-15);
            make.top.mas_equalTo(self.myTextLabel.mas_bottom).with.offset(4);
        }];
    }
    else if (self.cellStyle == UITableViewCellStyleDefault) {
        
        [self.myImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).with.offset(15);
            make.size.mas_equalTo(self.myImageView.image.size);
            make.centerY.equalTo(self.contentView).with.offset(0);
        }];
        
        [self.myLogoImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            if (self.myImageView.image)
                make.left.equalTo(self.myImageView.mas_right).with.offset(15);
            else
                make.left.equalTo(self.myImageView.mas_right).with.offset(0);
            make.size.mas_equalTo(self.myLogoImageView.image.size);
            make.centerY.equalTo(self.contentView).with.offset(0);
        }];
        
        [self.myTextLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            if (self.myLogoImageView.image)
                make.left.equalTo(self.myLogoImageView.mas_right).with.offset(15);
            else
                make.left.equalTo(self.myLogoImageView.mas_right).with.offset(0);
            make.right.equalTo(self.contentView).with.offset(-15);
            make.centerY.equalTo(self.contentView).with.offset(0);
        }];
    }
    else if (self.cellStyle == UITableViewCellStyleValue1) {
        
        [self.myImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).with.offset(15);
            make.size.mas_equalTo(self.myImageView.image.size);
            make.centerY.equalTo(self.contentView).with.offset(0);
        }];
        
        [self.myLogoImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            if (self.myImageView.image)
                make.left.equalTo(self.myImageView.mas_right).with.offset(15);
            else
                make.left.equalTo(self.myImageView.mas_right).with.offset(0);
            make.size.mas_equalTo(self.myLogoImageView.image.size);
            make.centerY.equalTo(self.contentView).with.offset(0);
        }];
        
        [self.myTextLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            if (self.myLogoImageView.image)
                make.left.equalTo(self.myLogoImageView.mas_right).with.offset(15);
            else
                make.left.equalTo(self.myLogoImageView.mas_right).with.offset(0);
            make.centerY.equalTo(self.contentView).with.offset(0);
        }];
        
        [self.myDetailLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).with.offset(-15);
            make.centerY.equalTo(self.contentView).with.offset(0);
        }];
        
    }
    else if (self.cellStyle == UITableViewCellStyleValue2) {
        [self.myImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).with.offset(15);
            make.size.mas_equalTo(self.myImageView.image.size);
            make.centerY.equalTo(self.contentView).with.offset(0);
        }];
        
        [self.myLogoImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            if (self.myImageView.image)
                make.left.equalTo(self.myImageView.mas_right).with.offset(15);
            else
                make.left.equalTo(self.myImageView.mas_right).with.offset(0);
            make.size.mas_equalTo(self.myLogoImageView.image.size);
            make.centerY.equalTo(self.contentView).with.offset(0);
        }];
        
        [self.myTextLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            if (self.myLogoImageView.image)
                make.left.equalTo(self.myLogoImageView.mas_right).with.offset(15);
            else
                make.left.equalTo(self.myLogoImageView.mas_right).with.offset(0);
            make.centerY.equalTo(self.contentView).with.offset(0);
        }];
        
        [self.myDetailLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).with.offset(-15);
            make.centerY.equalTo(self.contentView).with.offset(0);
        }];
        
    }
    else {
        //todo
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"myImageView.image"]) {
        if (self.cellStyle == UITableViewCellStyleSubtitle) {
            [self.myImageView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(self.myImageView.image.size);
            }];
            [self.myLogoImageView mas_updateConstraints:^(MASConstraintMaker *make) {
                if (self.myImageView.image == nil)
                    make.left.equalTo(self.myImageView.mas_right).with.offset(0);
                else
                    make.left.equalTo(self.myImageView.mas_right).with.offset(15);
            }];
        }
        else if (self.cellStyle == UITableViewCellStyleDefault) {
            [self.myImageView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(self.myImageView.image.size);
            }];
            [self.myLogoImageView mas_updateConstraints:^(MASConstraintMaker *make) {
                if (self.myImageView.image == nil)
                    make.left.equalTo(self.myImageView.mas_right).with.offset(0);
                else
                    make.left.equalTo(self.myImageView.mas_right).with.offset(15);
            }];
        }
        else if (self.cellStyle == UITableViewCellStyleValue1) {
            [self.myImageView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(self.myImageView.image.size);
            }];
            [self.myLogoImageView mas_updateConstraints:^(MASConstraintMaker *make) {
                if (self.myImageView.image == nil)
                    make.left.equalTo(self.myImageView.mas_right).with.offset(0);
                else
                    make.left.equalTo(self.myImageView.mas_right).with.offset(15);
            }];
        }
        else if (self.cellStyle == UITableViewCellStyleValue2) {
            [self.myImageView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(self.myImageView.image.size);
            }];
            [self.myLogoImageView mas_updateConstraints:^(MASConstraintMaker *make) {
                if (self.myImageView.image == nil)
                    make.left.equalTo(self.myImageView.mas_right).with.offset(0);
                else
                    make.left.equalTo(self.myImageView.mas_right).with.offset(15);
            }];
        }
    }
    else if ([keyPath isEqualToString:@"myLogoImageView.image"]) {
        if (self.cellStyle == UITableViewCellStyleSubtitle) {
            [self.myImageView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(self.myImageView.image.size);
            }];
            [self.myLogoImageView mas_updateConstraints:^(MASConstraintMaker *make) {
                if (self.myImageView.image == nil)
                    make.left.equalTo(self.myImageView.mas_right).with.offset(0);
                else
                    make.left.equalTo(self.myImageView.mas_right).with.offset(15);
                make.size.mas_equalTo(self.myLogoImageView.image.size);
            }];
            [self.myTextLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                if (self.myLogoImageView.image)
                    make.left.equalTo(self.myLogoImageView.mas_right).with.offset(15);
                else
                    make.left.equalTo(self.myLogoImageView.mas_right).with.offset(0);
            }];
            [self.myDetailLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                if (self.myLogoImageView.image) make.left.equalTo(self.myLogoImageView.mas_right).with.offset(15);
                else make.left.equalTo(self.myLogoImageView.mas_right).with.offset(0);
            }];
        }
        else if (self.cellStyle == UITableViewCellStyleDefault) {
            [self.myImageView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(self.myImageView.image.size);
            }];
            [self.myLogoImageView mas_updateConstraints:^(MASConstraintMaker *make) {
                if (self.myImageView.image == nil)
                    make.left.equalTo(self.myImageView.mas_right).with.offset(0);
                else
                    make.left.equalTo(self.myImageView.mas_right).with.offset(15);
                make.size.mas_equalTo(self.myLogoImageView.image.size);
            }];
            [self.myTextLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                if (self.myLogoImageView.image)
                    make.left.equalTo(self.myLogoImageView.mas_right).with.offset(15);
                else
                    make.left.equalTo(self.myLogoImageView.mas_right).with.offset(0);
            }];
        }
        else if (self.cellStyle == UITableViewCellStyleValue1) {
            [self.myImageView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(self.myImageView.image.size);
            }];
            [self.myLogoImageView mas_updateConstraints:^(MASConstraintMaker *make) {
                if (self.myImageView.image == nil)
                    make.left.equalTo(self.myImageView.mas_right).with.offset(0);
                else
                    make.left.equalTo(self.myImageView.mas_right).with.offset(15);
                make.size.mas_equalTo(self.myLogoImageView.image.size);
            }];
            [self.myTextLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                if (self.myLogoImageView.image)
                    make.left.equalTo(self.myLogoImageView.mas_right).with.offset(15);
                else
                    make.left.equalTo(self.myLogoImageView.mas_right).with.offset(0);
            }];
        }
        else if (self.cellStyle == UITableViewCellStyleValue2) {
            [self.myImageView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(self.myImageView.image.size);
            }];
            [self.myLogoImageView mas_updateConstraints:^(MASConstraintMaker *make) {
                if (self.myImageView.image == nil)
                    make.left.equalTo(self.myImageView.mas_right).with.offset(0);
                else
                    make.left.equalTo(self.myImageView.mas_right).with.offset(15);
                make.size.mas_equalTo(self.myLogoImageView.image.size);
            }];
            [self.myTextLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                if (self.myLogoImageView.image)
                    make.left.equalTo(self.myLogoImageView.mas_right).with.offset(15);
                else
                    make.left.equalTo(self.myLogoImageView.mas_right).with.offset(0);
            }];
        }
    }
}

- (void)setupKBSelectableTableViewCell {
    
    NSInteger cellStyle = self.cellStyle;
    if (cellStyle == UITableViewCellStyleSubtitle) {
        [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        imageView.hidden = YES;
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).with.offset(15);
            make.size.mas_equalTo(imageView.image.size);
            make.centerY.equalTo(self.contentView).with.offset(0);
        }];
        self.myImageView = imageView;
        [self addObserver:self
               forKeyPath:@"myImageView.image"
                  options:NSKeyValueObservingOptionNew
                  context:nil];
        
        UIImageView *logoImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        logoImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:logoImageView];
        [logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imageView.mas_right).with.offset(0);
            make.size.mas_equalTo(logoImageView.image.size);
            make.centerY.equalTo(self.contentView).with.offset(0);
        }];
        self.myLogoImageView = logoImageView;
        [self addObserver:self
               forKeyPath:@"myLogoImageView.image"
                  options:NSKeyValueObservingOptionNew
                  context:nil];
        
        UILabel *textlabel = [[UILabel alloc] initWithFrame:CGRectZero];
        textlabel.font = kSelectableTableViewCellTitleFont;
        textlabel.textColor = kSelectableTableViewCellTitleColor;
        textlabel.hidden = YES;
        [self.contentView addSubview:textlabel];
        [textlabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(logoImageView.mas_right).with.offset(0);
            make.right.equalTo(self.contentView).with.offset(-15);
            make.bottom.mas_equalTo(self.contentView.mas_centerY).with.offset(-2);
        }];
        self.myTextLabel = textlabel;
        UILabel *detailLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        detailLabel.font = kSelectableTableViewCellDetailFont;
        detailLabel.textColor = kSelectableTableViewCellDetailColor;
        detailLabel.hidden = YES;
        [self.contentView addSubview:detailLabel];
        [detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(logoImageView.mas_right).with.offset(0);
            make.right.equalTo(self.contentView).with.offset(-15);
            make.top.mas_equalTo(self.contentView.mas_centerY).with.offset(2);
        }];
        self.myDetailLabel = detailLabel;
    }
    else if (cellStyle == UITableViewCellStyleDefault) {
        
        [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        imageView.hidden = YES;
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).with.offset(15);
            make.size.mas_equalTo(imageView.image.size);
            make.centerY.equalTo(self.contentView).with.offset(0);
        }];
        self.myImageView = imageView;
        [self addObserver:self
               forKeyPath:@"myImageView.image"
                  options:NSKeyValueObservingOptionNew
                  context:nil];
        
        UIImageView *logoImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        logoImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:logoImageView];
        [logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imageView.mas_right).with.offset(0);
            make.size.mas_equalTo(logoImageView.image.size);
            make.centerY.equalTo(self.contentView).with.offset(0);
        }];
        self.myLogoImageView = logoImageView;
        [self addObserver:self
               forKeyPath:@"myLogoImageView.image"
                  options:NSKeyValueObservingOptionNew
                  context:nil];
        
        UILabel *textlabel = [[UILabel alloc] initWithFrame:CGRectZero];
        textlabel.font = kSelectableTableViewCellTitleFont;
        textlabel.textColor = kSelectableTableViewCellTitleColor;
        textlabel.hidden = YES;
        [self.contentView addSubview:textlabel];
        [textlabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(logoImageView.mas_right).with.offset(0);
            make.right.equalTo(self.contentView).with.offset(-15);
            make.centerY.equalTo(self.contentView).with.offset(0);
        }];
        self.myTextLabel = textlabel;
    }
    else if (cellStyle == UITableViewCellStyleValue1) {
        
        [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        imageView.hidden = YES;
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).with.offset(15);
            make.size.mas_equalTo(imageView.image.size);
            make.centerY.equalTo(self.contentView).with.offset(0);
        }];
        self.myImageView = imageView;
        [self addObserver:self
               forKeyPath:@"myImageView.image"
                  options:NSKeyValueObservingOptionNew
                  context:nil];
        
        UIImageView *logoImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        logoImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:logoImageView];
        [logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imageView.mas_right).with.offset(0);
            make.size.mas_equalTo(logoImageView.image.size);
            make.centerY.equalTo(self.contentView).with.offset(0);
        }];
        self.myLogoImageView = logoImageView;
        [self addObserver:self
               forKeyPath:@"myLogoImageView.image"
                  options:NSKeyValueObservingOptionNew
                  context:nil];
        
        UILabel *textlabel = [[UILabel alloc] initWithFrame:CGRectZero];
        textlabel.font = kSelectableTableViewCellTitleFont;
        textlabel.textColor = kSelectableTableViewCellTitleColor;
        textlabel.textAlignment = NSTextAlignmentLeft;
        textlabel.hidden = YES;
        [self.contentView addSubview:textlabel];
        [textlabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(logoImageView.mas_right).with.offset(0);
            make.centerY.equalTo(self.contentView).with.offset(0);
        }];
        self.myTextLabel = textlabel;
        
        UILabel *detailLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        detailLabel.font = kSelectableTableViewCellDetailFont;
        detailLabel.textColor = kSelectableTableViewCellDetailColor;
        detailLabel.textAlignment = NSTextAlignmentRight;
        detailLabel.hidden = YES;
        [self.contentView addSubview:detailLabel];
        [detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).with.offset(-15);
            make.centerY.equalTo(self.contentView).with.offset(0);
        }];
        self.myDetailLabel = detailLabel;
    }
    else if (cellStyle == UITableViewCellStyleValue2) {
        
        [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        imageView.hidden = YES;
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).with.offset(15);
            make.size.mas_equalTo(imageView.image.size);
            make.centerY.equalTo(self.contentView).with.offset(0);
        }];
        self.myImageView = imageView;
        [self addObserver:self
               forKeyPath:@"myImageView.image"
                  options:NSKeyValueObservingOptionNew
                  context:nil];
        
        UIImageView *logoImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        logoImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:logoImageView];
        [logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imageView.mas_right).with.offset(0);
            make.size.mas_equalTo(logoImageView.image.size);
            make.centerY.equalTo(self.contentView).with.offset(0);
        }];
        self.myLogoImageView = logoImageView;
        [self addObserver:self
               forKeyPath:@"myLogoImageView.image"
                  options:NSKeyValueObservingOptionNew
                  context:nil];
        
        UILabel *textlabel = [[UILabel alloc] initWithFrame:CGRectZero];
        textlabel.font = kSelectableTableViewCellTitleFont;
        textlabel.textColor = kSelectableTableViewCellTitleColor;
        textlabel.textAlignment = NSTextAlignmentRight;
        textlabel.hidden = YES;
        [self.contentView addSubview:textlabel];
        [textlabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(logoImageView.mas_right).with.offset(0);
            make.centerY.equalTo(self.contentView).with.offset(0);
        }];
        self.myTextLabel = textlabel;
        
        UILabel *detailLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        detailLabel.font = kSelectableTableViewCellDetailFont;
        detailLabel.textColor = kSelectableTableViewCellDetailColor;
        detailLabel.textAlignment = NSTextAlignmentLeft;
        detailLabel.hidden = YES;
        [self.contentView addSubview:detailLabel];
        [detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).with.offset(-15);
            make.centerY.equalTo(self.contentView).with.offset(0);
        }];
        self.myDetailLabel = detailLabel;
    }
    else {
        //todo
    }
}

- (void)dealloc {
    if (_myLogoImageView) {
        @try {
            [self removeObserver:self
                      forKeyPath:@"myImageView.image"];
        } @catch (NSException *exception) {
            NSLog(@"%@", exception);
        } @finally {
            @try {
                [self removeObserver:self
                          forKeyPath:@"myLogoImageView.image"];
            } @catch (NSException *exception) {
                NSLog(@"%@", exception);
            } @finally {
            }
        }
    }
}

@end
