//
//  JYRefreshHeader.m
//  Test
//
//  Created by Jiang Hao on 2017/3/20.
//  Copyright © 2017年 Jiang Hao. All rights reserved.
//
#define progressValue 0.95

#import "JHRefreshHeader.h"
#import "Masonry.h"
#import "CircleView.h"

@interface JHRefreshHeader()<CAAnimationDelegate>
@property(nonatomic,weak) UISwitch *s;
@property(nonatomic,weak)UIView *vw;
@property(nonatomic,weak)UILabel *labelText;
@property(nonatomic,weak)CircleView *circleView;


@end

@implementation JHRefreshHeader

#pragma mark - 布局子控件
-(void)prepare
{
   
    [super prepare];
    
    UIView *vw=[[UIView alloc] init];
    self.vw=vw;
   [self addSubview:vw];
    //vw.backgroundColor=[UIColor redColor];
   // self.backgroundColor=[UIColor yellowColor];
     //环圈
    CircleView * circleView=[[CircleView alloc] init];
    //circleView.backgroundColor=[UIColor greenColor];
    self.circleView=circleView;
    [vw addSubview:circleView];
    circleView.lineColr=[UIColor grayColor];
    circleView.lineWidth=1.0f;
    //提示文字
    UILabel *lebelText=[[UILabel alloc] init];
    //lebelText.backgroundColor=[UIColor orangeColor];
    lebelText.font=[UIFont systemFontOfSize:14];
    _labelText.textColor=[UIColor darkGrayColor];
    self.labelText=lebelText;
    [vw addSubview:lebelText];
    

 
    


}

- (void)placeSubviews
{
    [super placeSubviews];
    
    __weak typeof(self) weakSelf=self;
    
    [_vw mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.width.mas_equalTo(90);
        make.center.height.equalTo(weakSelf).offset(10);
        
    }];
    
    [_circleView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.offset(0);
        make.centerY.equalTo(weakSelf.vw);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    [_labelText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.centerY.equalTo(weakSelf.vw);
    }];
    
    
    
    
    
    

}



#pragma mark - 监听滚动
// 监听scrollView的contentOffset改变
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change
{
    [super scrollViewContentOffsetDidChange:change];
    
}

// 监听scrollView的contentSize改变
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change
{
    [super scrollViewContentSizeDidChange:change];
    
}

//监听scrollView的拖拽状态改变
- (void)scrollViewPanStateDidChange:(NSDictionary *)change
{
    [super scrollViewPanStateDidChange:change];
    
}

//监听控件的刷新状态
- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState;
    
    switch (state) {
        case MJRefreshStateIdle:
          
             [_circleView.subCircleView.layer removeAllAnimations];
           
           // [self.loading stopAnimating];
            //[self.s setOn:NO animated:YES];
            
            self.labelText.text = @"下拉加载";
            
            break;
        case MJRefreshStatePulling:
           
            [_circleView.subCircleView.layer removeAllAnimations];
           
           // [self.loading stopAnimating];
            //[self.s setOn:YES animated:YES];
    
            self.labelText.text = @"松开加载";
            break;
        case MJRefreshStateRefreshing:
             [self setupAnimation:_circleView.subCircleView];
            self.labelText.text = @"加载中...";
            //[self.loading startAnimating];
            break;
        default:
           // [_circleView.subCircleView.layer removeAllAnimations];
            break;
    }
}

#pragma mark - 监听拖拽比例
- (void)setPullingPercent:(CGFloat)pullingPercent
{
    [super setPullingPercent:pullingPercent];
    
    if (pullingPercent>=progressValue) return;
    self.circleView.value=pullingPercent;
    
  // NSLog(@"ffff--%lf",pullingPercent);
    
    
}

//动画效果
-(void)setupAnimation:(UIView *)vw {
    CABasicAnimation *animation =  [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    //默认是顺时针效果，将fromValue和toValue值互换，则为逆时针效果
    animation.fromValue = [NSNumber numberWithFloat:0.f];
    animation.delegate=self;
    animation.toValue =  [NSNumber numberWithFloat: M_PI *2];
    animation.duration  = 1.5;
    animation.autoreverses = NO;
    animation.fillMode =kCAFillModeForwards;
    animation.repeatCount = MAXFLOAT;
    _circleView.value=progressValue;
    [vw. layer addAnimation:animation forKey:nil];
 }
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
   _circleView.value=0.0;
}

@end
