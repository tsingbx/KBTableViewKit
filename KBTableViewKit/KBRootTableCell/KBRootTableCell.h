//
//  KBRootTableCell.h
//  WeiSh
//
//  Created by xulingjiao on 2017/12/18.
//  Copyright © 2017年 Kuaibao. All rights reserved.
//

#import "KBTableViewCellEntity.h"
#import "KBTableViewCell.h"

#define kMinCustomStyle 1000

@class KBRootTableCell;

@protocol KBTableCellDelegate <NSObject>

@optional

- (void)initCell:(KBRootTableCell *)rootCell nameId:(NSInteger)nameId;

- (void)configureCell:(KBRootTableCell *)rootCell
               entity:(id<KBRootTableCellEntityProtocol>)rootEntity;

@end

@interface KBRootTableCell : KBTableViewCell

@property (nonatomic, strong) id<KBRootTableCellEntityProtocol> entity;

@property (nonatomic, weak) id<KBTableCellDelegate> delegate;

@property (assign, nonatomic) NSInteger cellStyle;

@property (assign, nonatomic) NSInteger cellNameId;

@property (weak, nonatomic) UIImageView *myImageView;

@property (weak, nonatomic) UILabel *myTextLabel;

@property (weak, nonatomic) UILabel *myDetailLabel;

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier
                       nameId:(NSInteger)nameId;

- (instancetype)initWithEntity:(id<KBRootTableCellEntityProtocol>)entity;

- (KBTableViewCellEntity *)tableViewCellEntity;

- (void)customStyle:(NSInteger)style;

- (BOOL)configureTableViewCellEntity:(id<KBRootTableCellEntityProtocol>)entity;

- (void)setupUI;

@end
