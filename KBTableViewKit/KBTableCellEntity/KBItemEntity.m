//
//  KBItemEntity.m
//  WeiSh
//
//  Created by xulingjiao on 2017/9/13.
//  Copyright © 2017年 Kuaibao. All rights reserved.
//

#import "KBItemEntity.h"

@implementation KBItemEntity

- (instancetype)initWithItem:(id)item {
    self = [super initWithNameId:0];
    if (self) {
        _item = item;
    }
    return self;
}

- (instancetype)initWithNameId:(NSInteger)nameId item:(id)item {
    self = [super initWithNameId:nameId];
    if (self) {
        _item = item;
    }
    return self;
}

- (instancetype)initWithGroupId:(NSInteger)groupId nameId:(NSInteger)nameId item:(id)item {
    self = [super initWithGroupId:groupId
                           nameId:nameId];
    if (self) {
        _item = item;
    }
    return self;
}

- (instancetype)initWithStyle:(NSInteger)style nameId:(NSInteger)nameId item:(id)item {
    self = [super initWithStyle:style
                         nameId:nameId];
    if (self) {
        _item = item;
    }
    return self;
}

- (instancetype)initWithStyle:(NSInteger)style groupId:(NSInteger)groupId nameId:(NSInteger)nameId item:(id)item {
    self = [super initWithStyle:style
                        groupId:groupId
                         nameId:nameId];
    if (self) {
        _item = item;
    }
    return self;
}

@end
