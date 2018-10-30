//
//  KBRootTableCellEntity.h
//  WeiSh
//
//  Created by xulingjiao on 2017/8/10.
//  Copyright © 2017年 Kuaibao. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol KBRootTableCellEntityProtocol <NSObject>

@property (nonatomic, assign) NSInteger cellGroupId;

@property (nonatomic, assign) NSInteger cellNameId;

@property (nonatomic, assign) NSInteger cellStyle;

@property (nonatomic, assign) BOOL selected;

@property (nonatomic, strong, readonly) NSString *reuseIdentifier;

- (instancetype)initWithNameId:(NSInteger)nameId;

- (instancetype)initWithStyle:(NSInteger)style
                       nameId:(NSInteger)nameId;

- (instancetype)initWithGroupId:(NSInteger)groupId
                         nameId:(NSInteger)nameId;

- (instancetype)initWithStyle:(NSInteger)style
                      groupId:(NSInteger)groupId
                       nameId:(NSInteger)nameId;

@optional

@property (nonatomic, strong) NSString *imageName;

@property (nonatomic, strong) NSString *titleText;

@property (nonatomic, strong) NSString *detailText;

@end

#define synthesizeKBRootTableCellEntityProtocol  \
@synthesize cellGroupId = _cellGroupId; \
@synthesize cellNameId = _cellNameId; \
@synthesize cellStyle = _cellStyle; \
@synthesize selected = _selected;

@interface KBRootTableCellEntity : NSObject<KBRootTableCellEntityProtocol>

@end


