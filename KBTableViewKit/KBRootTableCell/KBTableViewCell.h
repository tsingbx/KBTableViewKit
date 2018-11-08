//
//  KBTableViewCell.h

//
//  Created by xulingjiao on 15/5/18.

//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SeparatorStyle) {
    SeparatorStyleNone,
    SeparatorStyleTopOnly,
    SeparatorStyleBottomOnly,
    SeparatorStyleBoth,
};

#define kNumOfRows(table,indexPath) ([(table).dataSource tableView:(table) numberOfRowsInSection:(indexPath).section])

#define kWidthRange NSMakeRange(0, [UIScreen mainScreen].bounds.size.width)

@interface KBTableViewCell : UITableViewCell

@property (nonatomic, weak) UIImageView *backgroundImageView;

@property (nonatomic, assign) SeparatorStyle sepStyle; //分割线类型
@property (nonatomic, assign) CGFloat yTopLine; //上分割线距离上边的距离
@property (nonatomic, assign) CGFloat yBottomLine; //下分割线距离下边的距离
@property (nonatomic, strong) UIColor *strokeColor; //线条颜色
@property (nonatomic, assign) CGFloat strokeWidth; //线条宽度

@property (copy, nonatomic) CGRect (^onImageViewFrame)(UITableViewCell *cell);
@property (copy, nonatomic) CGRect (^onTextLabelFrame)(UITableViewCell *cell);
@property (copy, nonatomic) CGRect (^onDetailTextLabelFrame)(UITableViewCell *cell);

- (void)setSepStyle:(SeparatorStyle)sepStyle
        topPosition:(NSRange)topPosition
     bottomPosition:(NSRange)bottomPosition;

- (void)setSepStyleForIndexPath:(NSIndexPath *)indexPath
                            off:(CGFloat)off
                      numOfRows:(NSInteger)numOfRows;

- (void)setSepStyleForIndexPath:(NSIndexPath *)indexPath
                        leftOff:(CGFloat)leftOff
                       rightOff:(CGFloat)rightOff
                      numOfRows:(NSInteger)numOfRows;

@end
