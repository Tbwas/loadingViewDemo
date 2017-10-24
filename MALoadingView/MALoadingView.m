//
//  MALoadingView.m
//  MALoadingView
//
//  Created by xindong on 17/10/24.
//  Copyright © 2017年 xindong. All rights reserved.
//

#import "MALoadingView.h"

#define R self.frame.size.height / 8

#define kCenterX self.center.x
#define kCenterY (self.center.y - self.frame.size.height / 6)

#define R_A 3.5
#define R_B 4
#define R_C 3
#define R_D 3
#define R_E 3
#define R_F 3
#define R_G 3
#define R_G 3
#define R_H 3

/***************************下面的宏已计算好, 勿改*******************************************/

#define RADIAN(_angle_) (_angle_ * M_PI / 180) // 弧度转角度

#define kDeviation (R * sin(RADIAN(45))) // 由于cos45° = sin45°, 故这里统一使用sin45°.

#define ORIGIN_A CGPointMake(kCenterX - R_A, kCenterY - R - R_A)
#define ORIGIN_B CGPointMake(kCenterX + kDeviation - R_B, kCenterY - kDeviation - R_B)
#define ORIGIN_C CGPointMake(kCenterX + R - R_C, kCenterY - R_C)
#define ORIGIN_D CGPointMake(kCenterX + kDeviation - R_D, kCenterY + kDeviation - R_D)
#define ORIGIN_E CGPointMake(kCenterX - R_E, kCenterY + R - R_E)
#define ORIGIN_F CGPointMake(kCenterX - kDeviation - R_F, kCenterY + kDeviation - R_F)
#define ORIGIN_G CGPointMake(kCenterX - R - R_G, kCenterY - R_G)
#define ORIGIN_H CGPointMake(kCenterX - kDeviation - R_H, kCenterY - kDeviation - R_H)

static CGFloat const kAnimationDuration = 1.0;

@interface MALoadingView ()

@property (nonatomic, strong) UIView *viewA;
@property (nonatomic, strong) UIView *viewB;
@property (nonatomic, strong) UIView *viewC;
@property (nonatomic, strong) UIView *viewD;
@property (nonatomic, strong) UIView *viewE;
@property (nonatomic, strong) UIView *viewF;
@property (nonatomic, strong) UIView *viewG;
@property (nonatomic, strong) UIView *viewH;

@end

@implementation MALoadingView

#pragma mark - Public

- (void)startLoading {
    [self ma_setupAnimation:self.viewA startAngle:-M_PI_2 endAngle:3 * M_PI / 2];
    [self ma_setupAnimation:self.viewB startAngle:-M_PI_4 endAngle:7 * M_PI / 4];
    [self ma_setupAnimation:self.viewC startAngle:0 endAngle:2 * M_PI];
    [self ma_setupAnimation:self.viewD startAngle:M_PI_4 endAngle:9 * M_PI / 4];
    [self ma_setupAnimation:self.viewE startAngle:M_PI_2 endAngle:5 * M_PI / 2];
    [self ma_setupAnimation:self.viewF startAngle:3 * M_PI / 4 endAngle:11 * M_PI / 4];
    [self ma_setupAnimation:self.viewG startAngle:M_PI endAngle:3 * M_PI];
    [self ma_setupAnimation:self.viewH startAngle:5 * M_PI / 4 endAngle:13 * M_PI / 4];
}

#pragma mark - Private

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self ma_createSubviews];
    }
    return self;
}

- (void)ma_createSubviews {
    [self addSubview:self.viewA];
    [self addSubview:self.viewB];
    [self addSubview:self.viewC];
    [self addSubview:self.viewD];
    [self addSubview:self.viewE];
    [self addSubview:self.viewF];
    [self addSubview:self.viewG];
    [self addSubview:self.viewH];
}

- (void)ma_setupAnimation:(UIView *)view startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle {
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGPoint centerPoint = CGPointMake(kCenterX, kCenterY);
    CGPoint newPoint = [self convertPoint:centerPoint fromView:self.superview];
    [path addArcWithCenter:newPoint radius:R startAngle:startAngle endAngle:endAngle clockwise:YES];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = path.CGPath;
    animation.duration = kAnimationDuration;
    animation.removedOnCompletion = NO;
    animation.repeatCount = MAXFLOAT;
    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [view.layer addAnimation:animation forKey:@"animation"];
}

#pragma mark - Lazy Loading

- (UIView *)viewA {
    if (!_viewA) {
        _viewA = [[UIView alloc] initWithFrame:CGRectMake(ORIGIN_A.x, ORIGIN_A.y, 2 * R_A, 2 * R_A)];
        _viewA.layer.cornerRadius = R_A;
        _viewA.backgroundColor = [UIColor whiteColor];
    }
    return _viewA;
}


- (UIView *)viewB {
    if (!_viewB) {
        _viewB = [[UIView alloc] initWithFrame:CGRectMake(ORIGIN_B.x, ORIGIN_B.y, 2 * R_B, 2 * R_B)];
        _viewB.layer.cornerRadius = R_B;
        _viewB.backgroundColor = [UIColor whiteColor];
    }
    return _viewB;
}

- (UIView *)viewC {
    if (!_viewC) {
        _viewC = [[UIView alloc] initWithFrame:CGRectMake(ORIGIN_C.x, ORIGIN_C.y, 2 * R_C, 2 * R_C)];
        _viewC.layer.cornerRadius = R_C;
        _viewC.backgroundColor = [UIColor whiteColor];
    }
    return _viewC;
}

- (UIView *)viewD {
    if (!_viewD) {
        _viewD = [[UIView alloc] initWithFrame:CGRectMake(ORIGIN_D.x, ORIGIN_D.y, 2 * R_D, 2 * R_D)];
        _viewD.layer.cornerRadius = R_D;
        _viewD.backgroundColor = [UIColor whiteColor];
    }
    return _viewD;
}

- (UIView *)viewE {
    if (!_viewE) {
        _viewE = [[UIView alloc] initWithFrame:CGRectMake(ORIGIN_E.x, ORIGIN_E.y, 2 * R_E, 2 * R_E)];
        _viewE.layer.cornerRadius = R_E;
        _viewE.backgroundColor = [UIColor whiteColor];
    }
    return _viewE;
}

- (UIView *)viewF {
    if (!_viewF) {
        _viewF = [[UIView alloc] initWithFrame:CGRectMake(ORIGIN_F.x, ORIGIN_F.y, 2 * R_F, 2 * R_F)];
        _viewF.layer.cornerRadius = R_F;
        _viewF.backgroundColor = [UIColor whiteColor];
    }
    return _viewF;
}

- (UIView *)viewG {
    if (!_viewG) {
        _viewG = [[UIView alloc] initWithFrame:CGRectMake(ORIGIN_G.x, ORIGIN_G.y, 2 * R_G, 2 * R_G)];
        _viewG.layer.cornerRadius = R_G;
        _viewG.backgroundColor = [UIColor whiteColor];
    }
    return _viewG;
}

- (UIView *)viewH {
    if (!_viewH) {
        _viewH = [[UIView alloc] initWithFrame:CGRectMake(ORIGIN_H.x, ORIGIN_H.y, 2 * R_H, 2 * R_H)];
        _viewH.layer.cornerRadius = R_H;
        _viewH.backgroundColor = [UIColor whiteColor];
    }
    return _viewH;
}


@end
