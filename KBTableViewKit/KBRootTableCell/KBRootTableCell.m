//
//  KBRootTableCell.m
//  WeiSh
//
//  Created by xulingjiao on 2017/12/18.
//  Copyright © 2017年 Kuaibao. All rights reserved.
//

#import <Masonry/Masonry.h>
#import "KBTableViewCellEntity.h"
#import "KBRootTableCell.h"

#define kRootTableViewCellTitleColor [UIColor colorWithRed:66/255.0 green:66/255.0 blue:66/255.0 alpha:1.0]

#define kRootTableViewCellTitleFont [UIFont systemFontOfSize:17]

#define kRootTableViewCellDetailFont [UIFont systemFontOfSize:14]

#define kRootTableViewCellDetailColor [UIColor colorWithRed:149/255.0 green:149/255.0 blue:149/255.0 alpha:1.0]


@interface KBRootTableCell ()

@end

@implementation KBRootTableCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initUITableViewCellStyle:UITableViewCellStyleDefault];
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    _cellStyle = style;
    _cellNameId = [reuseIdentifier integerValue];
    if (_cellStyle >= kMinCustomStyle) {
        self = [super initWithStyle:UITableViewCellStyleDefault
                    reuseIdentifier:reuseIdentifier];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.textLabel.textColor = kRootTableViewCellTitleColor;
        [self customStyle:style];
    }
    else {
        self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
        [self initUITableViewCellStyle:style];
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier
                       nameId:(NSInteger)nameId {
    _cellStyle = style;
    _cellNameId = nameId;
    if (_cellStyle >= kMinCustomStyle) {
        self = [super initWithStyle:UITableViewCellStyleDefault
                    reuseIdentifier:reuseIdentifier];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.textLabel.textColor = kRootTableViewCellTitleColor;
        [self customStyle:style];
    }
    else {
        self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
        [self initUITableViewCellStyle:style];
    }
    return self;
}

- (instancetype)initWithEntity:(id<KBRootTableCellEntityProtocol>)entity {
    _entity = entity;
    _cellStyle = entity.cellStyle;
    _cellNameId = entity.cellNameId;
    if (_cellStyle >= kMinCustomStyle) {
        self = [super initWithStyle:UITableViewCellStyleDefault
                    reuseIdentifier:entity.reuseIdentifier];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.textLabel.textColor = kRootTableViewCellTitleColor;
        [self customStyle:entity.cellStyle];
    }
    else {
        self = [super initWithStyle:entity.cellStyle
                    reuseIdentifier:entity.reuseIdentifier];
        [self initUITableViewCellStyle:_cellStyle];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (_cellStyle == UITableViewCellStyleSubtitle) {
        [self.myImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).with.offset(15);
            make.size.mas_equalTo(self.myImageView.image.size);
            make.centerY.equalTo(self.contentView).with.offset(0);
        }];
        
        CGSize boundSize = CGSizeMake(self.bounds.size.width-30-self.myImageView.image.size.width, [UIScreen mainScreen].bounds.size.height);
        if (self.myImageView.image)
            boundSize.width -= 15;
        if (self.accessoryView) {
            CGFloat accessoryViewWidth = (self.bounds.size.width - self.accessoryView.frame.origin.x)
            ;
            boundSize = CGSizeMake(self.bounds.size.width-30-accessoryViewWidth-self.myImageView.image.size.width, [UIScreen mainScreen].bounds.size.height);
            if (self.myImageView.image)
                boundSize.width -= 15;
        }
        CGSize myTextLabelSize = [self.myTextLabel sizeThatFits:boundSize];
        CGSize myDetailLabelSize = [self.myDetailLabel sizeThatFits:boundSize];
        CGFloat top = (self.bounds.size.height - myTextLabelSize.height - myDetailLabelSize.height - 4)/2.0f;
        [self.myTextLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            if (self.myImageView.image)
                make.left.equalTo(self.myImageView.mas_right).with.offset(15);
            else
                make.left.equalTo(self.myImageView.mas_right).with.offset(0);
            make.right.equalTo(self.contentView).with.offset(-15);
            make.top.mas_equalTo(self.contentView).with.offset(top);
        }];
        
        [self.myDetailLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            if (self.myImageView.image)
                make.left.equalTo(self.myImageView.mas_right).with.offset(15);
            else
                make.left.equalTo(self.myImageView.mas_right).with.offset(0);
            make.right.equalTo(self.contentView).with.offset(-15);
            make.top.mas_equalTo(self.myTextLabel.mas_bottom).with.offset(4);
        }];
    }
    else if (_cellStyle == UITableViewCellStyleDefault) {
        
        [self.myImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).with.offset(15);
            make.size.mas_equalTo(self.myImageView.image.size);
            make.centerY.equalTo(self.contentView).with.offset(0);
        }];
        
        [self.myTextLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            if (self.myImageView.image)
                make.left.equalTo(self.myImageView.mas_right).with.offset(15);
            else
                make.left.equalTo(self.myImageView.mas_right).with.offset(0);
            make.right.equalTo(self.contentView).with.offset(-15);
            make.centerY.equalTo(self.contentView).with.offset(0);
        }];
    }
    else if (_cellStyle == UITableViewCellStyleValue1) {
        
        [self.myImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).with.offset(15);
            make.size.mas_equalTo(self.myImageView.image.size);
            make.centerY.equalTo(self.contentView).with.offset(0);
        }];
        
        [self.myTextLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            if (self.myImageView.image)
                make.left.equalTo(self.myImageView.mas_right).with.offset(15);
            else
                make.left.equalTo(self.myImageView.mas_right).with.offset(0);
            make.centerY.equalTo(self.contentView).with.offset(0);
        }];
        
        [self.myDetailLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).with.offset(-15);
            make.centerY.equalTo(self.contentView).with.offset(0);
        }];
    }
    else if (_cellStyle == UITableViewCellStyleValue2) {
        
        [self.myImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).with.offset(15);
            make.size.mas_equalTo(self.myImageView.image.size);
            make.centerY.equalTo(self.contentView).with.offset(0);
        }];
        
        [self.myTextLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            if (self.myImageView.image)
                make.left.equalTo(self.myImageView.mas_right).with.offset(15);
            else
                make.left.equalTo(self.myImageView.mas_right).with.offset(0);
            make.centerY.equalTo(self.contentView).with.offset(0);
        }];
        
        [self.myDetailLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).with.offset(-15);
            make.centerY.equalTo(self.contentView).with.offset(0);
        }];
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"myImageView.image"]) {
        if (_cellStyle == UITableViewCellStyleSubtitle) {
            [self.myImageView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(self.myImageView.image.size);
            }];
            [self.myTextLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                if (self.myImageView.image == nil)
                    make.left.equalTo(self.myImageView.mas_right).with.offset(0);
                else
                    make.left.equalTo(self.myImageView.mas_right).with.offset(15);
            }];
            [self.myDetailLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                if (self.myImageView.image == nil)
                    make.left.equalTo(self.myImageView.mas_right).with.offset(0);
                else
                    make.left.equalTo(self.myImageView.mas_right).with.offset(15);
            }];
        }
        else if (_cellStyle == UITableViewCellStyleDefault) {
            [self.myImageView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(self.myImageView.image.size);
            }];
            [self.myTextLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                if (self.myImageView.image == nil)
                    make.left.equalTo(self.myImageView.mas_right).with.offset(0);
                else
                    make.left.equalTo(self.myImageView.mas_right).with.offset(15);
            }];
        }
        else if (_cellStyle == UITableViewCellStyleValue1) {
            [self.myImageView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(self.myImageView.image.size);
            }];
            [self.myTextLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                if (self.myImageView.image == nil)
                    make.left.equalTo(self.myImageView.mas_right).with.offset(0);
                else
                    make.left.equalTo(self.myImageView.mas_right).with.offset(15);
            }];
        }
        else if (_cellStyle == UITableViewCellStyleValue2) {
            [self.myImageView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(self.myImageView.image.size);
            }];
            [self.myTextLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                if (self.myImageView.image == nil)
                    make.left.equalTo(self.myImageView.mas_right).with.offset(0);
                else
                    make.left.equalTo(self.myImageView.mas_right).with.offset(15);
            }];
        }
    }
}

- (void)setupUI {
    /*
    if (_myImageView) {
        @try {
            [self removeObserver:self
                      forKeyPath:@"myImageView.image"];
        } @catch (NSException *exception) {
            NSLog(@"%@", exception);
        } @finally {
        }
    }*/
    if (_cellStyle == UITableViewCellStyleSubtitle) {
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
        
        UILabel *textlabel = [[UILabel alloc] initWithFrame:CGRectZero];
        textlabel.font = kRootTableViewCellTitleFont;
        textlabel.textColor = kRootTableViewCellTitleColor;
        textlabel.hidden = YES;
        [self.contentView addSubview:textlabel];
        [textlabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imageView.mas_right).with.offset(0);
            make.right.equalTo(self.contentView).with.offset(-15);
            make.bottom.mas_equalTo(self.contentView.mas_centerY).with.offset(-2);
        }];
        self.myTextLabel = textlabel;
        UILabel *detailLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        detailLabel.font = kRootTableViewCellDetailFont;
        detailLabel.textColor = kRootTableViewCellDetailColor;
        detailLabel.hidden = YES;
        [self.contentView addSubview:detailLabel];
        [detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imageView.mas_right).with.offset(0);
            make.right.equalTo(self.contentView).with.offset(-15);
            make.top.mas_equalTo(self.contentView.mas_centerY).with.offset(2);
        }];
        self.myDetailLabel = detailLabel;
    }
    else if (_cellStyle == UITableViewCellStyleDefault) {
        
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
        
        UILabel *textlabel = [[UILabel alloc] initWithFrame:CGRectZero];
        textlabel.font = kRootTableViewCellTitleFont;
        textlabel.textColor = kRootTableViewCellTitleColor;
        textlabel.hidden = YES;
        [self.contentView addSubview:textlabel];
        [textlabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imageView.mas_right).with.offset(0);
            make.right.equalTo(self.contentView).with.offset(-15);
            make.centerY.equalTo(self.contentView).with.offset(0);
        }];
        self.myTextLabel = textlabel;
    }
    else if (_cellStyle == UITableViewCellStyleValue1) {
        
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
        
        UILabel *textlabel = [[UILabel alloc] initWithFrame:CGRectZero];
        textlabel.font = kRootTableViewCellTitleFont;
        textlabel.textColor = kRootTableViewCellTitleColor;
        textlabel.textAlignment = NSTextAlignmentLeft;
        textlabel.hidden = YES;
        [self.contentView addSubview:textlabel];
        [textlabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imageView.mas_right).with.offset(0);
            make.centerY.equalTo(self.contentView).with.offset(0);
        }];
        self.myTextLabel = textlabel;
        
        UILabel *detailLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        detailLabel.font = kRootTableViewCellDetailFont;
        detailLabel.textColor = kRootTableViewCellDetailColor;
        detailLabel.textAlignment = NSTextAlignmentRight;
        detailLabel.hidden = YES;
        [self.contentView addSubview:detailLabel];
        [detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).with.offset(-15);
            make.centerY.equalTo(self.contentView).with.offset(0);
        }];
        self.myDetailLabel = detailLabel;
    }
    else if (_cellStyle == UITableViewCellStyleValue2) {
        
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
        
        UILabel *textlabel = [[UILabel alloc] initWithFrame:CGRectZero];
        textlabel.font = kRootTableViewCellTitleFont;
        textlabel.textColor = kRootTableViewCellTitleColor;
        textlabel.textAlignment = NSTextAlignmentRight;
        textlabel.hidden = YES;
        [self.contentView addSubview:textlabel];
        [textlabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imageView.mas_right).with.offset(0);
            make.centerY.equalTo(self.contentView).with.offset(0);
        }];
        self.myTextLabel = textlabel;
        
        UILabel *detailLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        detailLabel.font = kRootTableViewCellDetailFont;
        detailLabel.textColor = kRootTableViewCellDetailColor;
        detailLabel.textAlignment = NSTextAlignmentLeft;
        detailLabel.hidden = YES;
        [self.contentView addSubview:detailLabel];
        [detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).with.offset(-15);
            make.centerY.equalTo(self.contentView).with.offset(0);
        }];
        self.myDetailLabel = detailLabel;
    }
}

- (UIImageView *)imageView {
    if (self.myImageView) {
        self.myImageView.hidden = NO;
        return self.myImageView;
    }
    return super.imageView;
}

- (UILabel *)textLabel {
    if (self.myTextLabel) {
        self.myTextLabel.hidden = NO;
        return self.myTextLabel;
    }
    return super.textLabel;
}

- (UILabel *)detailTextLabel {
    if (self.myDetailLabel) {
        self.myDetailLabel.hidden = NO;
        return self.myDetailLabel;
    }
    return super.detailTextLabel;
}

- (void)initUITableViewCellStyle:(UITableViewCellStyle)style {
    [self setupUI];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.textLabel.textColor = kRootTableViewCellTitleColor;
    self.textLabel.font = kRootTableViewCellTitleFont;
    self.detailTextLabel.font = kRootTableViewCellDetailFont;
    self.detailTextLabel.textColor = kRootTableViewCellDetailColor;
}

- (void)setDelegate:(id<KBTableCellDelegate>)delegate {
    _delegate = delegate;
    if ([self.delegate respondsToSelector:@selector(initCell:nameId:)]) {
        [self.delegate initCell:self nameId:_cellNameId];
    }
}

- (void)setEntity:(id<KBRootTableCellEntityProtocol>)entity {
    _entity = entity;
    [self configureTableViewCellEntity:entity];
}

- (BOOL)configureTableViewCellEntity:(id<KBRootTableCellEntityProtocol>)entity {
    if (entity.cellStyle == UITableViewCellStyleDefault ||
        entity.cellStyle == UITableViewCellStyleValue1 ||
        entity.cellStyle == UITableViewCellStyleValue2 ||
        entity.cellStyle == UITableViewCellStyleSubtitle) {
        if ([entity respondsToSelector:@selector(titleText)])
            self.textLabel.text = entity.titleText;
        if ([entity respondsToSelector:@selector(detailText)])
            self.detailTextLabel.text = entity.detailText;
        if ([entity respondsToSelector:@selector(imageName)]) {
            if (entity.imageName.length > 0)
                self.imageView.image = [UIImage imageNamed:entity.imageName];
        }
        if ([self.delegate respondsToSelector:@selector(configureCell:entity:)]) {
            [self.delegate configureCell:self
                                  entity:entity];
        }
        return YES;
    }
    return NO;
}

- (void)customStyle:(NSInteger)style {
    [self setupUI];
}

- (KBTableViewCellEntity *)tableViewCellEntity {
    if ([self.entity isKindOfClass:[KBTableViewCellEntity class]])
        return  (KBTableViewCellEntity *)self.entity;
    return nil;
}

- (void)dealloc {
    if (_myImageView) {
        @try {
            [self removeObserver:self
                      forKeyPath:@"myImageView.image"];
        } @catch (NSException *exception) {
            NSLog(@"%@", exception);
        } @finally {
        }
    }
}

@end

