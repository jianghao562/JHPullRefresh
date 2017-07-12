//
//  CircleView.h
//  Test
//
//  Created by Jiang Hao on 2017/3/20.
//  Copyright © 2017年 Jiang Hao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleView : UIView

@property(strong,nonatomic)UIView * subCircleView;
@property(assign,nonatomic)CGFloat startValue;
@property(assign,nonatomic)CGFloat lineWidth;
@property(assign,nonatomic)CGFloat value;
@property(strong,nonatomic)UIColor * lineColr;

@end
