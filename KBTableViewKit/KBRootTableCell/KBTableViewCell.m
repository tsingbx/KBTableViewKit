//
//  KBTableViewCell.m
//  KuaiDiYuan_S
//
//  Created by xulingjiao on 15/5/18.
//  Copyright (c) 2015年 KuaidiHelp. All rights reserved.
//

#import "KBTableViewCell.h"

//线条宽度
#define SINGLE_LINE_WIDTH           (1 / [UIScreen mainScreen].scale)

#define SINGLE_LINE_ADJUST_OFFSET   ((1 / [UIScreen mainScreen].scale) / 2)


typedef NS_ENUM(NSInteger, PositionType) {
    PositionTypeX,
    PositionTypeY
};

@interface KBTableViewCell()

@property (nonatomic, assign) NSRange topPosition; //上分割线线的X方向位置
@property (nonatomic, assign) NSRange bottomPosition; //下分割线线的X方向的位置

@property (nonatomic, strong) CAShapeLayer *topLine;
@property (nonatomic, strong) CAShapeLayer *bottomLine;

@end

@implementation KBTableViewCell

- (UIColor *)tableSeparatorColor {
    return [UIColor colorWithRed:234/255.0f green:234/255.0f blue:234/255.0f alpha:1.0f];
}

- (void)setup {
    
    UIImageView *backgroundImageView = [[UIImageView alloc] init];
    self.backgroundView = backgroundImageView;
    self.backgroundImageView = backgroundImageView;
    
    self.imageView.hidden = YES;
    self.textLabel.hidden = YES;
    self.detailTextLabel.hidden = YES;
    
    _yTopLine = 0;
    _yBottomLine = 0;
    _strokeColor = [self tableSeparatorColor];
    _strokeWidth = SINGLE_LINE_WIDTH;
    
    _topPosition = NSMakeRange(0, 0);
    _bottomPosition = NSMakeRange(0, 0);
    [self addTopLine];
    [self addBottomLine];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    view.backgroundColor = [UIColor colorWithRed:246.0/255.0 green:246.0/255.0 blue:246.0/255.0 alpha:1];
    self.selectedBackgroundView = view;
    
    self.accessoryType = UITableViewCellAccessoryNone;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style
                reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setStrokeWidth:(CGFloat)strokeWidth {
    _strokeWidth = strokeWidth;
    [self setNeedsLayout];
}

- (void)setSepStyle:(SeparatorStyle)sepStyle {
    _sepStyle = sepStyle;
    [self setNeedsLayout];
}

- (void)setStrokePosition:(NSRange)strokePosition {
    _topPosition = strokePosition;
    [self setNeedsLayout];
}

- (void)setBottomPosition:(NSRange)bottomPosition {
    _bottomPosition = bottomPosition;
    [self setNeedsLayout];
}

- (void)setSepStyle:(SeparatorStyle)sepStyle
        topPosition:(NSRange)topPosition
     bottomPosition:(NSRange)bottomPosition {
    self.sepStyle = SeparatorStyleNone;
    _sepStyle = sepStyle;
    _topPosition = topPosition;
    _bottomPosition = bottomPosition;
    [self setNeedsLayout];
}

- (void)setSepStyleForIndexPath:(NSIndexPath *)indexPath
                            off:(CGFloat)off
                      numOfRows:(NSInteger)numOfRows {
    float kWidth = self.bounds.size.width;
    if (indexPath.row == 0) {
        [self setSepStyle:SeparatorStyleBoth
              topPosition:NSMakeRange(0, kWidth)
           bottomPosition:NSMakeRange(off, kWidth-off)];
    } else {
        [self setSepStyle:SeparatorStyleBottomOnly
              topPosition:NSMakeRange(off, kWidth-off)
           bottomPosition:NSMakeRange(off, kWidth-off)];
    }
    
    if (indexPath.row == numOfRows-1) {
        if (numOfRows > 1)
            [self setSepStyle:SeparatorStyleBottomOnly
                  topPosition:NSMakeRange(off, kWidth-off)
               bottomPosition:NSMakeRange(0, kWidth)];
        else
            [self setSepStyle:SeparatorStyleBoth
                  topPosition:NSMakeRange(0, kWidth)
               bottomPosition:NSMakeRange(0, kWidth)];
    }
    [self setNeedsLayout];
}

- (void)setSepStyleForIndexPath:(NSIndexPath *)indexPath
                        leftOff:(CGFloat)leftOff
                       rightOff:(CGFloat)rightOff
                      numOfRows:(NSInteger)numOfRows {
    float kWidth = self.bounds.size.width;
    if (indexPath.row == 0) {
        [self setSepStyle:SeparatorStyleBoth
              topPosition:NSMakeRange(leftOff, kWidth-leftOff-rightOff)
           bottomPosition:NSMakeRange(leftOff, kWidth-leftOff-rightOff)];
    } else {
        [self setSepStyle:SeparatorStyleBottomOnly
              topPosition:NSMakeRange(leftOff, kWidth-leftOff-rightOff)
           bottomPosition:NSMakeRange(leftOff, kWidth-leftOff-rightOff)];
    }
    
    if (indexPath.row == numOfRows-1) {
        if (numOfRows > 1)
            [self setSepStyle:SeparatorStyleBottomOnly
                  topPosition:NSMakeRange(leftOff, kWidth-leftOff-rightOff)
               bottomPosition:NSMakeRange(leftOff, kWidth-leftOff-rightOff)];
        else
            [self setSepStyle:SeparatorStyleBoth
                  topPosition:NSMakeRange(leftOff, kWidth-leftOff-rightOff)
               bottomPosition:NSMakeRange(leftOff, kWidth-leftOff-rightOff)];
    }
    [self setNeedsLayout];
}


- (void)addTopLine {
    _topLine = [[CAShapeLayer alloc] init];
    _topLine.backgroundColor = [UIColor clearColor].CGColor;
    _topLine.fillColor       = [UIColor clearColor].CGColor;
    _topLine.strokeColor     = _strokeColor.CGColor;
    _topLine.lineWidth       = _strokeWidth;
    _topLine.allowsEdgeAntialiasing = NO;
    _topLine.contentsScale = [UIScreen mainScreen].scale;
    [self.layer addSublayer:_topLine];
}

- (void)addBottomLine {
    _bottomLine = [[CAShapeLayer alloc] init];
    _bottomLine.backgroundColor = [UIColor clearColor].CGColor;
    _bottomLine.fillColor       = [UIColor clearColor].CGColor;
    _bottomLine.strokeColor     = _strokeColor.CGColor;
    _bottomLine.lineWidth       = _strokeWidth;
    _bottomLine.allowsEdgeAntialiasing = NO;
    _bottomLine.contentsScale = [UIScreen mainScreen].scale;
    [self.layer addSublayer:_bottomLine];
}

- (void) layoutSubviews {

    [super layoutSubviews];
    
    if (_onImageViewFrame) {
        self.imageView.frame = _onImageViewFrame(self);
    }
    
    if (_onTextLabelFrame) {
        self.textLabel.frame = _onTextLabelFrame(self);
    }
    
    if (_onDetailTextLabelFrame)
        self.detailTextLabel.frame = _onDetailTextLabelFrame(self);
    
    CGRect rect = self.bounds;
    
    CGFloat offset = 0;
    if (((int)(self.strokeWidth * [UIScreen mainScreen].scale) + 1) % 2 == 0) {
        offset = SINGLE_LINE_ADJUST_OFFSET;
    }
    
    if (_topPosition.length <= 0)
        [self setStrokePosition:NSMakeRange(0, CGRectGetWidth(rect))];
    
    if (_bottomPosition.length <= 0)
        [self setBottomPosition:_topPosition];
    
    CGFloat left = [self adjustOffset:offset
                             position:_topPosition.location
                                 type:PositionTypeX];
    
    CGFloat right = [self adjustOffset:offset
                              position:NSMaxRange(_topPosition)
                                  type:PositionTypeX];
    
    CGFloat bottomLeft = [self adjustOffset:offset
                                   position:_bottomPosition.location
                                       type:PositionTypeX];
    
    CGFloat bottomRight = [self adjustOffset:offset
                                    position:NSMaxRange(_bottomPosition)
                                        type:PositionTypeX];
    
    CGFloat top = [self adjustOffset:offset
                            position:_yTopLine
                                type:PositionTypeY];
    
    CGFloat bottom = [self adjustOffset:offset
                               position:(CGRectGetMaxY(rect)-_yBottomLine)
                                   type:PositionTypeY];
    
    if (_sepStyle == SeparatorStyleNone) {
        _topLine.lineWidth = 0;
        _bottomLine.lineWidth = 0;
    }
    else if(_sepStyle == SeparatorStyleTopOnly) {
        _topLine.lineWidth = _strokeWidth;
        _topLine.strokeColor = _strokeColor.CGColor;
        _bottomLine.lineWidth = 0;
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(left, top)];
        [path addLineToPoint:CGPointMake(right, top)];
        _topLine.path = path.CGPath;
    }
    else if(_sepStyle == SeparatorStyleBottomOnly) {
        _topLine.lineWidth = 0;
        _bottomLine.lineWidth = _strokeWidth;
        _bottomLine.strokeColor = _strokeColor.CGColor;
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(bottomLeft, bottom)];
        [path addLineToPoint:CGPointMake(bottomRight, bottom)];
        _bottomLine.path = path.CGPath;
    }
    else if(_sepStyle == SeparatorStyleBoth) {
        _topLine.lineWidth = _strokeWidth;
        _topLine.strokeColor = _strokeColor.CGColor;
        UIBezierPath *topPath = [UIBezierPath bezierPath];
        [topPath moveToPoint:CGPointMake(left, top)];
        [topPath addLineToPoint:CGPointMake(right, top)];
        _topLine.path = topPath.CGPath;
        _bottomLine.lineWidth = _strokeWidth;
        _bottomLine.strokeColor = _strokeColor.CGColor;
        UIBezierPath *bottomPath = [UIBezierPath bezierPath];
        [bottomPath moveToPoint:CGPointMake(bottomLeft, bottom)];
        [bottomPath addLineToPoint:CGPointMake(bottomRight, bottom)];
        _bottomLine.path = bottomPath.CGPath;
    }
}

- (BOOL)isOdd:(CGFloat)v {
    return (((int)(v * [UIScreen mainScreen].scale) + 1) % 2 == 0);
}

- (CGFloat)adjustOffset:(CGFloat)offset position:(CGFloat)position type:(PositionType)type {
    CGFloat offsetPositon = position - offset;
    if (offsetPositon < 0)
        offsetPositon = offset;
    return offsetPositon;
}

- (UILabel *)textLabel {
    super.textLabel.hidden = NO;
    return super.textLabel;
}

- (UILabel *)detailTextLabel {
    super.detailTextLabel.hidden = NO;
    return super.detailTextLabel;
}

- (UIImageView *)imageView {
    super.imageView.hidden = NO;
    return super.imageView;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    if (touches.anyObject.view == self.backgroundImageView ||
        touches.anyObject.view == self.contentView) {
        self.backgroundImageView.highlighted = YES;
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
    if (touches.anyObject.view == self.backgroundImageView ||
        touches.anyObject.view == self.contentView) {
        self.backgroundImageView.highlighted = NO;
    }
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
    if (touches.anyObject.view == self.backgroundImageView ||
        touches.anyObject.view == self.contentView) {
        self.backgroundImageView.highlighted = NO;
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    if (touches.anyObject.view == self.backgroundImageView ||
        touches.anyObject.view == self.contentView) {
        self.backgroundImageView.highlighted = NO;
    }
}


@end
