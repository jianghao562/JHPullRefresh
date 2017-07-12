//
//  CircleView.m
//  Test
//
//  Created by Jiang Hao on 2017/3/20.
//  Copyright © 2017年 Jiang Hao. All rights reserved.
//

#import "CircleView.h"
#import "Masonry.h"
@interface CircleView()
@property(strong,nonatomic)UIBezierPath *path;
@property(strong,nonatomic)CAShapeLayer *shapeLayer;
@property(strong,nonatomic)CAShapeLayer *bgLayer;

@end

@implementation CircleView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //子控件1
        CGRect circleBounds=CGRectMake(0, 0, 25, 25);
        _subCircleView=[[UIView alloc] initWithFrame:self.bounds];
        [self addSubview:_subCircleView];
        [_subCircleView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.offset(2.5);
            make.size.mas_equalTo(CGSizeMake(circleBounds.size.width, circleBounds.size.height));
            }];
        
        //执行动画
        CGAffineTransform transform = CGAffineTransformIdentity;
        _subCircleView.transform = CGAffineTransformRotate(transform, -M_PI / 2);
        _path = [UIBezierPath bezierPathWithOvalInRect:circleBounds];
        _bgLayer = [CAShapeLayer layer];
        _bgLayer.frame = circleBounds;
        _bgLayer.fillColor = [UIColor clearColor].CGColor;
        _bgLayer.lineWidth = 2.f;
//       _bgLayer.strokeColor = [UIColor whiteColor].CGColor;
        _bgLayer.strokeStart = 0.f;
        _bgLayer.strokeEnd = 1.f;
        _bgLayer.path = _path.CGPath;
        [_subCircleView.layer addSublayer:_bgLayer];
        
        _shapeLayer = [CAShapeLayer layer];
        _shapeLayer.frame = circleBounds;
        _shapeLayer.fillColor = [UIColor clearColor].CGColor;
        _shapeLayer.lineWidth = 2.f;
        _shapeLayer.lineCap = kCALineCapRound;
        _shapeLayer.strokeColor = [UIColor redColor].CGColor;
        _shapeLayer.strokeStart = 0.f;
        _shapeLayer.strokeEnd = 0.f;
        
        
        _shapeLayer.path = _path.CGPath;
        [_subCircleView.layer addSublayer:_shapeLayer];
        
        //子控件2
        UILabel *labelView=[[UILabel alloc] init];
        [self addSubview:labelView];
        [labelView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.subCircleView);
            make.size.mas_equalTo(CGSizeMake(circleBounds.size.width-10, circleBounds.size.height-10));
        }];
        //labelView.backgroundColor=[UIColor yellowColor];
        labelView.textAlignment=NSTextAlignmentCenter;
        labelView.text=@"￥";
        labelView.textColor=[UIColor grayColor];
        //labelView.font = [UIFont fontWithName:@"Helvetica-Bold" size:];
        //labelView.font = [UIFont systemFontOfSize:14];
        labelView.font = [UIFont boldSystemFontOfSize:14];

        
        
        }
    return self;
}


-(void)setValue:(CGFloat)value{
    _value = value;
    
    _shapeLayer.strokeEnd = value;
}


-(void)setLineColr:(UIColor *)lineColr{
    _lineColr=lineColr;
   _shapeLayer.strokeColor = lineColr.CGColor;
}



-(void)setLineWidth:(CGFloat)lineWidth{
    _lineWidth = lineWidth;
    _shapeLayer.lineWidth = lineWidth;
    _bgLayer.lineWidth = lineWidth;
}

@end
