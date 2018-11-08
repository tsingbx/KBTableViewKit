//
//  KBRootTableCellEntity.m

//
//  Created by xulingjiao on 2017/8/10.

//

#import <UIKit/UIKit.h>
#import "KBRootTableCellEntity.h"

@implementation KBRootTableCellEntity

synthesizeKBRootTableCellEntityProtocol

- (instancetype)init {
    self = [super init];
    if (self) {
        _cellStyle = UITableViewCellStyleDefault;
        _cellNameId = 0;
        _cellGroupId = 0;
    }
    return self;
}

- (instancetype)initWithNameId:(NSInteger)nameId {
    self = [super init];
    if (self) {
        _cellGroupId = 0;
        _cellNameId = nameId;
        _cellStyle = UITableViewCellStyleDefault;
    }
    return self;
}

- (instancetype)initWithStyle:(NSInteger)style nameId:(NSInteger)nameId {
    self = [super init];
    if (self) {
        _cellGroupId = 0;
        _cellNameId = nameId;
        _cellStyle = style;
    }
    return self;
}

- (instancetype)initWithGroupId:(NSInteger)groupId
                         nameId:(NSInteger)nameId {
    self = [super init];
    if (self) {
        _cellGroupId = groupId;
        _cellNameId = nameId;
        _cellStyle = UITableViewCellStyleDefault;
    }
    return self;
}

- (instancetype)initWithStyle:(NSInteger)style
                      groupId:(NSInteger)groupId
                       nameId:(NSInteger)nameId {
    self = [super init];
    if (self) {
        _cellGroupId = groupId;
        _cellNameId = nameId;
        _cellStyle = style;
    }
    return self;
}

- (NSString *)reuseIdentifier {
    NSString *idStr = [NSString stringWithFormat:@"%@%@", @(_cellNameId), @(_cellStyle)];
    return idStr;
}

@end
