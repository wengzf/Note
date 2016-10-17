//
//  VSCOAnimation.m
//  SystemNavigation
//
//  Created by 翁志方 on 2016/10/14.
//  Copyright © 2016年 翁志方. All rights reserved.
//

#import "VSCOAnimation.h"



@interface VSCOAnimation()
{
    CAShapeLayer *squareLayer;
    CAShapeLayer *circleLayer;
    CAShapeLayer *lineLayer;
    
}
@end


@implementation VSCOAnimation

- (void)startAnimation
{
    // 动画队列管理
    
    CGFloat delay = 0;
    
    // 正方形出现
    {
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathAddRect(path, nil, CGRectMake(44, 128, 232, 232));
    
        squareLayer = [CAShapeLayer layer];
        squareLayer.path = path;
        squareLayer.fillColor = [UIColor clearColor].CGColor;
        [self.layer addSublayer:squareLayer];
        
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"lineWidth"];
        animation.fromValue = @2;
        animation.toValue = @10;
        animation.duration = 1;
        animation.fillMode = kCAFillModeBoth;
        
        animation.removedOnCompletion = NO;
        [squareLayer addAnimation:animation forKey:nil];
        
        CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"strokeColor"];
        animation2.fromValue = (id)[UIColor lightGrayColor].CGColor;
        animation2.toValue = (id)[UIColor blackColor].CGColor;
        animation2.duration = 1;
        animation2.fillMode = kCAFillModeBoth;
        animation2.removedOnCompletion = NO;
        [squareLayer addAnimation:animation2 forKey:nil];
    }
    
    // 圆形出现
    {
        delay = 1.0;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
            CGMutablePathRef path = CGPathCreateMutable();
            CGPathAddEllipseInRect(path, nil, CGRectMake(112, 196, 94, 94));
            
            circleLayer = [CAShapeLayer layer];
            circleLayer.path = path;
            circleLayer.fillColor = [UIColor clearColor].CGColor;
            circleLayer.strokeColor = [UIColor lightGrayColor].CGColor;
            [self.layer addSublayer:circleLayer];
            
            CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"lineWidth"];
            animation.fromValue = @1;
            animation.toValue = @10;
            animation.duration = 1;
            animation.fillMode = kCAFillModeForwards;
            
            animation.removedOnCompletion = NO;
            [circleLayer addAnimation:animation forKey:nil];
            
            CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"strokeColor"];
            animation2.fromValue = (id)[UIColor lightGrayColor].CGColor;
            animation2.toValue = (id)[UIColor blackColor].CGColor;
            animation2.duration = 1;
            animation2.fillMode = kCAFillModeBoth;
            animation2.removedOnCompletion = NO;
            
            [circleLayer addAnimation:animation2 forKey:nil];
        });
    }
    
    // 一竖出现
    {
        delay+=0.5;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

            CGMutablePathRef path = CGPathCreateMutable();
            CGPathMoveToPoint(path, nil, 47, 0);
            CGPathAddLineToPoint(path, nil, 47, 94);
            
            lineLayer = [CAShapeLayer layer];
            lineLayer.frame = CGRectMake(112, 196, 94, 94);
            lineLayer.path = path;
            lineLayer.fillColor = [UIColor clearColor].CGColor;
            lineLayer.strokeColor = [UIColor blackColor].CGColor;
            lineLayer.lineWidth = 10;
            [self.layer addSublayer:lineLayer];
            
            // 旋转
            CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
            animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
            animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(1.57, 0, 0, 1)];;
            animation.duration = 1;
            animation.fillMode = kCAFillModeForwards;
            animation.removedOnCompletion = NO;
            [lineLayer addAnimation:animation forKey:nil];
            
            // 变短
            CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"strokeColor"];
            animation2.fromValue = [UIColor lightGrayColor];
            animation2.toValue = [UIColor blackColor];
            animation2.duration = 1;
            animation2.fillMode = kCAFillModeBoth;
            animation2.removedOnCompletion = NO;
            
            [lineLayer addAnimation:animation2 forKey:nil];
        });
    }
    
    // 圆圈缩小放大并消失
    {
        delay += 1.0;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            CGMutablePathRef path = CGPathCreateMutable();
            CGPathAddEllipseInRect(path, nil, CGRectMake(112, 196, 94, 94));
            
            CGMutablePathRef path2 = CGPathCreateMutable();
            CGPathAddEllipseInRect(path2, nil, CGRectMake(112+47/2.0, 196+47/2.0, 47, 47));
            
            
            circleLayer.path = path;
            CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"lineWidth"];
            animation.fromValue = @10;
            animation.toValue = @40;
            animation.duration = 1;
            animation.fillMode = kCAFillModeForwards;
            
            animation.removedOnCompletion = NO;
            [circleLayer addAnimation:animation forKey:nil];
            
            CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"path"];
            animation2.fromValue = (__bridge id)path;
            animation2.toValue = (__bridge id)path2;
            animation2.duration = 1;
            animation2.fillMode = kCAFillModeBoth;
            animation2.removedOnCompletion = NO;
            
            [circleLayer addAnimation:animation2 forKey:nil];
        });
    }
    
    
    //
    
    
    
}

@end
